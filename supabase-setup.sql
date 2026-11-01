-- aururo game v6: one immutable character per authenticated user.
create table if not exists public.character_profiles (
  user_id uuid primary key references auth.users(id) on delete cascade,
  variant text not null check (variant in ('girl','girl-long','boy')),
  palette integer not null check (palette between 0 and 2),
  created_at timestamptz not null default now()
);
alter table public.character_profiles enable row level security;
revoke all on public.character_profiles from anon;
grant select, insert on public.character_profiles to authenticated;
drop policy if exists "read own character" on public.character_profiles;
create policy "read own character" on public.character_profiles
 for select to authenticated using ((select auth.uid())=user_id);
drop policy if exists "create own character once" on public.character_profiles;
create policy "create own character once" on public.character_profiles
 for insert to authenticated with check ((select auth.uid())=user_id);
-- No UPDATE or DELETE policy: once created, no user-side edits.


-- Four staggered region schedules. 5 minutes visible, then 10 minutes absent.
-- Each region repeats every 15 minutes; phase offsets are stable across clients.
create or replace function public.aurora_cycle()
returns jsonb
language sql
stable
security invoker
set search_path = ''
as $$
 with t as (select floor(extract(epoch from now()))::bigint as epoch),
 states as (
  select i, ((epoch + (array[0,225,450,675])[i+1]) % 900 < 300) as visible
  from t cross join generate_series(0,3) as i
 )
 select jsonb_build_object(
  'cycle',floor(extract(epoch from now())/900)::bigint,
  'server_ms',floor(extract(epoch from now())*1000)::bigint,
  'active',(select jsonb_agg(visible order by i) from states)
 );
$$;
revoke all on function public.aurora_cycle() from public;
grant execute on function public.aurora_cycle() to anon, authenticated;
