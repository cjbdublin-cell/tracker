-- Run once in Supabase: SQL Editor → New query → paste → Run.

create table if not exists public.tracker_docs (
  user_id    uuid        not null default auth.uid() references auth.users (id) on delete cascade,
  doc_id     text        not null,
  data       jsonb       not null,
  updated_at timestamptz not null default now(),
  primary key (user_id, doc_id)
);

alter table public.tracker_docs enable row level security;

-- Each signed-in user can only see and change their own rows.
create policy "read own"   on public.tracker_docs for select using (auth.uid() = user_id);
create policy "insert own" on public.tracker_docs for insert with check (auth.uid() = user_id);
create policy "update own" on public.tracker_docs for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "delete own" on public.tracker_docs for delete using (auth.uid() = user_id);
