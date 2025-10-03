-- Queries

-- Quantos pedidos foram feitos por cada cliente?
select c.idClient, concat(c.Fname, ' ', c.Lname) as Client_name, count(o.idOrder) as Number_of_orders
	from clients c
    inner join orders o on c.idClient = o.idOrderClient
	group by c.idClient, Client_name;

-- Algum vendedor também é fornecedor?
select s.socialName as Seller_name, sp.socialName as Supplier_name, s.CNPJ as Seller_CNPJ, sp.CNPJ as Supplier_CNPJ, s.CPF as Seller_CPF
	from seller s
	inner join supplier sp on (s.CNPJ = sp.CNPJ or s.CPF is not null and s.CPF = sp.CNPJ);

-- Relação de produtos, fornecedores e estoques
select p.Pname as Product_name, sp.socialName as Supplier_name, ps.prodSQuantity as Supplied_quantity,
st.storageLocation as Storage_location, st.quantity as Storage_quantity
	from product p
	inner join productSupplier ps on p.idProduct = ps.idPsProduct
	inner join supplier sp on ps.idPsSupplier = sp.idSupplier
	inner join storageLocation sl on p.idProduct = sl.idLproduct
	inner join productStorage st on sl.idLstorage = st.idProdStorage;

-- Relação de nomes dos fornecedores e nomes dos produtos
select sp.socialName as Supplier_name, p.Pname as Product_name
	from supplier sp
	inner join productSupplier ps on sp.idSupplier = ps.idPsSupplier
	inner join product p on ps.idPsProduct = p.idProduct;

-- Qual é o produto mais vendido?
select p.Pname as Product_name, sum(po.poQuantity) as Total_sold
	from productOrder po
	inner join product p on po.idPoProduct = p.idProduct
	group by p.Pname
	order by Total_sold desc limit 1;

-- Valor total gasto por cada cliente
select c.idClient, concat(c.Fname, ' ', c.Lname) as Client_name, sum(pay.paymentValue) as Total_spent
	from clients c
	inner join orders o on c.idClient = o.idOrderClient
	inner join payments pay on o.idOrder = pay.idOrder
	group by c.idClient, Client_name
	order by Total_spent desc;

-- Status de entrega dos pedidos
select o.idOrder, concat(c.Fname, ' ', c.Lname) as Client_name, d.trackingCode, d.deliveryStatus, d.estimatedDate, d.deliveredDate
	from delivery d
	inner join orders o on d.idOrder = o.idOrder
	inner join clients c on o.idOrderClient = c.idClient;

-- Ranking de vendedores (quantidade de produtos vendidos)
select s.socialName as Seller_name, sum(po.poQuantity) as Total_sold
	from seller s
	inner join productSeller ps on s.idSeller = ps.idPSeller
	inner join productOrder po on ps.idPproduct = po.idPoProduct
	group by s.socialName
	order by Total_sold desc;
