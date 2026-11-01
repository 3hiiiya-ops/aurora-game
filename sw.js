const CACHE='aurura-shell-v63';
const SHELL=['./index.html','./config.js','./manifest.webmanifest','./icon-180.png','./icon-192.png','./icon-512.png'];
self.addEventListener('install',event=>{
 event.waitUntil(caches.open(CACHE).then(async cache=>{
  await Promise.all(SHELL.map(async path=>{
   try{await cache.add(new Request(path,{cache:'reload'}));}catch(err){console.warn('cache skipped',path);}
  }));
 }).then(()=>self.skipWaiting()));
});
self.addEventListener('activate',event=>event.waitUntil(
 caches.keys().then(keys=>Promise.all(keys.filter(k=>k.startsWith('aurura-shell-')&&k!==CACHE).map(k=>caches.delete(k)))).then(()=>self.clients.claim())
));
self.addEventListener('fetch',event=>{
 const req=event.request,url=new URL(req.url);
 if(req.method!=='GET'||url.origin!==self.location.origin)return;
 if(req.mode==='navigate'){
  event.respondWith(fetch(req).catch(()=>caches.match('./index.html')));
  return;
 }
 if(!SHELL.some(path=>url.pathname===new URL(path,self.registration.scope).pathname))return;
 event.respondWith(fetch(req).then(res=>{
  if(res.ok){const copy=res.clone();event.waitUntil(caches.open(CACHE).then(c=>c.put(req,copy)));}
  return res;
 }).catch(()=>caches.match(req)));
});
