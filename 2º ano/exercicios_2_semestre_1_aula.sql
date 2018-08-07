/*Crie uma fun��o chamada fun_qtd_func_depto que retorne a quantidade total de funcion�rio de um determinado
departamento. Caso n�o exista funcion�rio cadastrado para o departamento informado, ou ocorrer qualquer erro imprevisto,
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
1) Crie uma fun��o chamada fun_qtd_func_depto que retorne a quantidade total de funcion�rio de um determinado
departamento. Caso n�o exista funcion�rio cadastrado para o departamento informado, ou ocorrer qualquer erro imprevisto,
retornar o valor 0 (zero).
2) Desenvolva uma fun��o denominada fun_nome_ve�culo que vai ter um retorno varchar2. Essa fun��o vai receber como
par�metro a placa do ve�culo e selecionar as seguintes colunas: Modelo + Cor + e tipo do autom�vel. Concatene essas colunas na
vari�vel de retorno da fun��o. Caso a placa do ve�culo n�o esteja cadastrada, parar o processamento emitindo a seguinte
mensagem de erro �Placa <nrplaca> do ve�culo n�o est� cadastrada. Favor informar um c�digo v�lido !�.
3) Desenvolva uma fun��o denominada fun_nome_grupo que vai ter um retorno varchar2. Essa fun��o vai receber como
par�metro o c�digo do grupo de ve�culo e selecionar o nome do grupo na tabela LOC_GRUPO. Caso o c�digo do grupo n�o esteja
cadastrado, parar o processamento emitindo a seguinte mensagem de erro �C�digo do grupo n�o est� cadastrado. Favor informar
um c�digo v�lido !�.
4) Crie uma fun��o chamada fun_val_med_loc_cliente que retorne o valor total m�dio gasto por determinado cliente. Caso n�o
exista o cliente cadastrado, ou ocorrer qualquer erro imprevisto, retornar o valor 0 (zero).
*/

/*
Procedures:
1) Desenvolva um procedimento chamado prc_gera_estrelas_cli que tem como objetivo atualizar o n�mero de estrelas de cada
cliente(coluna nr_estrelas: tabela LOC_CLIENTE). O n�mero de estrelas que um cliente pode possuir est� entre 1 e 5 estrelas.
Para ser poss�vel identificar qual estrela o cliente possui, utilize a fun��o FUN_VAL_MED_LOC_CLI para obter o valor m�dio
total gasto pelo cliente e utilize a tabela abaixo, que determina em qual faixa o valor m�dio de loca��o o cliente se encaixa. No
final do processamento, confirme as transa��es realizadas e cria uma instru��o SQL � parte que verifica se a estrela gerada
para cada cliente est� de acordo com as loca��es hoje cadastradas.
De 0,00 A 200,00 1
De 201,00 A 300,00 2
De 301,00 A 450,00 3
De 451,00 A 600,00 4
Maior que 600,00 5

2) Criar um procedimento de nome prc_insere_proprietario para inserir dados na tabela loc_proprietario , este procedimento
recebera como par�metro todas as colunas da tabela loc_proprietario com exce��o da chave prim�ria que deve ser obtida
automaticamente selecionando o ultimo valor da chave incrementando + 1. Utilize todos os exceptions necess�rios para
garantir que o tratamento de erro(mensagens) seja gerenciado pela aplica��o.
3) Criar um procedimento de nome prc_insere_grupo para inserir dados na tabela loc_grupo, este procedimento recebera como
par�metro todas as colunas da tabela loc_grupo, com exce��o da chave prim�ria que deve ser obtida automaticamente
selecionando o ultimo valor da chave incrementando + 1. Utilize todos os exceptions necess�rios para garantir que o
tratamento de erro(mensagens) seja gerenciado pela aplica��o. Caso ocorra alguma anormalidade, exiba uma mensagem de
erro significativa.
*/