-- Criação da tabela Cliente
CREATE TABLE Cliente (
    CLI_codigoCliente INTEGER PRIMARY KEY,
    CLI_cpf VARCHAR(11) NOT NULL,  -- CPF como VARCHAR para permitir zeros à esquerda
    CLI_nome VARCHAR(100) NOT NULL,
    CLI_dataNascimento DATE NOT NULL,
    CLI_email VARCHAR(100),
    CLI_telefone VARCHAR(15)
);

-- Criação da tabela PedidoCliente
CREATE TABLE PedidoCliente (
    PED_numeroVenda INTEGER PRIMARY KEY,
    PED_data DATE NOT NULL,
    PED_valorTotal DECIMAL(10, 2) NOT NULL,  -- Usar DECIMAL para valores monetários
    PED_numeroPessoas INTEGER NOT NULL
);

-- Criação da tabela FormaPagamento
CREATE TABLE FormaPagamento (
    FOR_codigoPagamento INTEGER PRIMARY KEY,
    FOR_forma VARCHAR(50) NOT NULL
);

-- Criação da tabela ItemPedido
CREATE TABLE ItemPedido (
    ITE_numeroItem INTEGER PRIMARY KEY,
    ITE_quantidade INTEGER NOT NULL,
    ITE_valorUnitario DECIMAL(10, 2) NOT NULL,
    ITE_valorTotalItem DECIMAL(10, 2) NOT NULL
);

-- Criação da tabela Cardapio
CREATE TABLE Cardapio (
    CAR_codigo INTEGER PRIMARY KEY,
    CAR_nome VARCHAR(100) NOT NULL,
    CAR_preco DECIMAL(10, 2) NOT NULL,
    CAR_unidade VARCHAR(20) NOT NULL  -- Usar VARCHAR para unidades (ex: "kg", "un", etc.)
);

-- Criação da tabela Garcom
CREATE TABLE Garcom (
    GAR_codigo INTEGER PRIMARY KEY,
    GAR_nome VARCHAR(100) NOT NULL,
    GAR_horarioTrabalho VARCHAR(50) NOT NULL  -- Melhor descrever o horário
);

-- Criação da tabela Categoria
CREATE TABLE Categoria (
    CAT_codigo INTEGER PRIMARY KEY,
    CAT_nome VARCHAR(100) NOT NULL
);

-- Criação da tabela Relacionamento_2
CREATE TABLE Relacionamento_2 (
    fk_PedidoCliente_PED_numeroVenda INTEGER,
    fk_ItemPedido_ITE_numeroItem INTEGER,
    PRIMARY KEY (fk_PedidoCliente_PED_numeroVenda, fk_ItemPedido_ITE_numeroItem),
    FOREIGN KEY (fk_PedidoCliente_PED_numeroVenda) REFERENCES PedidoCliente (PED_numeroVenda) ON DELETE RESTRICT,
    FOREIGN KEY (fk_ItemPedido_ITE_numeroItem) REFERENCES ItemPedido (ITE_numeroItem) ON DELETE SET NULL
);

-- Criação da tabela Relacionamento_3
CREATE TABLE Relacionamento_3 (
    fk_FormaPagamento_FOR_codigoPagamento INTEGER,
    fk_PedidoCliente_PED_numeroVenda INTEGER,
    PRIMARY KEY (fk_FormaPagamento_FOR_codigoPagamento, fk_PedidoCliente_PED_numeroVenda),
    FOREIGN KEY (fk_FormaPagamento_FOR_codigoPagamento) REFERENCES FormaPagamento (FOR_codigoPagamento) ON DELETE RESTRICT,
    FOREIGN KEY (fk_PedidoCliente_PED_numeroVenda) REFERENCES PedidoCliente (PED_numeroVenda) ON DELETE SET NULL
);

-- Criação da tabela Relacionamento_4
CREATE TABLE Relacionamento_4 (
    fk_Cardapio_CAR_codigo INTEGER,
    fk_ItemPedido_ITE_numeroItem INTEGER,
    PRIMARY KEY (fk_Cardapio_CAR_codigo, fk_ItemPedido_ITE_numeroItem),
    FOREIGN KEY (fk_Cardapio_CAR_codigo) REFERENCES Cardapio (CAR_codigo) ON DELETE RESTRICT,
    FOREIGN KEY (fk_ItemPedido_ITE_numeroItem) REFERENCES ItemPedido (ITE_numeroItem) ON DELETE SET NULL
);

-- Criação da tabela Relacionamento_5
CREATE TABLE Relacionamento_5 (
    fk_Categoria_CAT_codigo INTEGER,
    fk_Cardapio_CAR_codigo INTEGER,
    PRIMARY KEY (fk_Categoria_CAT_codigo, fk_Cardapio_CAR_codigo),
    FOREIGN KEY (fk_Categoria_CAT_codigo) REFERENCES Categoria (CAT_codigo) ON DELETE RESTRICT,
    FOREIGN KEY (fk_Cardapio_CAR_codigo) REFERENCES Cardapio (CAR_codigo) ON DELETE SET NULL
);

-- Criação da tabela Relacionamento_6
CREATE TABLE Relacionamento_6 (
    fk_Garcom_GAR_codigo INTEGER,
    fk_ItemPedido_ITE_numeroItem INTEGER,
    PRIMARY KEY (fk_Garcom_GAR_codigo, fk_ItemPedido_ITE_numeroItem),
    FOREIGN KEY (fk_Garcom_GAR_codigo) REFERENCES Garcom (GAR_codigo) ON DELETE RESTRICT,
    FOREIGN KEY (fk_ItemPedido_ITE_numeroItem) REFERENCES ItemPedido (ITE_numeroItem) ON DELETE SET NULL
);

-- Criação da tabela Relacionamento_7
CREATE TABLE Relacionamento_7 (
    fk_Cliente_CLI_codigoCliente INTEGER,
    fk_PedidoCliente_PED_numeroVenda INTEGER,
    PRIMARY KEY (fk_Cliente_CLI_codigoCliente, fk_PedidoCliente_PED_numeroVenda),
    FOREIGN KEY (fk_Cliente_CLI_codigoCliente) REFERENCES Cliente (CLI_codigoCliente) ON DELETE RESTRICT,
    FOREIGN KEY (fk_PedidoCliente_PED_numeroVenda) REFERENCES PedidoCliente (PED_numeroVenda) ON DELETE RESTRICT
);
