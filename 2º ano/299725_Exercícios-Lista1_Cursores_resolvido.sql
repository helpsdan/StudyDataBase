﻿-- 1) Desenvolva um script que tem como objetivo exibir o nome do banco cadastrado. Esse script deve ter como parâmetro de chamada o código do banco e a partir desse código, deve-se pesquisar se o banco está cadastrado. Em caso positivo, exiba seu nome. Em caso negativo, aborte a execução e exiba a seguinte mensagem de erro : O banco de código <999> não está cadastrado! (Utilize tratamento de exceção adequeado para solucionar este exercício.)

-- Solução:
declare
     v_codigo   loc_banco.cd_banco%type := '&CodigoBanco';
     v_nome     loc_banco.nm_banco%type;
begin
    select nm_banco
      into v_nome
      from loc_banco
     where cd_banco = v_codigo;
     
     dbms_output.put_line ('O banco ' || v_codigo || ' é ' || v_nome);
exception
    when no_data_found then
        raise_application_error(-20001,'O banco de código '|| v_codigo ||' não está cadastrado!');
    when too_many_rows then
        raise_application_error(-20002,'O banco de código '|| v_codigo ||' retorna mais do que 1 registro.');
    when others then
        raise_application_error(-20003,'Erro não tratado. ' || sqlcode);
end;


=====================================

-- 2)Desenvolva um script que tem como objetivo fazer com que o valor total da coluna tabela de locação do Carloca (LOC_PEDIDO_LOCACAO) esteja de acordo com os itens cadastrados na tabela de item de locação (LOC_ITEM_LOCACAO).

-- Siga as seguintes regras:
/*
Desenvolva um cursor que deverá ler toda a tabela de pedido de locação. 
Para cada pedido de locação (selecione o valor total dos itens daquele pedido). Com o valor total do item, compare esse valor com o valor atual do pedido de locação. Caso seja diferente, atualize o valor. Em caso negativo, leia o próximo pedido.
No final do processamento confirme as alterações realizadas.
Solução:
*/

select * from loc_pedido_locacao where nr_pedido=1148

select * from loc_item_locacao where nr_pedido=1148


declare
    cursor c_pedido is
        select nr_pedido, nvl(vl_total,0) vl_total
          from loc_pedido_locacao;
    
    cursor c_total (p_nr_pedido    loc_pedido_locacao.nr_pedido%type) is
        select sum(vl_total) total
          from loc_item_locacao
         where nr_pedido = p_nr_pedido;
    
    v_pedido    c_pedido%rowtype;
    v_total     c_total%rowtype;

begin
    open c_pedido;
    loop
        fetch c_pedido into v_pedido;
        exit when c_pedido%notfound;
            
            open c_total (v_pedido.nr_pedido);
            loop
                fetch c_total into v_total;
                exit when c_total%notfound;
                 if (v_pedido.vl_total <> v_total.total) then   
                    begin
                        update loc_pedido_locacao
                           set vl_total = v_total.total
                         where nr_pedido = v_pedido.nr_pedido;
                    exception
                        when others then
                        dbms_output.put_line ('Erro ' || sqlcode);
                    end;
                end if;            
            end loop;
            close c_total;
       end loop;
    close c_pedido;
commit;
exception
    when others then
        dbms_output.put_line (sqlerrm);
end;
=====================================

/*3) Desenvolva um script que vai receber como parâmetro o código do cliente e retornar os seguintes dados da última locação feita pelo cliente : o código do cliente, o nome do cliente, a data da última locação no formato (dd/mm/yyyy) , o tipo de pagamento feito pelo cliente em extenso (CHEQUE, DINHEIRO, CARTÃO) e o valor da locação ( no formato brasileiro).

Utilize o pacote DBMS_OUTPUT.PUT_LINE para exibir o texto conforme abaixo :

'O cliente' || <cd_cliente>> || ' - ' || <<nm_cliente>> ||  '  fez a última locação em  ' || <<99/99/999>> || ' e o pagamento realizado foi em ' || <<tp_pagamento>> || ' no valor de R$ ' || 999.999,99.

Caso o código do cliente não esteja cadastrado na  tabela, retornar a mensagem  “NÃO EXISTE DADOS DE CLIENTE CADASTRADO !”

Formato brasileiro: select to_char(1234.66,'999G999D99') FROM DUAL;
Solução:
*/

declare
    v_cd_cliente    loc_cliente.cd_cliente%type := &CodigoCliente;
    v_nm_cliente    loc_cliente.nm_cliente%type;
    v_dt_locacao    varchar2(100);
    v_vl_total      varchar2(100);
    v_tp_pagto      varchar2(100);
begin
select 
    c.nm_cliente, 
    to_char(p.dt_locacao,'dd/mm/yyyy') dt_locacao,
    to_char(vl_total,'999G999D99') vl_total,
    decode(p.tp_pagto,'DI','DINHEIRO','CH','CHEQUE','CC','CARTÃO','DESCONHECIDO') TP_PAGTO
    into v_nm_cliente, v_dt_locacao, v_vl_total, v_tp_pagto
  from loc_cliente c, loc_pedido_locacao p
 where c.cd_cliente = p.cd_cliente
   and p.nr_pedido = (select max(x.nr_pedido) from loc_pedido_locacao x
                        where x.cd_cliente = c.cd_cliente)
   and c.cd_cliente = v_cd_cliente;
   
   dbms_output.put_line('O cliente' || v_cd_cliente || ' - ' || v_nm_cliente ||  '  fez a última locação em  ' || v_dt_locacao || ' e o pagamento realizado foi em ' || v_tp_pagto || ' no valor de R$ ' || v_vl_total);
exception
    when no_data_found then
        raise_application_error (-20001,'NÃO EXISTE DADOS DE CLIENTE CADASTRADO !');
    when too_many_rows then
        raise_application_error (-20001,'Chave duplicada.');
    when others then
        raise_application_error (-20001,'Erro não tratado.' || sqlcode);
end;
