-- criação do banco de dados para o cenário de E-commerce (com alterações)
create database ecommerce;
use ecommerce;

-- criar tabela cliente

create table clients(
	idClient int auto_increment primary key,
    clientType enum('PF', 'PJ') not null,
    Fname varchar(20),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) unique,
    CNPJ char(14) unique,
    Address varchar(100),
    email varchar(100) unique not null,
    contact char(11),
    constraint chk_client_pf check (
        (clientType = 'PF' and CPF is not null and CNPJ is null)
        or
        (clientType = 'PJ' and CNPJ is not null and CPF is null)
    )
)auto_increment = 1;
desc clients;

-- criar tabela produto
-- size equivale a dimensão do produto 
create table product(
	idProduct int auto_increment primary key,
    Pname varchar(100) not null,
    classification_kids bool default false,
    category enum('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') not null,
    avaliacao float default 0,
    size varchar(10)
)auto_increment = 1;
desc product;

-- criar tabela pedido
create table orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum ('Cancelado','Confirmado','Em processamento', 'Enviado', 'Entregue') default 'Em processamento',
    orderDescription varchar(255),
    sendValue float default 10,
    constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
    on update cascade
)auto_increment = 1;
desc orders;

-- criar tabela pagamento
create table payments(
	idPayment int auto_increment primary key,
    idOrder int not null,
    typePayment enum ('Cartão Débito', 'Cartão Crédito', 'Boleto', 'Pix'),
    limitAvaliable float,
    paymentValue float not null,
    paymentDate datetime default current_timestamp,
    constraint fk_payment_order foreign key (idOrder) references orders(idOrder)
    on delete cascade
)auto_increment = 1;
desc payments;

-- cria tabela estoque
create table productStorage(
	idProdStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0
)auto_increment = 1;
desc productStorage;

-- criar tabel fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    socialName varchar(255) not null,
    CNPJ char(14) not null,
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
)auto_increment = 1;
desc supplier;

-- criar tabela vendedor
create table seller(
	idSeller int auto_increment primary key,
    socialName varchar(255) not null,
    AbstName varchar(255),
    CNPJ char(14),
    CPF char(11),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
)auto_increment = 1;
desc seller;

-- criar tabela produto do vendedor
create table productSeller(
	idPSeller int,
    idPproduct int,
    prodQuantity int default 1,
    primary key (idPSeller, idPproduct),
    constraint fk_product_seller foreign key (idPSeller) references seller(idSeller),
    constraint fk_product_product foreign key (idPproduct) references product(idProduct)
);
desc productSeller;

-- criar tabela ordem do produto
create table productOrder(
	idPoProduct int,
    idPoOrder int,
    poQuantity int default 1,
    poStatus enum ('Disponível', 'Sem estoque') default 'Disponível',
    primary key (idPoProduct, idPoOrder),
    constraint fk_product_order_product foreign key (idPoProduct) references product(idProduct),
    constraint fk_product_order_order foreign key (idPoOrder) references orders(idOrder)
);
desc productOrder;

-- criar tabela local da loja
create table storageLocation(
	idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
    constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
);
desc storageLocation;

-- criar tabela produto do fornecedor
create table productSupplier(
	idPsSupplier int,
    idPsProduct int,
    prodSQuantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
);
desc productSupplier;

-- criar tabela de entregas
create table delivery(
    idDelivery int auto_increment primary key,
    idOrder int not null,
    trackingCode varchar(50) unique not null,
    deliveryStatus enum('Preparando envio','Em trânsito','Saiu para entrega','Entregue','Problema na entrega') default 'Preparando envio',
    estimatedDate date,
    deliveredDate date,
    constraint fk_delivery_order foreign key (idOrder) references orders(idOrder)
    on delete cascade
) auto_increment = 1;
desc delivery;