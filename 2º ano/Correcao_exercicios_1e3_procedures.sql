select * from loc_cliente

update loc_cliente set nr_estrelas=null


desc FUN_VAL_MED_LOC_CLIENTE


create or replace procedure prc_gera_estrelas_cli
is
  cursor c_cliente is
    select cd_cliente
      from loc_cliente;
  
  v_cliente c_cliente%rowtype;
  v_gasto   number;
begin
  open c_cliente;
  loop
    fetch c_cliente into v_cliente;
    exit when c_cliente%notfound;
      v_gasto:=FUN_VAL_MED_LOC_CLIENTE(v_cliente.cd_cliente);
      
      if v_gasto < 201 then
        update loc_cliente 
           set nr_estrelas = 1
         where cd_cliente = v_cliente.cd_cliente;
      elsif v_gasto > 201 and v_gasto < 300 then
        update loc_cliente 
           set nr_estrelas = 2
         where cd_cliente = v_cliente.cd_cliente;
      elsif v_gasto > 301 and v_gasto < 450 then
        update loc_cliente 
           set nr_estrelas = 3
         where cd_cliente = v_cliente.cd_cliente;
      elsif v_gasto > 451 and v_gasto < 600 then
        update loc_cliente 
           set nr_estrelas = 2
         where cd_cliente = v_cliente.cd_cliente;
      elsif v_gasto > 201 and v_gasto < 300 then
        update loc_cliente 
           set nr_estrelas = 4
         where cd_cliente = v_cliente.cd_cliente;
      elsif v_gasto > 600 then
        update loc_cliente 
           set nr_estrelas = 5
         where cd_cliente = v_cliente.cd_cliente;
      end if;
  end loop;
  close c_cliente;
exception
  when others then
    raise_application_error(-20000, 'Erro=>'||sqlerrm);
end;
/

begin
  prc_gera_estrelas_cli;
end;
/





select * from loc_grupo

create or replace procedure prc_insere_grupo
(
p_ds_grupo    in    loc_grupo.ds_grupo%type,
p_vl_locacao_diaria   in  loc_grupo.vl_locacao_diaria%type
) 
is
  v_chave   number;
begin
  select max(cd_grupo)+1
    into v_chave
    from loc_grupo;

  insert into loc_grupo (cd_grupo, ds_grupo, vl_locacao_diaria)
   values (v_chave, p_ds_grupo, p_vl_locacao_diaria);
   
  commit;
exception
  when dup_val_on_index then
    raise_application_error(-20000, 'Chave existente. Tente novamente.');
  when  others then
    raise_application_error(-20001, 'Erro genérico.'||sqlerrm);
end;



begin
  prc_insere_grupo (p_vl_locacao_diaria=>200,p_ds_grupo=>'Aula 2TDSR');
end;


