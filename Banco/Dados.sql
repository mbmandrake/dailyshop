insert into CATEGORIA values ('Eletrônicos', 1, GETDATE());
insert into CATEGORIA values ('Cozinha', 1, GETDATE());
insert into CATEGORIA values ('Sala', 1, GETDATE());

insert into ENDERECO values ('Herman Stern', 'Colina', '29167081', 100, 'ES');
insert into ENDERECO values ('Alfredo Chaves', 'Domingos Martins', '29167081', 100, 'ES');

insert into GRUPO values ('Cliente', 'Grupo criado para clientes', 1, GETDATE());
insert into GRUPO values ('Administrador', 'Grupo criado para administradores', 1, GETDATE());

insert into PRODUTO values ('Televisão', 10.10, 'Plasma', 10.10, 10.10, 1, 1, GETDATE());
insert into PRODUTO values ('Videogame', 10.10, 'Playstation', 10.10, 10.10, 1, 1, GETDATE());

insert into USUARIO values ('Matheus', 'mmborges@ucl.br', '123', '27997345561', '79787199018', 1, 1, 1, GETDATE()); 
insert into USUARIO values ('Meyfeo', 'Meyfeo@ucl.br', '123', '27997345561', '42887065050', 1, 1, 1, GETDATE()); 

insert into LISTA_PRODUTO values (1, 30.30, 'Boleto', 'Em andamento', 1, GETDATE());
insert into LISTA_PRODUTO values (1, 10.30, 'Boleto', 'Pago', 1, GETDATE());

insert into ITEM_COMPRA values (1, 1, 10.10, 10, 100.10);