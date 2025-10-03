# Projeto Banco de Dados: E-commerce

## Descrição
Banco de dados lógico para cenário de **e-commerce**, contemplando clientes (PF/PJ), produtos, pedidos, pagamentos, fornecedores, vendedores, estoque e entregas.  

**Refinamentos aplicados:**
- Clientes PF e PJ (uma conta não pode ter ambas as informações)
- Pagamentos múltiplos por pedido
- Entregas com status e código de rastreio

O banco foi criado com **SQL**, e a persistência de dados permite testes de consultas e análises complexas.

## Queries SQL

- Quantos pedidos foram feitos por cada cliente?
- Algum vendedor também é fornecedor?
- Relação de produtos fornecedores e estoques;
- Relação de nomes dos fornecedores e nomes dos produtos;
- Qual é o produto mais vendido?
- Valor total gasto por cada cliente;
- Status de entrega dos pedidos;
- Ranking de vendedores (quantidade de produtos vendidos).

## Modelo Lógico Resumido

| Tabela            | Descrição                                           |
|------------------|---------------------------------------------------|
| `clients`         | Clientes PF/PJ, dados pessoais e contato         |
| `product`         | Produtos disponíveis, categoria, avaliação, tamanho |
| `orders`          | Pedidos realizados pelos clientes                |
| `payments`        | Formas de pagamento associadas a pedidos        |
| `productStorage`  | Estoque dos produtos                               |
| `supplier`        | Informações de fornecedores                       |
| `seller`          | Informações de vendedores                          |
| `productSeller`   | Relaciona produtos aos vendedores                 |
| `productOrder`    | Relaciona produtos aos pedidos                     |
| `storageLocation` | Relaciona produtos aos estoques                   |
| `productSupplier` | Relaciona produtos aos fornecedores               |
| `delivery`        | Informações de entrega com status e rastreio     |
