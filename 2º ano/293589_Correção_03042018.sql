set serveroutput on
declare
    v_data  date := to_date('&Data','dd/mm/yyyy');
    v_cont  number := 1;
begin
    loop
        dbms_output.put_line (to_char(v_data,'dd/mm/yyyy day'));
        v_cont := v_cont + 1;
        v_data := v_data + 1;
        exit when v_cont = 365;
    end loop;
end;


declare
    v_numero number := &Numero_maior_que_5;
begin
    if v_numero < 5 then
        dbms_output.put_line ('N�mero inv�lido.');
    else
        for x in 1..v_numero loop
            if mod(x,2)<>0 then
                dbms_output.put_line ('N(Impar)=>' || x);
            end if;
        end loop;
    end if;
end;





select * from loc_proprietario


declare
    v_cd_proprietario   loc_proprietario.cd_proprietario%type := &Cod_proprietario;
    v_nome_proprietario   loc_proprietario.nome_proprietario%type;
    v_tp_proprietario   loc_proprietario.tp_proprietario%type;
    v_retorno   number;
    v_tipo_prop varchar2(100);
begin
    select count(1) 
      into v_retorno
      from loc_proprietario
     where cd_proprietario = v_cd_proprietario;
    
    if v_retorno = 0 then
        dbms_output.put_line ('N�O EXISTE DADOS DE PROPRIETARIO CADASTRADO !!');
    else
        select nome_proprietario, tp_proprietario
          into v_nome_proprietario, v_tp_proprietario
          from loc_proprietario
        where cd_proprietario = v_cd_proprietario;
        
        if v_tp_proprietario ='F' then
            v_tipo_prop := 'Pessoa F�sica';
        elsif v_tp_proprietario = 'J' then
            v_tipo_prop := 'Pessoa Jur�dica';
        end if;
        
        dbms_output.put_line ('O propriet�rio ' || v_cd_proprietario 
        || ' - ' || v_nome_proprietario ||  ' �  ' || v_tipo_prop );
    end if;
end;

select * from loc_grupo

declare
    v_cd_grupo   loc_grupo.cd_grupo%type := &Cod_grupo;
    v_ds_grupo   loc_grupo.ds_grupo%type;
    v_cont       number;
begin
    select count(1) 
      into v_cont
      from loc_grupo
     where cd_grupo = v_cd_grupo;
    
    if v_cont = 0 then
        dbms_output.put_line ('N�O EXISTE DADOS DE GRUPO DE VE�CULO CADASTRADO !!');
    else
        select ds_grupo
          into v_ds_grupo
          from loc_grupo
         where cd_grupo = v_cd_grupo;
         
         dbms_output.put_line ('O c�digo do grupo de ve�culo ' || v_cd_grupo
         || '  tem a sua descri��o como ' || v_ds_grupo);
    end if;
end;









select * from loc_proprietario

select p.nome_proprietario, v.nr_placa, v.modelo, v.cor 
  from loc_veiculo v, loc_proprietario p
 where v.cd_proprietario = p.cd_proprietario;
 
 
 
CZR9988
BZT2255
declare
    v_nr_placa  loc_veiculo.nr_placa%type := '&Placa';
    v_modelo    loc_veiculo.modelo%type;
    v_cor       loc_veiculo.cor%type;
    v_nome_prop loc_proprietario.nome_proprietario%type;
    v_cont      number;
begin
    select count(1)
      into v_cont
      from loc_veiculo v, loc_proprietario p
     where nr_placa = v_nr_placa
       and v.cd_proprietario = p.cd_proprietario;
    if v_cont = 0 then
        dbms_output.put_line ('N�O EXISTE DADOS DE VE�CULO CADASTRADO !!');
    else
        select p.nome_proprietario, v.nr_placa, v.modelo, v.cor 
          into v_nome_prop, v_nr_placa, v_modelo, v_cor
          from loc_veiculo v, loc_proprietario p
         where v.cd_proprietario = p.cd_proprietario
           and v.nr_placa = v_nr_placa;
        
        dbms_output.put_line ('O ve�culo de placa' || v_nr_placa || 
        '  pertence ao propriet�rio ' || v_nome_prop ||  
        '  � do modelo ' || v_modelo || ' e tem a cor' || v_cor);
    end if;
end;



select * from loc_cliente


declare
    v_cd_cliente    loc_cliente.cd_cliente%type := &Cod_cliente;
    v_nm_cliente    loc_cliente.nm_cliente%type;
    v_telefone      loc_cliente.telefone%type;
    v_cont          number;
begin
    select count(1)
      into v_cont
      from loc_cliente
     where cd_cliente = v_cd_cliente;
    if v_cont = 0 then
        dbms_output.put_line ('N�O EXISTE DADOS DE CLIENTE CADASTRADO !!');
    else
        select nm_cliente, telefone
          into v_nm_cliente, v_telefone
          from loc_cliente
         where cd_cliente = v_cd_cliente;
    
        dbms_output.put_line ('O cliente' || v_cd_cliente || ' - ' 
        || v_nm_cliente ||  '  possui  o telefone ' || v_telefone);
     end if;
end;

