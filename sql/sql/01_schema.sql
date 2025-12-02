/* =========================================================
   MINI-MUNDO: LOJA ONLINE
   Script 01 - Criação do esquema (DDL)
   Compatível com MySQL e PostgreSQL
   ========================================================= */

/* ---------------------------------------------------------
   TABELA: cliente
   Guarda informações básicas dos clientes
   --------------------------------------------------------- */
CREATE TABLE cliente (
    id_cliente      INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome            VARCHAR(120) NOT NULL,
    email           VARCHAR(120) NOT NULL UNIQUE,
    telefone        VARCHAR(20),
    data_cadastro   DATE NOT NULL DEFAULT CURRENT_DATE
);

/* ---------------------------------------------------------
   TABELA: produto
   Produtos disponíveis na loja
   --------------------------------------------------------- */
CREATE TABLE produto (
    id_produto      INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome            VARCHAR(120) NOT NULL,
    categoria       VARCHAR(60) NOT NULL,
    preco           DECIMAL(10,2) NOT NULL CHECK (preco > 0),
    estoque         INTEGER NOT NULL CHECK (estoque >= 0),
    ativo           BOOLEAN NOT NULL DEFAULT TRUE
);

/* ---------------------------------------------------------
   TABELA: pedido
   Pedido feito por um cliente
   status: 'ABERTO', 'PAGO', 'ENVIADO', 'CANCELADO'
   --------------------------------------------------------- */
CREATE TABLE pedido (
    id_pedido       INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_cliente      INTEGER NOT NULL,
    data_pedido     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status          VARCHAR(20) NOT NULL DEFAULT 'ABERTO',

    CONSTRAINT fk_pedido_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

/* ---------------------------------------------------------
   TABELA: item_pedido
   Itens (produtos) vinculados a um pedido
   PK composta para evitar produto repetido no mesmo pedido
   --------------------------------------------------------- */
CREATE TABLE item_pedido (
    id_pedido       INTEGER NOT NULL,
    id_produto      INTEGER NOT NULL,
    quantidade      INTEGER NOT NULL CHECK (quantidade > 0),
    preco_unitario  DECIMAL(10,2) NOT NULL CHECK (preco_unitario > 0),

    CONSTRAINT pk_item_pedido PRIMARY KEY (id_pedido, id_produto),

    CONSTRAINT fk_item_pedido_pedido
        FOREIGN KEY (id_pedido)
        REFERENCES pedido(id_pedido)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_item_pedido_produto
        FOREIGN KEY (id_produto)
        REFERENCES produto(id_produto)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

/* ---------------------------------------------------------
   TABELA: pagamento
   Um pedido tem no máximo um pagamento
   --------------------------------------------------------- */
CREATE TABLE pagamento (
    id_pagamento    INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_pedido       INTEGER NOT NULL UNIQUE,
    forma           VARCHAR(30) NOT NULL,  -- 'CARTAO', 'PIX', 'BOLETO'
    valor           DECIMAL(10,2) NOT NULL CHECK (valor > 0),
    data_pagamento  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_pagamento_pedido
        FOREIGN KEY (id_pedido)
        REFERENCES pedido(id_pedido)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
/* =========================================================
   MINI-MUNDO: LOJA ONLINE
   Script 01 - Criação do esquema (DDL)
   Compatível com MySQL e PostgreSQL
   ========================================================= */

/* ---------------------------------------------------------
   TABELA: cliente
   Guarda informações básicas dos clientes
   --------------------------------------------------------- */
CREATE TABLE cliente (
    id_cliente      INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome            VARCHAR(120) NOT NULL,
    email           VARCHAR(120) NOT NULL UNIQUE,
    telefone        VARCHAR(20),
    data_cadastro   DATE NOT NULL DEFAULT CURRENT_DATE
);

/* ---------------------------------------------------------
   TABELA: produto
   Produtos disponíveis na loja
   --------------------------------------------------------- */
CREATE TABLE produto (
    id_produto      INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome            VARCHAR(120) NOT NULL,
    categoria       VARCHAR(60) NOT NULL,
    preco           DECIMAL(10,2) NOT NULL CHECK (preco > 0),
    estoque         INTEGER NOT NULL CHECK (estoque >= 0),
    ativo           BOOLEAN NOT NULL DEFAULT TRUE
);

/* ---------------------------------------------------------
   TABELA: pedido
   Pedido feito por um cliente
   status: 'ABERTO', 'PAGO', 'ENVIADO', 'CANCELADO'
   --------------------------------------------------------- */
CREATE TABLE pedido (
    id_pedido       INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_cliente      INTEGER NOT NULL,
    data_pedido     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status          VARCHAR(20) NOT NULL DEFAULT 'ABERTO',

    CONSTRAINT fk_pedido_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

/* ---------------------------------------------------------
   TABELA: item_pedido
   Itens (produtos) vinculados a um pedido
   PK composta para evitar produto repetido no mesmo pedido
   --------------------------------------------------------- */
CREATE TABLE item_pedido (
    id_pedido       INTEGER NOT NULL,
    id_produto      INTEGER NOT NULL,
    quantidade      INTEGER NOT NULL CHECK (quantidade > 0),
    preco_unitario  DECIMAL(10,2) NOT NULL CHECK (preco_unitario > 0),

    CONSTRAINT pk_item_pedido PRIMARY KEY (id_pedido, id_produto),

    CONSTRAINT fk_item_pedido_pedido
        FOREIGN KEY (id_pedido)
        REFERENCES pedido(id_pedido)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_item_pedido_produto
        FOREIGN KEY (id_produto)
        REFERENCES produto(id_produto)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

/* ---------------------------------------------------------
   TABELA: pagamento
   Um pedido tem no máximo um pagamento
   --------------------------------------------------------- */
CREATE TABLE pagamento (
    id_pagamento    INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_pedido       INTEGER NOT NULL UNIQUE,
    forma           VARCHAR(30) NOT NULL,  -- 'CARTAO', 'PIX', 'BOLETO'
    valor           DECIMAL(10,2) NOT NULL CHECK (valor > 0),
    data_pagamento  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_pagamento_pedido
        FOREIGN KEY (id_pedido)
        REFERENCES pedido(id_pedido)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
