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

O arquivo dados_vendas.csv pode ser visualizado em detalhes em link1.

## Parte 1: Programação em Python

### 1 Limpeza e Análise de Dados de Vendas
Através da plataforma Google Colab, foi desenvolvido um Notebook em Python para fazer a limpeza e análise inicial dos dados. 
A partir da importação do arquivo dados_vendas.csv e da execução de prompts de comando em Python, pôde-se observar:
* 21 Registros incompletos;
* 14 Registros duplicados;
* 0 registros de tipagem incorreta;

As inconsistências foram corrigidas e um novo arquivo chamado data_clean.csv foi gerado, contendo 125 registros corretos para manipulação. O arquivo data_clean.csv pode ser visualizado em Link2.

A partir do arquivo data_clean.csv, foi possível calcular o total de vendas por produto (disponível em Link3), e encontrar qual o produto teve maior valor de vendas e qual teve o maior número de vendas totais.

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

Os detalhes desses processos no Notebook podem ser visualizados em Link4.

### 2 Análise Exploratória de Dados de Vendas

![2_exploracao_dados_vendas](https://github.com/user-attachments/assets/ff24fe56-27a2-4479-ab72-64025d7b87d1)

## Parte 2: SQL

## Parte 3: Interpretação dos Resultados
