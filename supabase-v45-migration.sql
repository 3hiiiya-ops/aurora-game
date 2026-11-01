-- Run ONCE in Supabase SQL Editor if character_profiles already exists.
-- Allows the new long-haired girl variant without deleting existing profiles.
alter table public.character_profiles drop constraint if exists character_profiles_variant_check;
alter table public.character_profiles add constraint character_profiles_variant_check
 check (variant in ('girl', 'girl-long', 'boy'));
