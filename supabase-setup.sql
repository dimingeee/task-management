create table if not exists public.dashboard_state (
  id text primary key,
  records jsonb not null default '[]'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.dashboard_state enable row level security;

drop policy if exists "authenticated users can read dashboard" on public.dashboard_state;
create policy "authenticated users can read dashboard"
on public.dashboard_state for select
to authenticated
using (true);

drop policy if exists "authenticated users can insert dashboard" on public.dashboard_state;
create policy "authenticated users can insert dashboard"
on public.dashboard_state for insert
to authenticated
with check (true);

drop policy if exists "authenticated users can update dashboard" on public.dashboard_state;
create policy "authenticated users can update dashboard"
on public.dashboard_state for update
to authenticated
using (true)
with check (true);

revoke all on table public.dashboard_state from anon;
grant select, insert, update on table public.dashboard_state to authenticated;

-- PDF 첨부 저장용 Storage 버킷
insert into storage.buckets (id, name, public)
values ('case-pdfs', 'case-pdfs', true)
on conflict (id) do update set public = true;

drop policy if exists "authenticated can upload case pdfs" on storage.objects;
create policy "authenticated can upload case pdfs"
on storage.objects for insert
to authenticated
with check (bucket_id = 'case-pdfs');

drop policy if exists "authenticated can update case pdfs" on storage.objects;
create policy "authenticated can update case pdfs"
on storage.objects for update
to authenticated
using (bucket_id = 'case-pdfs')
with check (bucket_id = 'case-pdfs');

drop policy if exists "authenticated can delete case pdfs" on storage.objects;
create policy "authenticated can delete case pdfs"
on storage.objects for delete
to authenticated
using (bucket_id = 'case-pdfs');

drop policy if exists "public can read case pdfs" on storage.objects;
create policy "public can read case pdfs"
on storage.objects for select
to public
using (bucket_id = 'case-pdfs');
