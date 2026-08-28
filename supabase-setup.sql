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
