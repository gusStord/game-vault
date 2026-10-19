# GAME VAULT

Biblioteca de jogos em HTML, CSS e JavaScript puro. O site lê e grava a biblioteca diretamente no Supabase. Sem uma conexão válida, exibe um erro e não cria dados fictícios.

## Conectar o Supabase

1. Crie um projeto em https://supabase.com/dashboard.
2. No SQL Editor de um projeto novo, execute `schema.sql` uma vez.
3. Em Project Settings → API, copie a URL e a chave pública anon. Dependendo da versão do painel, as opções aparecem em Data API e API Keys → Legacy API Keys.
4. Preencha `SUPABASE_URL` e `SUPABASE_ANON_KEY` no primeiro script de `index.html`. Nunca use `service_role` ou secret.
5. Reabra a página: o indicador deve mostrar “Supabase conectado”. Adicione, edite e exclua um jogo; recarregue para confirmar a persistência.

Se houver erro de tabela não encontrada, confirme se o schema `public` está exposto na Data API. O SQL inclui os GRANTs e as quatro policies.

## GitHub Pages

1. Crie um repositório público `game-vault`, com README inicial.
2. Envie `index.html`, `schema.sql` e `.nojekyll` para a raiz de `main`.
3. Em Settings → Pages, selecione Deploy from a branch → main → / (root) → Save.
4. Aguarde a implantação e abra a URL informada pelo GitHub.
5. Depois de preencher as duas constantes do HTML, faça um novo commit para atualizar o site.

O aplicativo não exige build nem dependências locais. Carrega Supabase JS 2.118.0 via CDN e fontes via Google Fonts. As capas já cadastradas vêm das lojas oficiais. Novos jogos aceitam uma URL HTTPS de capa; na ausência dela, o site mostra a inicial em gradiente.

## Modelo de acesso do exemplo

Conforme solicitado, as policies são públicas: qualquer visitante pode ler, inserir, alterar e apagar todos os registros. É uma coleção compartilhada de demonstração, sem isolamento por usuário. Use dados de estudo. Para uma biblioteca privada, implemente autenticação, um campo de proprietário e policies por proprietário.

A nota pode ficar vazia; nota zero conta na média. As estatísticas representam toda a biblioteca, enquanto os filtros alteram apenas a lista. Horas aceitam valores fracionários. O frontend pagina a leitura, limita o tempo das chamadas e detecta exclusões que não afetaram registros.


## Informações oficiais e progresso pessoal

As fichas de sete jogos foram consultadas nas páginas oficiais da Steam em 19/10/2026. O HTML inclui estúdio, publicadora, data de lançamento **na Steam**, gêneros e uma descrição resumida, com link para a fonte em cada card. Essas informações são um retrato da consulta, sem promessa de atualização automática. Não são inventadas fichas para títulos desconhecidos.

Horas, notas e anotações representam exclusivamente o que o usuário registrar. O campo “Sua nota média” não usa avaliações da crítica nem avaliações de outras pessoas. O SQL cria o banco vazio, sem INSERTs de exemplo. O aplicativo não tem modo de demonstração nem salvamento simulado em memória.
