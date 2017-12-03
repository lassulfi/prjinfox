-- Comentários
-- a linha abaixo cria um banco de dados
create database dbinfox;
-- a linha abaixo escolhe o banco de dados a ser utilizado
use dbinfox;
-- o bloco de instruções abaixo cria uma tabela
create table tbusuarios(
	iduser int primary key,
    usuario varchar(50) not null,
    fone varchar(15),
    login varchar(15) not null unique,
    senha varchar(15) not null
);
-- o comando abaixo descreve a tabela
desc tbusuarios;

-- a linha abaixo insere dados na table(CRUD)
-- create --> insert
insert into tbusuarios(iduser,usuario,fone,login,senha)
value(1,'Luis Daniel Assulfi','19993285624','luis.assulfi','l123456');

-- a linha abaixo exibe os dados da tabela
-- read --> select
select * from tbusuarios;

insert into tbusuarios(iduser,usuario,fone,login,senha) values 
(2,'Administrador','99999999','admin','admin'),
(3,'Bill Gates','99999999','bill.gates','b123456');

-- a linha abaixo modifica dados na tabela
-- update --> update
update tbusuarios 
set fone='88888888'
where iduser=2;

-- a linha abaixo apaga um registro da tabela
-- delete --> delete
delete from tbusuarios where iduser=3;

create table tbclientes(
	idcli int primary key auto_increment,
    nomecli varchar(50) not null,
    endcli varchar(100),
    fonecli varchar(50) not null,
    emailcli varchar(50)
);

desc tbclientes;

insert into tbclientes(nomecli,endcli,fonecli,emailcli) values 
('Linus Torvalds','Rua Tux, 2015','99999999','linus@linux.com');

select * from tbclientes;

create table tbos(
	os int primary key auto_increment,
    data_os timestamp default current_timestamp,
    equipamento varchar(150) not null,
    defeito varchar(150) not null,
    servico varchar(150),
    tecnico varchar(30),
    valor decimal(10,2),
    idcli int not null,
    foreign key(idcli) references tbclientes(idcli)
);

drop table tbos;

desc tbos;

insert into tbos(equipamento, defeito, servico, tecnico, valor, idcli) value
('Notebook','Não liga','Troca da fonte','Zé',87.50,1);

select * from tbos;

select * from tbclientes;

delete from tbos where os=2;

-- O código abaixo traz informações de duas tabelas
select o.os,equipamento,defeito,valor,
	c.nomecli,fonecli
from tbos as o
inner join tbclientes as c
on (o.idcli = c.idcli);

desc tbusuarios;

-- A linha abaixo adiciona um campo a tabela
alter table tbusuarios add column perfil varchar(20) not null;

select * from tbusuarios;

update tbusuarios
set perfil='admin' where iduser=2;
update tbusuarios
set perfil='user' where iduser=3;

select * from tbusuarios where iduser=1;

desc tbos;

-- A linha abaixo altera a tabela adicionando um campo em uma determinada posicao
alter table tbos add tipo varchar(15) not null after data_os;

alter table tbos add situacao varchar(20) not null after tipo;

select * from tbos;

-- A instrução abaixo seleciona e ordena por nome todos os clientes cadastrados
select * from tbclientes order by nomecli;

-- O bloco de instrução abaixo faz a seleção e união de dados de duas tabelas
-- oser é uma variável que contém os dados da tbos
-- cli é outra variável que contém os dados da tbclientes
select
oser.os,data_os,tipo,situacao,equipamento,valor,
cli.nomecli,fonecli
from tbos as oser
inner join tbclientes as cli
on(cli.idcli = oser.idcli);