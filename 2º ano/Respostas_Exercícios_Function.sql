1)

create or replace function fun_qtd_func_depto 
(p_cd_depto in loc_funcionario.cd_depto%type) return number
is
  v_qtd   number;
begin
  select count(1)
    into v_qtd
    from loc_funcionario
   where cd_depto = p_cd_depto;
   
   return v_qtd;
exception
  when others then
    return 0;
end;

  
   
select    FUN_QTD_FUNC_DEPTO(50) from dual


grant execute on FUN_QTD_FUNC_DEPTO to public

select pf0064.FUN_QTD_FUNC_DEPTO(50) from dual


select * from pf0064.loc_funcionario;



create or replace function fun_nome_veiculo
(p_nr_placa   loc_veiculo.nr_placa%type)
return varchar2
as
  v_mensagem    varchar2(100);
begin
  select tipo_automovel || ' ' ||  modelo || ' ' || cor 
    into v_mensagem
    from loc_veiculo
   where nr_placa = p_nr_placa;
   return v_mensagem;
exception
  when no_data_found then
    return 'Placa '|| p_nr_placa ||' do veículo não está cadastrada. Favor informar um código válido !';
end;

select fun_nome_veiculo('DRV11111') from dual;

select * from loc_veiculo;


create or replace function fun_nome_grupo 
(p_cd_grupo   loc_grupo.cd_grupo%type) return varchar2
is
  cursor c_grupo (n_grupo loc_grupo.cd_grupo%type) is
  select ds_grupo 
    from loc_grupo
   where cd_grupo = n_grupo;
  
  v_grupo c_grupo%rowtype;
  nao_existe  exception;
begin
  open c_grupo (p_cd_grupo);
  loop
    fetch c_grupo into v_grupo;
    exit when c_grupo%notfound;
    
  end loop;
  close c_grupo;
  if   v_grupo.ds_grupo is null then
    raise nao_existe;
  end if;
  
  return v_grupo.ds_grupo;

exception
  when nao_existe then
    return 'Código do grupo não está cadastrado. Favor informar um código válido !';
end;


create or replace function fun_nome_grupo 
(p_cd_grupo loc_grupo.cd_grupo%type) return varchar2
is
  v_mensagem  varchar2(100);
begin
  select ds_grupo
    into v_mensagem
    from loc_grupo
   where cd_grupo = p_cd_grupo;
  return v_mensagem;
exception
  when no_data_found then
    return 'Código do grupo não está cadastrado. Favor informar um código válido !';
end;


select fun_nome_grupo(1) from dual;




select nvl(avg(vl_total),0) from loc_pedido_locacao where cd_cliente=100000


create or replace function fun_val_med_loc_cliente 
(
p_cd_cliente    loc_pedido_locacao.cd_cliente%type
) return number
is
  v_valor   number;
begin
  select trunc(nvl(avg(vl_total),0))
    into v_valor
    from loc_pedido_locacao
   where cd_cliente = p_cd_cliente;
  return v_valor;
exception
  when others then
    return 0;
end;


select FUN_VAL_MED_LOC_CLIENTE(10000000) from dual
























