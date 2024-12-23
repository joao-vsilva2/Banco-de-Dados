# Modelo E-commerce
## Explicação do Código SQL

Este código SQL cria tabelas para um banco de dados de gerenciamento de pedidos e clientes. Aqui está uma explicação concisa:

1. **Boleto**
   - Define boletos, associando-os a pedidos e clientes.
   - A chave primária é `idBoleto`.

2. **Cartao**
   - Define cartões de crédito, com campos para `Número`, `Data de validade` e `CVV`.
   - A chave primária é `idCartao`.

3. **Cliente**
   - Define clientes, com campos como `Nome`, `PJ`, `Endereço`, `Telefone` e `Email`.
   - A chave primária é `idCliente`.

4. **Dados_catao**
   - Relaciona cartões aos pedidos e clientes, com um campo adicional para débito.
   - A chave primária é `Pedido_Cliente_idCliente`, `Pedido_idPedido`, `Cartao_idCartao`.

5. **Entrega**
   - Define entregas, associando-as a pedidos e clientes, com campos como `Código de rastreio` e `Status da entrega`.
   - A chave primária é `idEntrega`, `Pedido_Cliente_idCliente`, `Pedido_idPedido`.

6. **Estoque**
   - Define locais de estoque.
   - A chave primária é `idEstoque`.

7. **Estoque_has_Produto**
   - Relaciona produtos ao estoque, com um campo para quantidade.
   - A chave primária é `Estoque_idEstoque`, `Produto_idProduto`.

8. **Fornecedor**
   - Define fornecedores.
   - A chave primária é `idFornecedor`.

9. **Fornecedor_has_Produto**
   - Relaciona produtos aos fornecedores.
   - A chave primária é `Fornecedor_idFornecedor`, `Produto_idProduto`.

10. **Pedido**
    - Define pedidos, com campos para `Endereço de entrega`, `Status do pedido`, `Frete`, `Forma de pagamento` e `Cancelado`.
    - A chave primária é `idPedido`, `Cliente_idCliente`.

11. **Pedido_has_Produto**
    - Relaciona produtos aos pedidos e clientes, com um campo para quantidade.
    - A chave primária é `Pedido_idPedido`, `Produto_idProduto`, `Pedido_Cliente_idCliente`.

12. **PF**
    - Define pessoas físicas (CPF) associadas a clientes.
    - A chave primária é `CPF`.

13. **PIX**
    - Define transações PIX associadas a pedidos e clientes.
    - A chave primária é `idPIX`.

14. **PJ**
    - Define pessoas jurídicas (CNPJ) associadas a clientes, com campos como `Inscrição estadual`.
    - A chave primária é `CNPJ`.

15. **Produto**
    - Define produtos, com campos como `Categoria`, `Descrição` e `Valor`.
    - A chave primária é `idProduto`.

16. **Produto_has_Vendedor (Terceiro)**
    - Relaciona produtos aos vendedores terceiros, com um campo para quantidade.
    - A chave primária é `Produto_idProduto`, `Vendedor (Terceiro)_idVendedor_T`.

17. **Vendedor (Terceiro)**
    - Define vendedores terceiros, com campos como `Razão social`, `CNPJ` e `Local do vendedor`.
    - A chave primária é `idVendedor_T`.

Este código estabelece a estrutura básica para gerenciar clientes, pedidos, pagamentos, entregas, estoque, fornecedores e produtos em um sistema de comércio eletrônico.
