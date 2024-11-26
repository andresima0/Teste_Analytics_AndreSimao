CREATE DATABASE vendas_db;
USE vendas_db;

-- desabilitando segurança para gerar alterações nos tipos ode dados
SET SQL_SAFE_UPDATES = 0;

-- após importação do arquivo vendas.csv via Table Data Import Wizard
SELECT * FROM vendas;

-- mudando tipo das colunas que lidam com valor moeda
ALTER TABLE vendas
MODIFY COLUMN Preco DECIMAL(10, 2),
MODIFY COLUMN Total_Venda DECIMAL(10, 2);

-- mudando coluna Data_Venda para DATE, e ajustando para leitura correta pelo MySQL
UPDATE vendas SET Data_Venda = STR_TO_DATE(Data_Venda, '%d/%m/%Y');
ALTER TABLE vendas MODIFY COLUMN Data_Venda DATE;

-- Cconferindo se formato de dados foram convertidos corretamente
DESCRIBE vendas;
SELECT * FROM vendas;

-- habilitando segurança novamente
SET SQL_SAFE_UPDATES = 1;

-- lista com nome do produto, categoria e a soma total de vendas de cada produto. Ordenação do valor total de vendas em ordem decrescente
SELECT Produto, Categoria, SUM(Quantidade * Preco) AS Total_Vendas FROM vendas
GROUP BY Produto, Categoria
ORDER BY Total_Vendas DESC;

-- lista dos produtos vendidos em junho de 2023
SELECT * FROM vendas WHERE Data_Venda BETWEEN '2023-06-01' AND '2023-06-30';


-- produtos que venderam menos no mês de junho de 2023
SELECT Produto,Categoria, SUM(Quantidade) AS Total_Quantidade
FROM vendas
WHERE MONTH(Data_Venda) = 06 AND YEAR(Data_Venda) = 2023
GROUP BY Produto, Categoria
ORDER BY Total_Quantidade ASC;