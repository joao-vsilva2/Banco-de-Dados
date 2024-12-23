# Modelo para Oficina mecânica
## Explicação do Código SQL

Este código SQL cria tabelas para um banco de dados de gerenciamento de serviços mecânicos. Aqui está uma explicação concisa:

1. **Cliente**
   - Define clientes, com campos para informações como `nome`, `endereço`, `telefone`, entre outros.
   - A chave primária é `idCliente`.

2. **Equipe**
   - Define equipes, identificadas por `idEquipe`.
   - A chave primária é `idEquipe`.

3. **Equipe_Mecanico**
   - Relaciona mecânicos às equipes, incluindo até quatro mecânicos por equipe.
   - As chaves primárias são `Mecanico_idMecanico` e `Equipe_idEquipe`.

4. **Mecanico**
   - Define mecânicos, com campos como `nome`, `endereço` e `especialidade`.
   - A chave primária é `idMecanico`.

5. **OrdemServico**
   - Define ordens de serviço, com campos para informações como `dataEmissao`, `descricao`, `status`, e `dataConclusao`.
   - As chaves primárias são `idOrdemServico` e `Equipe_idEquipe`.

6. **principalCervico_outros**
   - Associa ordens de serviço a uma tabela de preços, permitindo até quatro códigos de serviço adicionais.
   - As chaves primárias são `OrdemServico_idOrdemServico`, `tabelaPreco_idtabelaPreco` e `OrdemServico_Equipe_idEquipe`.

7. **tabelaPreco**
   - Define tabelas de preços, com campos para `nome`, `descricao` e `valor`.
   - A chave primária é `idtabelaPreco`.

8. **Veiculo**
   - Define veículos, associando-os a clientes e equipes, com campos como `placa`, `marca` e `modelo`.
   - As chaves primárias são `idVeiculo`, `Cliente_idCliente` e `Equipe_idEquipe`.

Este código estabelece a estrutura básica para gerenciar clientes, mecânicos, equipes, ordens de serviço, preços e veículos em um sistema de serviços mecânicos.
