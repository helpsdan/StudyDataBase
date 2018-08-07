/*Crie uma função chamada fun_qtd_func_depto que retorne a quantidade total de funcionário de um determinado
departamento. Caso não exista funcionário cadastrado para o departamento informado, ou ocorrer qualquer erro imprevisto,
retornar o valor 0 (zero).*/
create or replace function fun_qtd_func_depto (p_cd_depto in number)
  return number
  is
  v_qtd number;
begin
  select count(*) into v_qtd
  from loc_depto d 
  join loc_funcionario f on d.cd_depto = f.cd_depto
  where d.cd_depto = p_cd_depto;
return v_qtd;
end;

select fun_qtd_func_depto(10) from dual;

/* ------------------------------------------------------------------------ */
/*
functions
1) Crie uma função chamada fun_qtd_func_depto que retorne a quantidade total de funcionário de um determinado
departamento. Caso não exista funcionário cadastrado para o departamento informado, ou ocorrer qualquer erro imprevisto,
retornar o valor 0 (zero).
2) Desenvolva uma função denominada fun_nome_veículo que vai ter um retorno varchar2. Essa função vai receber como
parâmetro a placa do veículo e selecionar as seguintes colunas: Modelo + Cor + e tipo do automóvel. Concatene essas colunas na
variável de retorno da função. Caso a placa do veículo não esteja cadastrada, parar o processamento emitindo a seguinte
mensagem de erro “Placa <nrplaca> do veículo não está cadastrada. Favor informar um código válido !”.
3) Desenvolva uma função denominada fun_nome_grupo que vai ter um retorno varchar2. Essa função vai receber como
parâmetro o código do grupo de veículo e selecionar o nome do grupo na tabela LOC_GRUPO. Caso o código do grupo não esteja
cadastrado, parar o processamento emitindo a seguinte mensagem de erro “Código do grupo não está cadastrado. Favor informar
um código válido !”.
4) Crie uma função chamada fun_val_med_loc_cliente que retorne o valor total médio gasto por determinado cliente. Caso não
exista o cliente cadastrado, ou ocorrer qualquer erro imprevisto, retornar o valor 0 (zero).
*/

/*
Procedures:
1) Desenvolva um procedimento chamado prc_gera_estrelas_cli que tem como objetivo atualizar o número de estrelas de cada
cliente(coluna nr_estrelas: tabela LOC_CLIENTE). O número de estrelas que um cliente pode possuir está entre 1 e 5 estrelas.
Para ser possível identificar qual estrela o cliente possui, utilize a função FUN_VAL_MED_LOC_CLI para obter o valor médio
total gasto pelo cliente e utilize a tabela abaixo, que determina em qual faixa o valor médio de locação o cliente se encaixa. No
final do processamento, confirme as transações realizadas e cria uma instrução SQL à parte que verifica se a estrela gerada
para cada cliente está de acordo com as locações hoje cadastradas.
De 0,00 A 200,00 1
De 201,00 A 300,00 2
De 301,00 A 450,00 3
De 451,00 A 600,00 4
Maior que 600,00 5

2) Criar um procedimento de nome prc_insere_proprietario para inserir dados na tabela loc_proprietario , este procedimento
recebera como parâmetro todas as colunas da tabela loc_proprietario com exceção da chave primária que deve ser obtida
automaticamente selecionando o ultimo valor da chave incrementando + 1. Utilize todos os exceptions necessários para
garantir que o tratamento de erro(mensagens) seja gerenciado pela aplicação.
3) Criar um procedimento de nome prc_insere_grupo para inserir dados na tabela loc_grupo, este procedimento recebera como
parâmetro todas as colunas da tabela loc_grupo, com exceção da chave primária que deve ser obtida automaticamente
selecionando o ultimo valor da chave incrementando + 1. Utilize todos os exceptions necessários para garantir que o
tratamento de erro(mensagens) seja gerenciado pela aplicação. Caso ocorra alguma anormalidade, exiba uma mensagem de
erro significativa.
*/