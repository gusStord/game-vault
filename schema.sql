-- GAME VAULT • Execute uma vez em um projeto Supabase novo.
-- ATENÇÃO: acesso público e aberto, adequado apenas para estudo/demonstração.
-- Qualquer visitante pode ler, criar, editar e excluir TODOS os jogos.
-- Para uma biblioteca privada, implemente autenticação e policies por proprietário.
begin;

create table public.games (
  id uuid primary key default gen_random_uuid(),
  title text not null check (char_length(btrim(title)) between 1 and 120),
  platform text not null check (platform in ('PC', 'PS5', 'Xbox', 'Switch', 'Mobile')),
  genre text check (char_length(genre) <= 60),
  status text not null default 'Quero jogar'
    check (status in ('Quero jogar', 'Jogando', 'Zerado', 'Abandonado')),
  rating smallint check (rating between 0 and 10),
  hours_played numeric not null default 0
    check (hours_played >= 0 and hours_played < 'Infinity'::numeric
      and hours_played <> 'NaN'::numeric),
  cover_url text check (cover_url is null or
    (char_length(cover_url) <= 2048 and cover_url ~* '^https://[^[:space:]]+$')),
  notes text check (char_length(notes) <= 3000),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create function public.set_game_updated_at()
returns trigger language plpgsql security invoker set search_path = '' as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

create trigger games_updated_at
before update on public.games
for each row execute function public.set_game_updated_at();

alter table public.games enable row level security;
grant usage on schema public to anon, authenticated;
grant select, insert, update, delete on public.games to anon, authenticated;

create policy "games_select" on public.games for select
to anon, authenticated using (true);

create policy "games_insert" on public.games for insert
to anon, authenticated with check (true);

create policy "games_update" on public.games for update
to anon, authenticated using (true) with check (true);

create policy "games_delete" on public.games for delete
to anon, authenticated using (true);

-- Sem dados de exemplo. Cadastre jogos e progresso reais pelo site.

commit;
