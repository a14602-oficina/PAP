<div align="center">

<img src="htdocs/assets/logo.png" alt="SmartTable Logo" width="110" />

# SmartTable

### Sistema de Gestão de Restauração

**Digitaliza o serviço de mesa — do QR code ao recibo — sem papel, sem confusão.**

[![PHP](https://img.shields.io/badge/PHP-8.x-777BB4?style=flat-square&logo=php&logoColor=white)](https://php.net)
[![MySQL](https://img.shields.io/badge/MySQL%20%2F%20MariaDB-11.4-4479A1?style=flat-square&logo=mysql&logoColor=white)](https://mariadb.org)
[![JavaScript](https://img.shields.io/badge/JavaScript-ES6-F7DF1E?style=flat-square&logo=javascript&logoColor=black)](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
[![CSS3](https://img.shields.io/badge/CSS3-Responsivo-1572B6?style=flat-square&logo=css3&logoColor=white)](https://developer.mozilla.org/en-US/docs/Web/CSS)
[![Status](https://img.shields.io/badge/Estado-Em%20Produção-22c55e?style=flat-square&logo=checkmarx&logoColor=white)](https://smarttable.infinityfreeapp.com)
[![PAP](https://img.shields.io/badge/PAP-OFICINA%202026-c9a84c?style=flat-square)](https://github.com/a14602-oficina/PAP)

---

### 🌐 [smarttable.infinityfreeapp.com](https://smarttable.infinityfreeapp.com)

*Projeto de Aptidão Profissional (PAP) · Gonçalo Costa Ferreira · OFICINA Escola Profissional · 2026*

</div>

---

## Índice

- [Sobre o Projeto](#sobre-o-projeto)
- [Demonstração](#demonstração)
- [Funcionalidades](#funcionalidades)
- [Arquitetura e Fluxo de Serviço](#arquitetura-e-fluxo-de-serviço)
- [Stack Tecnológico](#stack-tecnológico)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Base de Dados](#base-de-dados)
- [Segurança](#segurança)
- [Instalação](#instalação)
- [Endpoints AJAX](#endpoints-ajax)
- [Resolução de Problemas](#resolução-de-problemas)
- [Autor](#autor)
- [Licença](#licença)

---

## Sobre o Projeto

O **SmartTable** nasceu de uma constatação simples: a maioria dos restaurantes ainda opera com cadernos de papel, comunicação verbal entre sala e cozinha e processos que dependem de memória humana. Erros de pedido, pratos esquecidos, filas de espera no pagamento — são problemas conhecidos, com solução tecnológica acessível.

Este projeto desenvolve essa solução do zero, em PHP e MySQL puros, sem frameworks externos, de forma a ser **alojável em qualquer servidor partilhado** sem custos de infraestrutura elevados.

O SmartTable cobre o ciclo completo de operação de um restaurante:

> O cliente senta-se, lê o QR code na mesa com o telemóvel (ou usa o tablet já disponível), escolhe as entradas e as bebidas. O pedido chega instantaneamente ao ecrã da cozinha e do bar. Quando a primeira bebida fica pronta, o menu do cliente desbloqueia automaticamente os pratos principais — sem que ninguém precise de dizer nada a ninguém. O empregado de mesa marca o prato como entregue; as sobremesas desbloqueiam. No final, um toque no painel de pagamentos gera o recibo e liberta a mesa.

Todo o fluxo acontece em **tempo real**, em qualquer dispositivo com browser, sem instalação de software adicional.

### Contexto académico

O SmartTable foi desenvolvido como **Projeto de Aptidão Profissional (PAP)** no curso técnico de informática da OFICINA – Escola Profissional, em Santo Tirso, no ano letivo 2025/2026. O objetivo era criar uma aplicação web completa e funcional, demonstrando domínio de desenvolvimento full-stack, segurança de aplicações web e design de sistemas de informação.

---

## Demonstração

| URL de produção | Repositório |
|-----------------|-------------|
| [smarttable.infinityfreeapp.com](https://smarttable.infinityfreeapp.com) | [github.com/a14602-oficina/PAP](https://github.com/a14602-oficina/PAP) |

O sistema está em produção e pode ser explorado. Para aceder aos painéis de staff é necessário o PIN de equipa (contactar o autor para credenciais de demonstração).

---

## Funcionalidades

### Menu digital para o cliente

- Acesso por **QR code** impresso na mesa ou por **tablet de mesa** já configurado
- Menu organizado por categorias: Entradas, Bebidas, Pratos e Sobremesas
- **Fluxo sequencial bloqueado por fases** — o cliente só vê os pratos quando o serviço avança, evitando pedidos fora de ordem
- **Personalizações por item** — cozedura, acompanhamentos, sem gelo, alergias
- **Notificações automáticas** em tempo real quando uma nova fase fica disponível (toast dourado, sem recarregar a página)
- Carrinho de compras com controlo de quantidades
- Chamada ao gerente com um toque

### Painel do Administrador

- **Gestão de mesas** — criar, editar, remover, definir tipo (quadrada, redonda, retangular) e capacidade
- **Gestão de utilizadores** — criar contas por perfil, ativar/desativar, associar RFID
- **Gestão do menu digital** — criar e editar itens, alterar preços, marcar como indisponível sem eliminar
- **Geração de QR codes** — um por mesa, descarregáveis individualmente, regeneráveis em bloco
- **Personalização visual completa** do sistema em tempo real: cores, tipografia, logótipo, imagem de fundo
- **Atribuição de mesas** a empregados de mesa
- **Planta do restaurante** — upload de SVG/PNG, visível nos painéis operacionais
- **Registo de cartões RFID** para autenticação sem teclado na cozinha e no bar
- Sidebar administrativa fixa com acesso rápido a todos os módulos

### Painel de Entrada / Receção

- Mapa visual com estado de todas as mesas em tempo real
- Atribuição de mesa ao cliente com registo de número de pessoas e hora de chegada
- Chamada ao gerente diretamente da receção

### Painel do Empregado de Mesa

- Vista das mesas atribuídas com pedidos ativos e estados
- Marcação de entradas/bebidas entregues
- Marcação de prato principal entregue — **desbloqueia as sobremesas** no menu do cliente automaticamente

### Painel da Cozinha

- Receção automática de todos os pedidos de comida, organizados por mesa
- Atualização a cada 10 segundos sem recarregar a página
- Transições de estado: Pendente → A preparar → Pronto
- Autenticação por **cartão RFID** (sem necessidade de teclado na bancada)

### Painel do Bar

- Igual à cozinha, mas exclusivo para pedidos de bebidas
- Marcar a primeira bebida como Pronta **desbloqueia os pratos** no menu do cliente
- Autenticação por RFID

### Painel do Gerente

- Lista de todas as chamadas de assistência pendentes com mesa de origem e mensagem
- Marcação de chamadas como resolvidas
- Atualização automática em tempo real

### Pagamentos e Recibos

- Lista de contas por pagar com detalhe completo dos pedidos
- Geração automática de código de pagamento único (`ST-[mesa]-[código]`)
- Recibo detalhado com todos os itens, quantidades e total
- Impressão ou exportação para PDF pelo browser
- Libertação automática da mesa após confirmação de pagamento

---

## Arquitetura e Fluxo de Serviço

### Padrão arquitetural

O SmartTable segue uma **arquitetura MVC simplificada sem framework externo**:

- Cada ficheiro PHP é um controlador que processa pedidos `POST`/`GET`
- A base de dados MySQL é o modelo de dados
- HTML/CSS/JS embutido nos ficheiros PHP forma as vistas

A comunicação entre painéis é feita por **polling AJAX** a cada 10 segundos — compatível com qualquer servidor partilhado, sem necessidade de WebSockets, SSE ou workers.

### Fluxo de serviço

```
┌─────────────────────────────────────────────────────────────────────────┐
│                                                                          │
│   [ENTRADA]  ──►  Mesa atribuída  ──►  Hora de chegada registada       │
│                         │                                                │
│                         ▼                                                │
│   [CLIENTE]  Acede ao menu via QR code ou tablet de mesa               │
│                │                                                         │
│                ├── Encomenda ENTRADAS  ──► [COZINHA]  A preparar       │
│                └── Encomenda BEBIDAS   ──► [BAR]      A preparar       │
│                                                │                         │
│                                  1ª bebida marcada "Pronta"            │
│                                                │                         │
│                                                ▼                         │
│                              ✅  PRATOS desbloqueados                   │
│                              📲  Notificação automática ao cliente      │
│                                                │                         │
│   [CLIENTE]  Encomenda PRATO PRINCIPAL  ──► [COZINHA]  A preparar     │
│                                                │                         │
│   [EMPREGADO]  Marca prato entregue ──────────┘                        │
│                         │                                                │
│                         ▼                                                │
│                ✅  SOBREMESAS desbloqueadas                             │
│                📲  Notificação automática ao cliente                    │
│                         │                                                │
│   [CLIENTE]  Encomenda SOBREMESA  ──► [COZINHA]  A preparar           │
│                         │                                                │
│                         ▼                                                │
│   [PAGAMENTO]  Recibo gerado  ──►  Mesa libertada  ──►  Ciclo reinicia │
│                                                                          │
└─────────────────────────────────────────────────────────────────────────┘
```

### Gestão de sessões

O alojamento InfinityFree não permite alterar `gc_maxlifetime` via `ini_set`. Para contornar esta limitação, as sessões PHP são **persistidas diretamente na base de dados** (tabela `php_sessions`) com validade de 7 dias. A classe `DBSessionHandler` implementa a interface `SessionHandlerInterface` do PHP.

Um mecanismo de **cookie persistente** (`remember_token`) com rotação automática a cada utilização garante que a sessão é recuperada mesmo após fechar o browser.

### Proteção de acesso — PIN de equipa

A página inicial apresenta três opções de acesso ao staff. Ao clicar em qualquer delas, é exigido um PIN de equipa validado em `index_unlock.php` com `hash_equals()`. Os QR codes das mesas acedem diretamente ao menu do cliente, contornando este PIN.

### Notificações em tempo real ao cliente

`assets/dessert_watch.js` faz polling silencioso ao endpoint `mesa_status.php` a cada 10 segundos. Ao detetar uma mudança de estado (`main_unlocked` ou `dessert_unlocked`), mostra um **toast visual** e desbloqueia os cartões da categoria correspondente — sem recarregar a página.

---

## Stack Tecnológico

| Camada | Tecnologia | Utilização |
|--------|-----------|-----------|
| Backend | PHP 8.x | Lógica de servidor, sessões, autenticação, AJAX |
| Base de dados | MySQL / MariaDB 11.4 | 12 tabelas relacionais |
| Frontend | HTML5 + CSS3 | Estrutura e identidade visual com variáveis CSS dinâmicas |
| Interatividade | JavaScript ES6 | AJAX, modais, polling, notificações, bfcache guard |
| Alojamento | InfinityFree | Servidor partilhado PHP/MySQL |
| Segurança passwords | bcrypt | `password_hash()` + `password_verify()` |
| Segurança queries | Prepared Statements | `bind_param()` em todas as queries |
| Autenticação hardware | RFID (USB HID) | Cozinha e bar sem teclado |

**Sem frameworks externos. Sem Composer. Sem npm. Corre em qualquer servidor partilhado.**

---

## Estrutura do Projeto

```
PAP/
│
├── README.md
├── database/
│   └── smarttable.sql                 ← script completo de criação da BD
│
└── htdocs/                            ← raiz pública do servidor web
    │
    ├── config/
    │   └── db.php                     ← ligação MySQL + fuso horário
    │
    ├── assets/
    │   ├── style.css                  ← estilos principais + variáveis de tema dinâmico
    │   ├── responsive.css             ← responsividade completa (4 breakpoints)
    │   ├── responsive_global.css      ← estilos responsivos globais
    │   ├── sidebar_admin.css          ← sidebar administrativa
    │   ├── auto_refresh.js            ← polling AJAX a cada 10 segundos
    │   ├── bfcache_guard.js           ← força reload ao detetar navegação bfcache
    │   ├── dessert_watch.js           ← notificações de desbloqueio ao cliente
    │   ├── keep_session.js            ← ping de sessão a cada 60 segundos
    │   ├── notifications.js           ← notificações entre painéis de staff
    │   ├── rfid_icon.svg              ← ícone do botão de autenticação RFID
    │   ├── logo.png                   ← logótipo do SmartTable
    │   ├── favicon.ico / favicon.png
    │   └── ...
    │
    │   ── AUTENTICAÇÃO E ARRANQUE ──────────────────────────────────────
    ├── index.php                      ← página principal (3 opções de acesso)
    ├── index_unlock.php               ← validação do PIN de equipa
    ├── login.php                      ← autenticação password ou RFID
    ├── registo.php                    ← criação do primeiro administrador ⚠️ remover após uso
    ├── logout.php                     ← encerramento de sessão + limpeza de cookies
    │
    │   ── UTILITÁRIOS DE SISTEMA ──────────────────────────────────────
    ├── auth_check.php                 ← verifica autenticação e recupera sessão por cookie
    ├── session_handler.php            ← DBSessionHandler (SessionHandlerInterface)
    ├── session_config.php             ← configuração de cookies e parâmetros de sessão
    ├── session_ping.php               ← endpoint de manutenção de sessão ativa
    ├── service_flow.php               ← funções do fluxo sequencial de serviço
    ├── notifications.php              ← polling de notificações entre painéis
    ├── theme.php                      ← injeção de variáveis CSS da personalização visual
    ├── error_config.php               ← gestão de erros: log, sem display, headers anti-cache
    │
    │   ── PAINEL DO ADMINISTRADOR ─────────────────────────────────────
    ├── admin_dashboard.php            ← dashboard com 9 módulos de gestão
    ├── sidebar_admin.php              ← sidebar administrativa reutilizável
    ├── gestao_mesas.php               ← CRUD de mesas
    ├── gestao_utilizadores.php        ← CRUD de utilizadores
    ├── gestao_menus.php               ← CRUD do menu digital
    ├── gestao_qrcodes.php             ← geração e download de QR codes por mesa
    ├── qr_data.php                    ← QR codes pré-gerados em base64
    ├── personalizacao_dashboard.php   ← personalização visual em tempo real
    ├── atribuir_mesas.php             ← atribuição de mesas a empregados
    ├── gestao_restaurante.php         ← upload da planta + estatísticas
    ├── registar_cartao.php            ← registo de cartões RFID para staff
    │
    │   ── PAINÉIS OPERACIONAIS ────────────────────────────────────────
    ├── entrada_dashboard.php          ← receção: mapa de mesas + atribuição a clientes
    ├── empregado_mesa_dashboard.php   ← mesas atribuídas + marcação de entregas
    ├── cozinha_dashboard.php          ← pedidos de comida em tempo real
    ├── bar_dashboard.php              ← pedidos de bebidas em tempo real
    ├── gerente_dashboard.php          ← chamadas de assistência
    ├── pagamento_dashboard.php        ← processamento de contas
    ├── recibo.php                     ← visualização e impressão de recibo
    │
    │   ── PAINÉIS DO CLIENTE ──────────────────────────────────────────
    ├── mesa_dashboard.php             ← seleção de mesa pelo tablet (com filtros por tipo)
    ├── menu_dashboard.php             ← menu digital + carrinho + envio de pedido
    └── mesa_status.php                ← endpoint AJAX: estado de desbloqueio da mesa
```

---

## Base de Dados

O script SQL completo está disponível em [`database/smarttable.sql`](database/smarttable.sql).

### Diagrama de tabelas

```
users                orders              menus
──────               ──────              ──────
id (PK)              id (PK)             id (PK)
username             table_number        name
password (bcrypt)    total               description
role (ENUM)          status (ENUM)       category (ENUM)
active               payment_code        price
name                 created_at          status (ENUM)
email                payment_req_at
rfid_code                │
remember_token           │         order_items
remember_expires         └────────► id (PK)
                                    order_id (FK)
tables                              menu_id
──────                              name
id (PK)              bar_orders     price
number (UNIQUE)      ──────────     quantity
capacity             id (PK)        subtotal
occupied_seats       order_id       customization
status (ENUM)        table_number   category
type_table (ENUM)    item_name
arrival_time         quantity
last_activity        customization
main_unlocked        status (ENUM)
dessert_unlocked      created_at
main_unlocked_at
main_delivered_at    waiter_tables     manager_calls
dessert_unlocked_at  ─────────────     ─────────────
entries_delivered_at  id (PK)          id (PK)
                      waiter_id (FK)   table_number
system_settings       table_number     message
───────────────                        status (ENUM)
id=1 (singleton)     restaurant_map    created_at
restaurant_name      ──────────────    resolved_at
primary_color        id (PK)
secondary_color      filename          order_movements
background_color     label             ───────────────
text_color           ativo             id (PK)
font_family          uploaded_at       order_id (FK)
logo                                   status
...21 colunas        php_sessions      message
                     ────────────      created_at
                     id (PK)
                     data
                     updated_at
```

### Tabelas em detalhe

| Tabela | Registos actuais | Descrição |
|--------|-----------------|-----------|
| `users` | 5 | Funcionários com bcrypt, RFID opcional e token de sessão persistente |
| `tables` | 20 | Mesas com estado, capacidade, tipo e todo o estado do fluxo de serviço |
| `menus` | 19 | Itens do menu com categoria, preço e visibilidade |
| `orders` | 9 | Pedidos com ciclo de vida completo (aberto → pago) e código de pagamento |
| `order_items` | 9 | Detalhe de cada pedido com preço no momento e personalizações |
| `bar_orders` | 4 | Pedidos de bebidas para o painel independente do bar |
| `waiter_tables` | 16 | Atribuições ativas de mesas a empregados |
| `manager_calls` | 8 | Chamadas de assistência resolvidas e pendentes |
| `system_settings` | 1 | Linha única com toda a configuração visual do sistema |
| `php_sessions` | variável | Sessões PHP persistidas com validade de 7 dias |
| `restaurant_map` | 1 | Referência ao ficheiro SVG da planta ativa |
| `order_movements` | 17 | Histórico auditável de todas as transições de estado |

---

## Segurança

O sistema foi desenvolvido seguindo as recomendações da **OWASP** para aplicações PHP:

| Ameaça | Medida | Implementação |
|--------|--------|--------------|
| SQL Injection | Prepared Statements | `bind_param()` em **todas** as queries — sem interpolação de variáveis |
| Força bruta de passwords | bcrypt | `password_hash(PASSWORD_BCRYPT)` + `password_verify()` |
| XSS | Validação de inputs | Whitelist para campos ENUM; `intval()` para inteiros |
| Session hijacking | Cookies HttpOnly | `HttpOnly` em cookies de sessão e `remember_token` |
| Session fixation | Token rotation | `remember_token` regenerado a cada autenticação |
| Acesso não autorizado | Verificação por página | `auth_check.php` valida perfil em cada request |
| Acesso de clientes ao staff | PIN de equipa | `hash_equals()` + whitelist de destinos em `index_unlock.php` |
| Cache de páginas privadas | Headers anti-cache | `Cache-Control: no-store` definido em `error_config.php` |
| Navegação bfcache | Guard JS | `bfcache_guard.js` força reload ao detetar `event.persisted = true` |
| Exposição de erros | Log centralizado | `display_errors = Off`; erros em `php_errors.log` |
| Session timeout | BD persistente | `php_sessions` com `updated_at`; GC a cada request |

---

## Instalação

### Pré-requisitos

- PHP **8.0 ou superior** com extensões: `mysqli` `session` `json` `openssl` `mbstring`
- MySQL **5.7+** ou MariaDB **10.3+**
- Servidor web Apache (com `mod_rewrite`) ou Nginx
- Acesso de escrita à pasta `htdocs/uploads/`

---

### Opção A — Servidor de produção

**1. Clonar o repositório**

```bash
git clone https://github.com/a14602-oficina/PAP.git
cd PAP
```

**2. Criar a base de dados**

```sql
CREATE DATABASE smarttable
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;
```

Executar o script completo:

```bash
mysql -u utilizador -p smarttable < database/smarttable.sql
```

Ou via phpMyAdmin: importar o ficheiro `database/smarttable.sql`.

**3. Configurar a ligação**

Editar `htdocs/config/db.php`:

```php
define('DB_HOST', 'localhost');       // servidor MySQL
define('DB_USER', 'utilizador_bd');   // utilizador MySQL
define('DB_PASS', 'password_bd');     // password MySQL
define('DB_NAME', 'smarttable');      // nome da base de dados
```

**4. Fazer upload dos ficheiros**

Copiar o conteúdo de `htdocs/` para a raiz pública do servidor (`public_html/` ou `htdocs/`), mantendo a estrutura de diretórios.

**5. Permissões da pasta de uploads**

```bash
chmod 755 htdocs/uploads/
```

**6. Definir o PIN de equipa**

Editar `htdocs/index_unlock.php` e alterar:

```php
$staffPin = '1339'; // ← alterar para um PIN próprio
```

**7. Criar o primeiro administrador**

Aceder a `https://seudominio.com/registo.php`, criar a conta de administrador e **remover ou restringir o acesso** a esse ficheiro de imediato.

**8. Gerar os QR codes**

No painel do administrador → Gestão de QR Codes → **Regenerar todos** (após configurar o domínio definitivo, para que os QR codes apontem para o URL correto).

---

### Opção B — Ambiente local com XAMPP

```bash
# 1. Instalar XAMPP → https://www.apachefriends.org
# 2. Copiar o projeto
cp -r PAP/htdocs C:/xampp/htdocs/smarttable

# 3. Iniciar Apache + MySQL no painel XAMPP
# 4. Criar base de dados em http://localhost/phpmyadmin
# 5. Importar o script SQL
# 6. Editar config/db.php (host: localhost, user: root, pass: vazio)
# 7. Aceder ao sistema
```

Abrir: [http://localhost/smarttable/](http://localhost/smarttable/)

---

### Instalação no InfinityFree (alojamento gratuito)

O sistema foi testado e está em produção no InfinityFree. Notas específicas:

- O InfinityFree não permite `ini_set('session.gc_maxlifetime', ...)` — por isso as sessões são persistidas na tabela `php_sessions` com gestão própria.
- A pasta de uploads precisa de permissões `755`.
- Após configurar o domínio, regenerar todos os QR codes no painel do administrador.
- Para evitar o aviso "Site perigoso" do Chrome, recomenda-se usar um domínio próprio em vez do subdomínio `infinityfreeapp.com`.

---

## Endpoints AJAX

Todos os painéis comunicam com o servidor via `fetch()` ou `XMLHttpRequest`. Os principais endpoints:

| Método | Endpoint | Descrição |
|--------|----------|-----------|
| `POST` | `gestao_mesas.php` | Criar, editar, remover ou libertar mesas |
| `POST` | `gestao_utilizadores.php` | Criar, editar, desativar utilizadores |
| `POST` | `gestao_menus.php` | Criar, editar itens; alterar disponibilidade |
| `POST` | `menu_dashboard.php` | Enviar pedido do cliente (carrinho → BD) |
| `POST` | `cozinha_dashboard.php` | Atualizar estado dos pedidos de comida |
| `POST` | `bar_dashboard.php` | Atualizar estado dos pedidos de bebidas |
| `POST` | `empregado_mesa_dashboard.php` | Marcar entregas; desbloquear fases |
| `POST` | `pagamento_dashboard.php` | Confirmar pagamento; libertar mesa |
| `POST` | `atribuir_mesas.php` | Guardar atribuições de mesas |
| `POST` | `gestao_restaurante.php` | Upload da planta do restaurante |
| `POST` | `index_unlock.php` | Validar PIN de equipa |
| `GET` | `mesa_status.php` | Estado de desbloqueio de prato/sobremesa de uma mesa |
| `GET` | `notifications.php` | Polling de chamadas ao gerente e novos pedidos |
| `GET` | `session_ping.php` | Manter sessão ativa (chamado a cada 60 segundos) |

---

## Resolução de Problemas

| Problema | Causa provável | Solução |
|----------|---------------|---------|
| Erro de ligação à base de dados | Credenciais erradas em `config/db.php` | Verificar `DB_HOST`, `DB_USER`, `DB_PASS`, `DB_NAME` |
| Sessões expiram rapidamente | Tabela `php_sessions` não criada | Confirmar execução do script SQL completo |
| QR codes apontam para URL errado | Domínio mudou após geração | Admin → QR Codes → Regenerar todos |
| Upload de planta não funciona | Permissões da pasta | `chmod 755 uploads/` no servidor |
| Painéis não atualizam automaticamente | JavaScript desativado ou erro de rede | Abrir consola do browser; verificar `auto_refresh.js` |
| Login por RFID não funciona | Cartão não registado | Admin → Registar Cartão RFID; verificar campo `rfid_code` em `users` |
| Erro 500 nas páginas PHP | Erro de código PHP | Ativar `display_errors` temporariamente ou consultar `php_errors.log` |
| Aviso "Site perigoso" no Chrome | Domínio `infinityfreeapp.com` sinalizado | Usar domínio próprio; ou Detalhes → Visitar este site |
| Página antiga ao clicar "Voltar" | Bfcache do browser | Confirmar que `bfcache_guard.js` está incluído na página |
| Toast de desbloqueio não aparece | `dessert_watch.js` não carrega | Verificar inclusão do ficheiro em `menu_dashboard.php` |
| PIN de equipa não aceite | PIN errado ou variável não alterada | Verificar `$staffPin` em `index_unlock.php` |
| Recibo não imprime | Problema com diálogo do browser | Usar "Guardar como PDF" no diálogo de impressão |

---

## Autor

<table>
  <tr>
    <td><b>Nome</b></td>
    <td>Gonçalo Costa Ferreira</td>
  </tr>
  <tr>
    <td><b>Número</b></td>
    <td>14602</td>
  </tr>
  <tr>
    <td><b>Escola</b></td>
    <td>OFICINA – Escola Profissional, Santo Tirso</td>
  </tr>
  <tr>
    <td><b>Orientador</b></td>
    <td>Luís Mendes</td>
  </tr>
  <tr>
    <td><b>Projeto</b></td>
    <td>Projeto de Aptidão Profissional (PAP)</td>
  </tr>
  <tr>
    <td><b>Ano</b></td>
    <td>2025 / 2026</td>
  </tr>
  <tr>
    <td><b>Contacto</b></td>
    <td><a href="mailto:goncalo.costa.ferreira2008@gmail.com">goncalo.costa.ferreira2008@gmail.com</a></td>
  </tr>
</table>

---

## Licença

Este projeto foi desenvolvido no âmbito de um **Projeto de Aptidão Profissional (PAP)** para fins exclusivamente académicos e de demonstração de competências técnicas.

O código é disponibilizado publicamente para consulta e aprendizagem. A distribuição, reutilização ou uso comercial sem autorização expressa do autor não é permitida.

© 2026 Gonçalo Costa Ferreira — Todos os direitos reservados.

---

<div align="center">

**[🌐 Ver em Produção](https://smarttable.infinityfreeapp.com)** &nbsp;·&nbsp; **[⬆ Voltar ao topo](#smarttable)**

<sub>Desenvolvido em PHP · MySQL · HTML5 · CSS3 · JavaScript ES6 — sem frameworks externos</sub>

</div>
