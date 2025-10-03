-- inserção de dados e queries

-- Inserindo clientes
insert into clients (clientType, Fname, Minit, Lname, CPF, CNPJ, Address, email, contact) values
('PF','Maria','A','Silva','12345678901',null,'Rua das Flores 100, Centro - Cidade das Flores','maria.silva@email.com','11987654321'),
('PF','João','B','Oliveira','98765432100',null,'Av. Paulista 1500, Bela Vista - São Paulo','joao.oliveira@email.com','11999998888'),
('PJ','EmpresaX',null,'Tech',null,'12345678000190','Rua da Indústria 500, Distrito - São Paulo','contato@empresax.com','1133334444'),
('PF','Ana','C','Pereira','45612378945',null,'Rua Verde 45, Jardim - Campinas','ana.pereira@email.com','11911112222'),
('PJ','LojaBoa',null,'LTDA',null,'98765432000155','Av. Central 200, Centro - Rio de Janeiro','contato@lojaboa.com','2133345566');

select * from clients;

-- Inserindo produtos
insert into product (Pname, classification_kids, category, avaliacao, size) values
('Notebook Dell XPS', false, 'Eletrônico', 4.8, '15pol'),
('Camiseta Estampada', false, 'Vestimenta', 4.5, 'M'),
('Boneca Barbie Dreamhouse', true, 'Brinquedos', 4.9, '30cm'),
('Chocolate Milka', true, 'Alimentos', 4.7, '100g'),
('Sofá Retrátil', false, 'Móveis', 4.6, '3x2m');

select * from product;

-- Inserindo pedidos
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue) values
(1, 'Confirmado', 'Compra de Notebook Dell', 20),
(2, 'Em processamento', 'Compra de Camiseta Estampada', 15),
(3, 'Confirmado', 'Compra de Boneca Barbie', 12),
(4, 'Enviado', 'Compra de Chocolate Milka', 10),
(5, 'Entregue', 'Compra de Sofá Retrátil', 150);

select * from orders;

-- Inserindo pagamentos
insert into payments (idOrder, typePayment, limitAvaliable, paymentValue) values
(1, 'Cartão Crédito', 5000, 4500),
(2, 'Boleto', null, 80),
(3, 'Pix', null, 120),
(4, 'Cartão Débito', 2000, 15),
(5, 'Cartão Crédito', 10000, 2500);

select * from payments;

-- Inserindo estoque
insert into productStorage (storageLocation, quantity) values
('Depósito SP - Zona Leste', 100),
('Depósito SP - Zona Oeste', 50),
('Depósito RJ - Centro', 80),
('Depósito MG - Belo Horizonte', 40),
('Depósito PR - Curitiba', 30);

select * from productStorage;

-- Inserindo fornecedores
insert into supplier (socialName, CNPJ, contact) values
('Fornecedor Eletrônicos LTDA','11111111000101','1132121111'),
('Fornecedor Moda SA','22222222000102','1132122222'),
('Fornecedor Brinquedos Eireli','33333333000103','1132123333'),
('Fornecedor Alimentos ME','44444444000104','1132124444'),
('Fornecedor Móveis LTDA','55555555000105','1132125555');

select * from supplier;

-- Inserindo vendedores
insert into seller (socialName, AbstName, CNPJ, CPF, location, contact) values
('VendasTech LTDA','VTech','66666666000106',null,'São Paulo','11988887777'),
('LojaRoupas ME','LR','77777777000107',null,'Rio de Janeiro','21988887777'),
('BrinquedosFeliz','BF',null,'12345678912','Campinas','19988887777'),
('Doces&Cia','DC',null,'98765432198','Belo Horizonte','31988887777'),
('CasaConforto','CC','88888888000108',null,'Curitiba','41988887777');

select * from seller;

-- Relacionando produto ↔ vendedor
insert into productSeller (idPSeller, idPproduct, prodQuantity) values
(1,1,10),
(2,2,50),
(3,3,30),
(4,4,100),
(5,5,5);

select * from productSeller;

-- Relacionando produto ↔ pedido
insert into productOrder (idPoProduct, idPoOrder, poQuantity) values
(1,1,1),
(2,2,2),
(3,3,1),
(4,4,10),
(5,5,1);

select * from productOrder;

-- Relacionando produto ↔ estoque
insert into storageLocation (idLproduct, idLstorage, location) values
(1,1,'São Paulo'),
(2,2,'Rio de Janeiro'),
(3,3,'Campinas'),
(4,4,'Belo Horizonte'),
(5,5,'Curitiba');

select * from storageLocation;

-- Relacionando produto ↔ fornecedor
insert into productSupplier (idPsSupplier, idPsProduct, prodSQuantity) values
(1,1,20),
(2,2,100),
(3,3,40),
(4,4,200),
(5,5,10);

select * from productSupplier;

-- Inserindo entregas
insert into delivery (idOrder, trackingCode, deliveryStatus, estimatedDate, deliveredDate) values
(1,'BR123456789SP','Preparando envio','2025-10-10',null),
(2,'BR987654321SP','Em trânsito','2025-10-12',null),
(3,'BR111213141RJ','Saiu para entrega','2025-10-08',null),
(4,'BR555666777MG','Entregue','2025-10-05','2025-10-07'),
(5,'BR999888777PR','Entregue','2025-09-30','2025-10-01');

select * from delivery;