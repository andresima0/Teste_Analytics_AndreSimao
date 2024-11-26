# Teste_Analytics_AndreSimao

Executanto processos de análise de dados de simulação de vendas

## Introdução

Esse repositório tem por objetivo apresentar processos de análise de dados de um dataset fictício de uma loja de vendas de produtos de informática, para poder compreender melhor sobre limpeza, exploração, análise e criação de insights valiosos para negócios.

A base inicial de dados consiste de um dataset chamado dados_vendas.csv, que por sua vez possui 160 registros e as seguiontes colunas:
* ID: referente ao número de indentificação da compra, podendo se repetir de acordo com vários produtos associados a mesma compra;
* Data: referente ao momento de realização da compra, sob o formato dia-mês-ano (DD-MM-YYYY);
* Produto: referente ao produto de informática oferecido pela loja, sendo 56 produtos;
* Categoria: referente ao tipo do produto, o qual pode pertencer somente a uma das seis categorias disponíveis (Acessórios, Armazenamento, Cadeiras, Componentes, Monitores ou Notebooks);
*Quantidade: referente a quantidade de produtos de um mesmo tipo, atrelados a uma mesma compra;
* Preco: valor do produto, em reais (R$).

O arquivo dados_vendas.csv pode ser visualizado em detalhes em [link1](https://github.com/andresima0/Teste_Analytics_AndreSimao/blob/main/csv_files/dados_vendas.csv).

## Parte 1: Programação em Python

### 1 Limpeza e Análise de Dados de Vendas
Através da plataforma Google Colab, foi desenvolvido um Notebook em Python para fazer a limpeza e análise inicial dos dados. 
A partir da importação do arquivo dados_vendas.csv e da execução de prompts de comando em Python, pôde-se observar:
* 21 Registros incompletos;
* 14 Registros duplicados;
* 0 registros de tipagem incorreta;

As inconsistências foram corrigidas e um novo arquivo chamado data_clean.csv foi gerado, contendo 125 registros corretos para manipulação. O arquivo data_clean.csv pode ser visualizado em [Link2](https://github.com/andresima0/Teste_Analytics_AndreSimao/blob/main/csv_files/data_clean.csv).

A partir do arquivo data_clean.csv, foi possível calcular o total de vendas por produto (arquivo agrupado.csv, disponível em [Link3](https://github.com/andresima0/Teste_Analytics_AndreSimao/blob/main/csv_files/agrupado.csv)), e encontrar qual o produto teve maior valor de vendas e qual teve o maior número de vendas totais.

Produto com o maior valor de total de vendas

| Produto       | Notebook Dell Inspiron |
|---------------|------------------------|
| Quantidade    | 6                      |
| Preço         | 3.500,00               |
| Total Vendas  | 21.000,00              |

Produto mais vendido: 
| Produto          | Quantidade |
|------------------|------------|
| Cabo HDMI 4K 2m  | 27         |

Os detalhes desses processos no Notebook podem ser visualizados em [Link4](https://github.com/andresima0/Teste_Analytics_AndreSimao/blob/main/1_limpeza_dados_vendas.ipynb).

### 2 Análise Exploratória de Dados de Vendas

Os arquivos data_clean.csv e agrupado.csv foram exportados e convertidos em um único arquivo chamado vendas.xlsx (disponível em [Link5](https://github.com/andresima0/Teste_Analytics_AndreSimao/blob/main/microsoft_files/vendas.xlsx)), para ser feita a análise exploratória e visualização dos dados através da plataforma Power BI ([Link6](https://github.com/andresima0/Teste_Analytics_AndreSimao/blob/main/microsoft_files/2_exploracao_dados_vendas.pbix)).

Foi criado uma Visualização Power Bi chamada 2_exploracao_dados_vendas, que por usa vez contérm um dashboard interativo, formado por:
* Grafico de linhas, com:
  * Linha que faz a relação do valor das vendas (em milhares de R$) em cada mês dentro do período de 1 ano;
  * Linha que faz a relação do percentual das vendas (em %) em cada mês dentro do período de 1 ano;
* Gráfico circular, que relaciona o valor das vendas (em R$ e %) por categoria de produto;
* Gráfico circular, que relaciona a quantidade das vendas (em R$ e %) por categoria de produto;
* Card com o valor total das vendas dentro de todo o período analisado (1ano);
* Tabela com a relação dos cinco produtos mais vendidos e as respectivas quantidades.

A imagem abaixo apresenta a descrição feita dos gráficos:

![2_exploracao_dados_vendas](https://github.com/user-attachments/assets/ff24fe56-27a2-4479-ab72-64025d7b87d1)

A partir da análise das informações do dashboard, pôde-se concluir que:
* Os meses em que houve maiores valores de vendas foram novembro (35%) e janeiro (17%). Isso reflete possíveis promoções sazonais que ocorreram, como Black Friday e queima de estoque de início de ano.
* Os produtos que obtiveram maior valor de venda foram aqueles que pertencem as categorias Notebooks(42%) e Acessórios (19%). Porém isso pode não significar que são os produtos que geram maior margem de lucro, visto que apresentam pouca saída em quantidade (respectivamente 12% e 10%). Uma análise financeira mais minuciosa deve ser realizada;
* Os produtos mais vendidos foram os que pertencem a categoria acessórios (44% das vendas), sendo o Cabo HDMI 4K 2m o produto mais vendido, com 27 vendas. Porém isso não significa que gera maior margem de lucro, tendo em vista ser um dos produtos mais baratos da loja. Se faz necessário uma análise financeira mais detalhada.

## Parte 2: SQL

Foi criado um banco de dados chamado vendas_db utilizando a plataforma My SQL, e a partir da importação de data_clean.csv no ambiente My SQL, foram realizadas ajustes nas colunas para realização de consultas sem complicações, como:
* conversão das colunas quelidam com valores do tipo moeda para DECIMAL(10, 2);
* conversão da coluna comas datas das vendas para o tipo DATE, no fomramto ano-mês-dia (YYY-MM-DD);

Após ajustes necessários, foram realizadas as consultas para:
  
### 2.1 lista com nome do produto, categoria e a soma total de vendas de cada produto, ordenada pelo total de vendas em ordem decrescente

```sql
SELECT Produto, Categoria, SUM(Quantidade * Preco) AS Total_Vendas FROM vendas
GROUP BY Produto, Categoria
ORDER BY Total_Vendas DESC;
````

### 2.2 produtos que venderam menos no mês de junho de 2023

```sql
SELECT Produto,Categoria, SUM(Quantidade) AS Total_Quantidade
FROM vendas
WHERE MONTH(Data_Venda) = 06 AND YEAR(Data_Venda) = 2023
GROUP BY Produto, Categoria
ORDER BY Total_Quantidade ASC;
```
