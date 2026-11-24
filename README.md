# API de Gestão de Torneio de Padel

Projeto final da disciplina de Desenvolvimento de Serviços e APIs.

## Sobre o Projeto e Regras do Torneio
API RESTful desenvolvida em Node.js para gerenciar um campeonato de padel no formato **Torneio Americano** ou **Super 8**, funcionando no sistema de pontos corridos.

Como o padel é um esporte jogado sempre em duplas (2 contra 2), a dinâmica do sistema funciona assim:
- **Inscrição Individual:** Os atletas se inscrevem sozinhos no campeonato, sem duplas fixas.
- **Duplas Rotativas:** A cada nova partida, 4 atletas inscritos são selecionados (ou sorteados) para formar duas duplas temporárias (Dupla 1 vs. Dupla 2). Quem jogou como parceiro em uma partida pode se enfrentar como adversário na próxima.
- **Formato das Partidas e Placar:** Os jogos seguem o formato de **melhor de 3 sets** (inspirado no circuito *Premier Padel*). Vence a partida a dupla que conquistar 2 sets primeiro, fazendo com que o placar final seja sempre **2-0** (vitória direta nos dois primeiros sets) ou **2-1** (decisão no terceiro set).
- **Pontuação Individual:** Ao finalizar uma partida e registrar o placar, os dois atletas da dupla vencedora recebem **1 vitória** e **3 pontos** na sua contagem individual, enquanto os dois atletas da dupla perdedora recebem **1 derrota**.
- **Classificação:** A tabela geral funciona no estilo pontos corridos, ordenando os atletas que acumularam mais pontos e vitórias ao longo das rodadas.

## Tecnologias e Requisitos
- **Backend:** Node.js, Express e Knex.js
- **Banco de Dados:** MySQL
- **Formato de Dados:** JSON
- **Autenticação:** OAuth2 (GitHub) para proteger rotas de criação, edição e exclusão
- **Padrão de Projeto:** MVC (Model-View-Controller)

## Estrutura do Projeto (MVC)
- `config/torneio_db.js`: Configuração da conexão com o banco de dados MySQL via Knex.
- `controllers/atletas.js` e `partidas.js`: Regras de negócio, cálculo de pontuação e comunicação com o banco.
- `routes/atletas_route.js` e `partidas_route.js`: Definição dos endpoints da API.
- `banco_torneio.sql`: Script SQL para criação do banco de dados e das tabelas.
- `index.js`: Arquivo principal de inicialização do servidor Express.

## Rotas Planejadas
- `POST /atletas` - Inscrever um novo atleta no torneio
- `GET /tabela` - Consultar a classificação geral ordenada por pontos e vitórias
- `POST /partidas` - Agendar uma nova partida manualmente (informando os 4 atletas)
- `POST /partidas/sortear` - Sortear 4 atletas inscritos e gerar uma partida automaticamente
- `GET /partidas` - Listar o histórico de partidas
- `PUT /partidas/:id` - Registrar placar, finalizar o jogo e atualizar a pontuação dos 4 atletas
- `DELETE /partidas/:id` - Cancelar/remover uma partida agendada


