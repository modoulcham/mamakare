alter table public.patients
  add column if not exists gender text check (gender in ('female','male'));

alter table public.investigations
  add column if not exists lab_type text,
  add column if not exists result_data jsonb not null default '{}'::jsonb;

create index if not exists investigations_lab_type_idx
  on public.investigations (lab_type, created_at desc);
