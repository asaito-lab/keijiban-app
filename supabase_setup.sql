-- Supabase SQL Editor で実行してください
create table if not exists public.posts (
  id bigint generated always as identity primary key,
  name text not null,
  body text not null,
  created_at timestamptz not null default now()
);

alter table public.posts enable row level security;

create policy "Allow public read" on public.posts
  for select using (true);

create policy "Allow public insert" on public.posts
  for insert with check (true);
