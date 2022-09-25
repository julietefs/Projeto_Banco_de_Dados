/* criação do banco de dados para o cenário de Oficina */

create database carWorkshop;
use carWorkshop; 

/* criar tabela clientes*/
create table clients(
	idClient int auto_increment primary key,
	name varchar(45),
	CPF char(11) not null,
	Address varchar(255),
	contact char(10),
	email varchar(45),
	constraint unique_cpf_client unique (CPF)
);


desc clients;
+----------+--------------+------+-----+---------+----------------+
| Field    | Type         | Null | Key | Default | Extra          |
+----------+--------------+------+-----+---------+----------------+
| idClient | int(11)      | NO   | PRI | NULL    | auto_increment |
| name     | varchar(45)  | YES  |     | NULL    |                |
| CPF      | char(11)     | NO   | UNI | NULL    |                |
| Address  | varchar(255) | YES  |     | NULL    |                |
| contact  | char(10)     | YES  |     | NULL    |                |
| email    | varchar(45)  | YES  |     | NULL    |                |
+----------+--------------+------+-----+---------+----------------+

/* inserindo dados clientes*/
insert into clients values(1,'Carina V Santos','15478963245','Rua sapucaia do sul, MG','8394512036','carina@gmail.com');
insert into clients values (2, 'João G Barcellos','45698712365','Av Gondim, PB','8394563250','jgbarcellos@gmail.com');
insert into clients values (3, 'Werner Heuer Malta','12352587469','Rua Tavora de Almeida, RJ','8796320014','wernerm@outlook.com');
insert into clients values (4, 'Maria Clara da Silva','653989674','Rua Agamenon Magalhães,PE','8199850451','mclara@gmail.com');
insert into clients values (5, 'Ricardo Augusto Souza','78549632456','Av Mon. Julio Maria,SP','1193045001','ricardo@outlook.com');

 select * from clients;
+----------+-----------------------+-------------+----------------------------+------------+-----------------------+
| idClient | name                  | CPF         | Address                    | contact    | email                 |
+----------+-----------------------+-------------+----------------------------+------------+-----------------------+
|        1 | Carina V Santos       | 15478963245 | Rua sapucaia do sul, MG    | 8394512036 | carina@gmail.com      |
|        2 | João G Barcellos      | 45698712365 | Av Gondim, PB              | 8394563250 | jgbarcellos@gmail.com |
|        3 | Werner Heuer Malta    | 12352587469 | Rua Tavora de Almeida, RJ  | 8796320014 | wernerm@outlook.com   |
|        4 | Maria Clara da Silva  | 653989674   | Rua Agamenon Magalhães,PE  | 8199850451 | mclara@gmail.com      |
|        5 | Ricardo Augusto Souza | 78549632456 | Av Mon. Julio Maria,SP     | 1193045001 | ricardo@outlook.com   |
+----------+-----------------------+-------------+----------------------------+------------+-----------------------+

/* criar tabela veículo */ 
create table vehicle(
	idVehicle int auto_increment primary key,
	idVclient int,
	licensePlate varchar(10) not null,
	model varchar(45) not null,
	year char(4),
	color varchar(15),
	VIN char(17) not null,
	constraint unique_vin_vehicle unique (VIN),
	constraint fk_vehicle_clients foreign key (idVclient) references clients(idClient)
);

 desc vehicle;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| idVehicle    | int(11)     | NO   | PRI | NULL    | auto_increment |
| idVclient    | int(11)     | YES  | MUL | NULL    |                |
| licensePlate | varchar(10) | NO   |     | NULL    |                |
| model        | varchar(45) | NO   |     | NULL    |                |
| year         | char(4)     | YES  |     | NULL    |                |
| color        | varchar(15) | YES  |     | NULL    |                |
| VIN          | char(17)    | NO   | UNI | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+

/* inserindo dados veículo */
insert into vehicle values (1, 1, 'PLR3D97', 'SUV','2021','Preto','4Y1SL65848Z411439');
insert into vehicle values (2, 2, 'QRS8H45','SEDAN','2019','Prata','1H1SL55848Z411438');
insert into vehicle values (3, 3, 'LSB7B84','PICAPE','2022','Branco','9P1SL00848Z411668');
insert into vehicle values (4, 4, 'ARV6J98','SUV','2021','Petróleo','2U1SL77848Z411464');
insert into vehicle values (5, 5, 'BRA8J32','SEDÃ','2017','Prata','5V1SL65848Z811439');

select * from vehicle;
+-----------+-----------+--------------+--------+------+-----------+-------------------+
| idVehicle | idVclient | licensePlate | model  | year | color     | VIN               |
+-----------+-----------+--------------+--------+------+-----------+-------------------+
|         1 |         1 | PLR3D97      | SUV    | 2021 | Preto     | 4Y1SL65848Z411439 |
|         2 |         2 | QRS8H45      | SEDAN  | 2019 | Prata     | 1H1SL55848Z411438 |
|         3 |         3 | LSB7B84      | PICAPE | 2022 | Branco    | 9P1SL00848Z411668 |
|         4 |         4 | ARV6J98      | SUV    | 2021 | Petróleo  | 2U1SL77848Z411464 |
|         5 |         5 | BRA8J32      | SEDÃ   | 2017 | Prata     | 5V1SL65848Z811439 |
+-----------+-----------+--------------+--------+------+-----------+-------------------+

/* criar tabela mecânico */
create table mechanical(
	idMechanical int auto_increment primary key,
	name varchar(45),
	CPF char(11) not null,
	contact varchar(10)
);

desc mechanical;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| idMechanical | int(11)     | NO   | PRI | NULL    | auto_increment |
| name         | varchar(45) | YES  |     | NULL    |                |
| CPF          | char(11)    | NO   |     | NULL    |                |
| contact      | varchar(10) | YES  |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+

/* inserindo dados na tabela mecânico */
insert into mechanical values (1, 'Alessandro M Pontes','52314789654','8378541293');
insert into mechanical values (2, 'Marcelle K de Souza','63156987458','7852101004');
insert into mechanical values (3, 'Carlos Fragoso','30015247896','8921478520');
insert into mechanical values (4, 'Paulo Cardoso Silva','21003648597','8352014785');
insert into mechanical values (5, 'Bruno B Fraga','11236048597','8393254659');


select * from mechanical;
+--------------+---------------------+-------------+------------+
| idMechanical | name                | CPF         | contact    |
+--------------+---------------------+-------------+------------+
|            1 | Alessandro M Pontes | 52314789654 | 8378541293 |
|            2 | Marcelle K de Souza | 63156987458 | 7852101004 |
|            3 | Carlos Fragoso      | 30015247896 | 8921478520 |
|            4 | Paulo Cardoso Silva | 21003648597 | 8352014785 |
|            5 | Bruno B Fraga       | 11236048597 | 8393254659 |
+--------------+---------------------+-------------+------------+

/* criar tabela fornecedor */
create table supplier(
	idSupplier int auto_increment primary key,
	socialName varchar(45) not null,
	CNPJ varchar(20) not null,
	contact char(10) not null,
	abstName varchar(45),
	address varchar(45),
	email varchar(45),
	constraint unique_cnpj_supplier unique (CNPJ)
);

desc supplier;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| idSupplier | int(11)     | NO   | PRI | NULL    | auto_increment |
| socialName | varchar(45) | NO   |     | NULL    |                |
| CNPJ       | varchar(20) | NO   | UNI | NULL    |                |
| contact    | char(10)    | NO   |     | NULL    |                |
| abstName   | varchar(45) | YES  |     | NULL    |                |
| address    | varchar(45) | YES  |     | NULL    |                |
| email      | varchar(45) | YES  |     | NULL    |                |
+------------+-------------+------+-----+---------+----------------+

/* inserindo dados na tabela fornecedor */
insert into supplier values (1, 'CIL - COMERCIO DE PEÇAS LTDA', '24073694000589', '8540055000','CIL PEÇAS', 'Rua Diniz, n55, Fortaleza-CE','cilpecas@gmail.com');
insert into supplier values (2, 'HAZ COMÉRCIO AUTOMOBILISTICO S.A.','45213698741235', '8426359874','AUTO HAZ', 'Av Guimarães Rosa, n34, Recife-PE', 'autohaz@outlook.com');
insert into supplier values (3, 'CARDAN RIO CLARO LTDA', '45821476932075', '4125789634','CARDAN RIO CLARO', 'Rua Machado Gondim, n299, Patos-PB', 'cardanrc@yahoo.com');
insert into supplier values (4, 'CAMARAGIBE AUTOPEÇAS S.A.', '47854692001463','8132004569','CAMARAGIBE AUTOPEÇAS', 'Rua Clarisse Hertz, n986, Petrolina-PE', 'camautopecas@gmail.com');
insert into supplier values (5, 'LOGNET COMÉRCIO DE ELETRONICOS LTDA','63001524879524','4695231700','LOGNET', 'Rua Carcará do Meio, Timbaúba-PE', 'lognet@outlook.com'); 


select * from supplier;
+------------+--------------------------------------+----------------+------------+-----------------------+----------------------------------------+------------------------+
| idSupplier | socialName                           | CNPJ           | contact    | abstName              | address                                | email                  |
+------------+--------------------------------------+----------------+------------+-----------------------+----------------------------------------+------------------------+
|          1 | CIL - COMERCIO DE PEÇAS LTDA         | 24073694000589 | 8540055000 | CIL PEÇAS             | Rua Diniz, n55, Fortaleza-CE           | cilpecas@gmail.com     |
|          2 | HAZ COMÉRCIO AUTOMOBILISTICO S.A.    | 45213698741235 | 8426359874 | AUTO HAZ              | Av Guimarães Rosa, n34, Recife-PE      | autohaz@outlook.com    |
|          3 | CARDAN RIO CLARO LTDA                | 45821476932075 | 4125789634 | CARDAN RIO CLARO      | Rua Machado Gondim, n299, Patos-PB     | cardanrc@yahoo.com     |
|          4 | CAMARAGIBE AUTOPEÇAS S.A.            | 47854692001463 | 8132004569 | CAMARAGIBE AUTOPEÇAS  | Rua Clarisse Hertz, n986, Petrolina-PE | camautopecas@gmail.com |
|          5 | LOGNET COMÉRCIO DE ELETRONICOS LTDA  | 63001524879524 | 4695231700 | LOGNET                | Rua Carcará do Meio, Timbaúba-PE       | lognet@outlook.com     |
+------------+--------------------------------------+----------------+------------+-----------------------+----------------------------------------+------------------------+

/* criar itens em estoque */
create table productStorage(
	idProdStorage int auto_increment primary key,
	prodDescription varchar(45),
	storageLocation varchar(255),
	quantity int default 0,
	productValue decimal(5,2),
	category enum('Mecânica','Pneus','Elétrica','Fluidos') not null,
	maker enum('Ford','Fiat','Chevrolet','Citroen','Renault','BMW','Mercedes') not null
);

desc productStorage;
+-----------------+----------------------------------------------------------------------+------+-----+---------+----------------+
| Field           | Type                                                                 | Null | Key | Default | Extra          |
+-----------------+----------------------------------------------------------------------+------+-----+---------+----------------+
| idProdStorage   | int(11)                                                              | NO   | PRI | NULL    | auto_increment |
| prodDescription | varchar(45)                                                          | YES  |     | NULL    |                |
| storageLocation | varchar(255)                                                         | YES  |     | NULL    |                |
| quantity        | int(11)                                                              | YES  |     | 0       |                |
| productValue    | decimal(5,2)                                                         | YES  |     | NULL    |                |
| category        | enum('Mecânica','Pneus','Elétrica','Fluidos')                        | NO   |     | NULL    |                |
| maker           | enum('Ford','Fiat','Chevrolet','Citroen','Renault','BMW','Mercedes') | NO   |     | NULL    |                |
+-----------------+----------------------------------------------------------------------+------+-----+---------+----------------+



/* inserindo dados na tabela itens em estoque */
insert into productStorage values(1, 'Aditivo para radiador',  'Av Gondim, n777, João Pessoa-PB', 651, 52.4,'Fluidos','Chevrolet');
insert into productStorage values (2, 'Vela de ignição', 'Rua Tavora de Almeida, n342 Caruaru-PE', 411, 110, 'Mecânica','Fiat');
insert into productStorage values (3, 'Sensor Lambda', 'Av Mon Augusto, n33, Cabedelo-PB', 200, 35.5, 'Elétrica','Citroen');
insert into productStorage values (4, 'Pneu', 'Rua Mandacaru, n600, Petrolina-PE',1100, 400, 'Pneus','Ford');
insert into productStorage values (5, 'Pastilha de Freio', 'Rua Amélia, n11, Recife-PE',800, 67, 'Mecânica','Renault');

select * from productStorage;
+---------------+-----------------------+----------------------------------------+----------+--------------+-----------+-----------+
| idProdStorage | prodDescription       | storageLocation                        | quantity | productValue | category  | maker     |
+---------------+-----------------------+----------------------------------------+----------+--------------+-----------+-----------+
|             1 | Aditivo para radiador | Av Gondim, n777, João Pessoa-PB        |      651 |        52.40 | Fluidos   | Chevrolet |
|             2 | Vela de ignição       | Rua Tavora de Almeida, n342 Caruaru-PE |      411 |       110.00 | Mecânica  | Fiat      |
|             3 | Sensor Lambda         | Av Mon Augusto, n33, Cabedelo-PB       |      200 |        35.50 | Elétrica  | Citroen   |
|             4 | Pneu                  | Rua Mandacaru, n600, Petrolina-PE      |     1100 |       400.00 | Pneus     | Ford      |
|             5 | Pastilha de Freio     | Rua Amélia, n11, Recife-PE             |      800 |        67.00 | Mecânica  | Renault   |
+---------------+-----------------------+----------------------------------------+----------+--------------+-----------+-----------+



/* criar tabela de valores */
create table valueTable(
	idValueTable int auto_increment primary key,
	idPstorage int,
	evaluationValue decimal(5,2) not null,
	maintenanceValue decimal(5,2) not null,
	laborValue decimal(5,2),
	constraint fk_p_storage foreign key (idPstorage) references productStorage(idProdStorage)
);

desc valueTable;
+------------------+--------------+------+-----+---------+----------------+
| Field            | Type         | Null | Key | Default | Extra          |
+------------------+--------------+------+-----+---------+----------------+
| idValueTable     | int(11)      | NO   | PRI | NULL    | auto_increment |
| idPstorage       | int(11)      | YES  | MUL | NULL    |                |
| evaluationValue  | decimal(5,2) | NO   |     | NULL    |                |
| maintenanceValue | decimal(5,2) | NO   |     | NULL    |                |
| laborValue       | decimal(5,2) | YES  |     | NULL    |                |
+------------------+--------------+------+-----+---------+----------------+

/* inserindo dados na tabela de valores */
insert into valueTable values (1, 5, 250, 350, 300);
insert into valueTable values (2, 4, 250, 350, 300);
insert into valueTable values (3, 3, 540, 250, 300);
insert into valueTable values (4, 2, 110, 200, 250);
insert into valueTable values (5, 1, 300, 240, 150);

select * from valueTable;
+--------------+------------+-----------------+------------------+------------+
| idValueTable | idPstorage | evaluationValue | maintenanceValue | laborValue |
+--------------+------------+-----------------+------------------+------------+
|            1 |          5 |          250.00 |           350.00 |     300.00 |
|            2 |          4 |          250.00 |           350.00 |     300.00 |
|            3 |          3 |          540.00 |           250.00 |     300.00 |
|            4 |          2 |          110.00 |           200.00 |     250.00 |
|            5 |          1 |          300.00 |           240.00 |     150.00 |
+--------------+------------+-----------------+------------------+------------+


/* criar tabela estoque por fornecedor */
create table storageSupplier(
idStosupplier int,
idSupsupplier int,
quantity int not null,
constraint fk_sto_supplier foreign key (idStosupplier) references productStorage(idProdStorage),
constraint fk_sup_supplier foreign key (idSupsupplier) references supplier(idSupplier)
);

desc storageSupplier;
+---------------+---------+------+-----+---------+-------+
| Field         | Type    | Null | Key | Default | Extra |
+---------------+---------+------+-----+---------+-------+
| idStosupplier | int(11) | YES  | MUL | NULL    |       |
| idSupsupplier | int(11) | YES  | MUL | NULL    |       |
| quantity      | int(11) | NO   |     | NULL    |       |
+---------------+---------+------+-----+---------+-------+

/* inserindo dados na tabela estoque por fornecedor */
insert into storageSupplier values (1, 2, 64);
insert into storageSupplier values (2, 3, 110);
insert into storageSupplier values (3, 5, 50);
insert into storageSupplier values (4, 1, 600);
insert into storageSupplier values (5, 4, 70);

select * from storageSupplier;
+---------------+---------------+----------+
| idStosupplier | idSupsupplier | quantity |
+---------------+---------------+----------+
|             1 |             2 |       64 |
|             2 |             3 |      110 |
|             3 |             5 |       50 |
|             4 |             1 |      600 |
|             5 |             4 |       70 |
+---------------+---------------+----------+



/* criar tabela orçamento */
create table budget(
	idBudget int auto_increment primary key,
	value decimal(5,2),
	dataBudget timestamp default current_timestamp
);
/* adicionando coluna na tabela budget*/ 
alter table budget ADD idBtabvalue int;

/* adicionando fk na tabela budget*/ 
ALTER TABLE budget ADD CONSTRAINT fk_b_tabvalue  
FOREIGN KEY(idBtabvalue) REFERENCES valueTable(idValueTable);

desc budget;
+------------+--------------+------+-----+-------------------+----------------+
| Field      | Type         | Null | Key | Default           | Extra          |
+------------+--------------+------+-----+-------------------+----------------+
| idBudget   | int(11)      | NO   | PRI | NULL              | auto_increment |
| value      | decimal(5,2) | YES  |     | NULL              |                |
| dataBudget | timestamp    | NO   |     | CURRENT_TIMESTAMP |                |
+------------+--------------+------+-----+-------------------+----------------+


desc budget;
+-------------+--------------+------+-----+-------------------+----------------+
| Field       | Type         | Null | Key | Default           | Extra          |
+-------------+--------------+------+-----+-------------------+----------------+
| idBudget    | int(11)      | NO   | PRI | NULL              | auto_increment |
| value       | decimal(5,2) | YES  |     | NULL              |                |
| dataBudget  | timestamp    | NO   |     | CURRENT_TIMESTAMP |                |
| idBtabvalue | int(11)      | YES  | MUL | NULL              |                |
+-------------+--------------+------+-----+-------------------+----------------+




/*inserindo dados na tabela budget*/
insert into budget values (1, 742, default);
insert into budget values (2, 670, default);
insert into budget values (3, 112, default);
insert into budget values (4, 130, default);
insert into budget values (5, 967, default);

select * from budget;
+----------+--------+---------------------+
| idBudget | value  | dataBudget          |
+----------+--------+---------------------+
|        1 | 742.40 | 2022-09-25 00:37:03 |
|        2 | 670.00 | 2022-09-25 00:37:03 |
|        3 | 112.00 | 2022-09-25 00:38:41 |
|        4 | 130.00 | 2022-09-25 00:38:44 |
|        5 | 967.00 | 2022-09-25 00:37:55 |
+----------+--------+---------------------+

 

/* criar tabela equipe de mecanicos */
create table mechanicsTeam(
	idTmechanical int,
	idTbudget int,
	evaluationDate timestamp not null,
	primary key (idTmechanical, idTbudget),
	constraint fk_t_mechanical foreign key (idTmechanical) references mechanical(idMechanical),
	constraint fk_t_budget foreign key (idTbudget) references budget(idBudget)
);


desc mechanicsTeam;
+----------------+-----------+------+-----+-------------------+-----------------------------+
| Field          | Type      | Null | Key | Default           | Extra                       |
+----------------+-----------+------+-----+-------------------+-----------------------------+
| idTmechanical  | int(11)   | NO   | PRI | NULL              |                             |
| idTbudget      | int(11)   | NO   | PRI | NULL              |                             |
| evaluationDate | timestamp | NO   |     | CURRENT_TIMESTAMP | on update CURRENT_TIMESTAMP |
+----------------+-----------+------+-----+-------------------+-----------------------------+


/* inserindo dados na tabela equipe de mecânicos*/  
insert into mechanicsTeam values (1, 4, '2022-08-21 09:31:22');
insert into mechanicsTeam values (2, 3, '2022-08-15 10:46:15');
insert into mechanicsTeam values (3, 5, '2022-08-14 09:34:35');
insert into mechanicsTeam values (4, 1, '2022-08-10 11:44:16');
insert into mechanicsTeam values (5, 2, '2022-08-09 08:22:04');

select * from mechanicsTeam;
+---------------+-----------+---------------------+
| idTmechanical | idTbudget | evaluationDate      |
+---------------+-----------+---------------------+
|             1 |         4 | 2022-08-21 09:31:22 |
|             2 |         3 | 2022-08-15 10:46:15 |
|             3 |         5 | 2022-08-14 09:34:35 |
|             4 |         1 | 2022-08-10 11:44:16 |
|             5 |         2 | 2022-08-09 08:22:04 |
+---------------+-----------+---------------------+



/* criar tabela ordem de serviço */ 
create table orderService(
	idOrderservice int auto_increment primary key,
	idOsbudget int,
	descriptionService varchar(255),
	totalValue decimal(5,2) not null,
	requestDate timestamp default current_timestamp,
	deliveryDate date not null,
	constraint fk_os_budget foreign key (idOsbudget) references budget(idBudget)

);
desc orderService;
+--------------------+--------------+------+-----+-------------------+----------------+
| Field              | Type         | Null | Key | Default           | Extra          |
+--------------------+--------------+------+-----+-------------------+----------------+
| idOrderservice     | int(11)      | NO   | PRI | NULL              | auto_increment |
| idOsbudget         | int(11)      | YES  | MUL | NULL              |                |
| descriptionService | varchar(255) | YES  |     | NULL              |                |
| totalValue         | decimal(5,2) | NO   |     | NULL              |                |
| requestDate        | timestamp    | NO   |     | CURRENT_TIMESTAMP |                |
| deliveryDate       | date         | NO   |     | NULL              |                |
+--------------------+--------------+------+-----+-------------------+----------------+

/* inserindo dados na tabela ordem de serviço */
insert into orderService values (1, 1, '1x Aditivo p/ radiador, 1x revisão, 1x manutenção', 742.4, default, '2022-08-15');
insert into orderService values (2, 2, '1x Vela de ignição, 1x revisão, 1x manutenção', 670, default, '2022-08-14');
insert into orderService values (3, 3, '1x Sensor Lambda, 1x revisão, 1x manutenção', 112, default, '2022-08-20');
insert into orderService values (4, 4, '1x pneu, 1x revisão, 1x manutenção', 130, default, '2022-08-26');
insert into orderService values (5, 5, '1x Pastilha de Freio, 1x revisão, 1x manutenção', 967, default, '2022-08-19');


select * from orderService;
+----------------+------------+------------------------------------------------------+------------+---------------------+--------------+
| idOrderservice | idOsbudget | descriptionService                                   | totalValue | requestDate         | deliveryDate |
+----------------+------------+------------------------------------------------------+------------+---------------------+--------------+
|              1 |          1 | 1x Aditivo p/ radiador, 1x revisão, 1x manutenção    |     742.40 | 2022-09-25 01:32:06 | 2022-08-15   |
|              2 |          2 | 1x Vela de ignição, 1x revisão, 1x manutenção        |     670.00 | 2022-09-25 01:32:06 | 2022-08-14   |
|              3 |          3 | 1x Sensor Lambda, 1x revisão, 1x manutenção          |     112.00 | 2022-09-25 01:33:38 | 2022-08-20   |
|              4 |          4 | 1x pneu, 1x revisão, 1x manutenção                   |     130.00 | 2022-09-25 01:33:39 | 2022-08-26   |
|              5 |          5 | 1x Pastilha de Freio, 1x revisão, 1x manutenção      |     967.00 | 2022-09-25 01:32:06 | 2022-08-19   |
+----------------+------------+------------------------------------------------------+------------+---------------------+--------------+


/* criar tabela nota fiscal */
create table invoice(
	idInvoice int auto_increment primary key,
	idIorderservice int,
	invoiceNumber int not null,
	totalPrice decimal(5,2),
	constraint fk_i_order_service foreign key (idIorderservice) references orderService(idOrderservice)
);


mysql> desc invoice;
+-----------------+--------------+------+-----+---------+----------------+
| Field           | Type         | Null | Key | Default | Extra          |
+-----------------+--------------+------+-----+---------+----------------+
| idInvoice       | int(11)      | NO   | PRI | NULL    | auto_increment |
| idIorderservice | int(11)      | YES  | MUL | NULL    |                |
| invoiceNumber   | int(11)      | NO   |     | NULL    |                |
| totalPrice      | decimal(5,2) | YES  |     | NULL    |                |
+-----------------+--------------+------+-----+---------+----------------+

insert into invoice values (1, 1, 4112281, 742.4);
insert into invoice values (2, 2, 5123101, 670);
insert into invoice values (3, 3, 7013201, 112);
insert into invoice values (4, 4, 5642371, 130);
insert into invoice values (5, 5, 9452191, 967);

select * from invoice;
+-----------+-----------------+---------------+------------+
| idInvoice | idIorderservice | invoiceNumber | totalPrice |
+-----------+-----------------+---------------+------------+
|         1 |               1 |       4112281 |     742.40 |
|         2 |               2 |       5123101 |     670.00 |
|         3 |               3 |       7013201 |     112.00 |
|         4 |               4 |       5642371 |     130.00 |
|         5 |               5 |       9452191 |     967.00 |
+-----------+-----------------+---------------+------------+

/* criar tabela pagamento */
create table payments(
	idPayment int auto_increment primary key,
	idPayInvoice int,
	typePayment enum('Cartão','Pix','Dinheiro'),
	totalPrice decimal(5,2) not null,
	paymentStatus enum('Autorizado','Não Autorizado','Processando','Estornado')default 'Processando',
	constraint fk_pay_invoice foreign key(idPayInvoice) references invoice(idInvoice)	
); 


desc payments;
+---------------+----------------------------------------------------------------+------+-----+-------------+----------------+
| Field         | Type                                                           | Null | Key | Default     | Extra          |
+---------------+----------------------------------------------------------------+------+-----+-------------+----------------+
| idPayment     | int(11)                                                        | NO   | PRI | NULL        | auto_increment |
| idPayInvoice  | int(11)                                                        | YES  | MUL | NULL        |                |
| typePayment   | enum('Cartão','Pix','Dinheiro')                                | YES  |     | NULL        |                |
| totalPrice    | decimal(5,2)                                                   | NO   |     | NULL        |                |
| paymentStatus | enum('Autorizado','Não Autorizado','Processando','Estornado')  | YES  |     | Processando |                |
+---------------+----------------------------------------------------------------+------+-----+-------------+----------------+

/* inserindo dados na tabela pagamento */  
insert into payments values (1, 1, 'Cartão', 742, 'Autorizado');
insert into payments values (2, 2, 'Cartão', 670, default);
insert into payments values (3, 3, 'Pix', 1125, default);
insert into payments values (4, 4, 'Dinheiro', 130, 'Autorizado');
insert into payments values (5, 5, 'Cartão', 967, 'Autorizado');

select * from payments;
+-----------+--------------+-------------+------------+---------------+
| idPayment | idPayInvoice | typePayment | totalPrice | paymentStatus |
+-----------+--------------+-------------+------------+---------------+
|         1 |            1 | Cartão      |     742.40 | Autorizado    |
|         2 |            2 | Cartão      |     670.00 | Processando   |
|         3 |            3 | Dinheiro    |     130.00 | Autorizado    |
|         4 |            4 | Dinheiro    |     130.00 | Autorizado    |
|         5 |            5 | Cartão      |     967.00 | Autorizado    |
+-----------+--------------+-------------+------------+---------------+

/*criar tabela cartão de crédito */
create table CreditCard(
idCredicard int auto_increment primary key,
idPayCredCard int,
credCardFlag varchar(20) not null,
cardNumber char(16) not null,
expirationDate date not null,
cardHolderName varchar(45) not null,
securityCode char(3) not null,
constraint fk_pay_creditcard foreign key(idPayCredCard) references Payments(idPayment)
);

desc CreditCard;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| idCredicard    | int(11)     | NO   | PRI | NULL    | auto_increment |
| idPayCredCard  | int(11)     | YES  | MUL | NULL    |                |
| credCardFlag   | varchar(20) | NO   |     | NULL    |                |
| cardNumber     | char(16)    | NO   |     | NULL    |                |
| expirationDate | date        | NO   |     | NULL    |                |
| cardHolderName | varchar(45) | NO   |     | NULL    |                |
| securityCode   | char(3)     | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/* inserindo dados na tabela cartão de crédito */
insert into CreditCard values (1, 1, 'Master', '6300048751239548','2023-06-25', 'KARENINA H HOLANDA', '654');
insert into CreditCard values (2, 2, 'ELO', '4563210008796004', '2025-04-22', 'PAULO M CARDOSO', '213');
insert into CreditCard values (3, 4, 'Master', '3356001478000259', '2026-02-18', 'AMANDA S CARDONA', '965');
insert into CreditCard values (4, 5, 'Visa', '123000456247828', '2022-03-14', 'NATAN O SILVEIRA', '315');


mysql> select * from CreditCard;
+-------------+---------------+--------------+------------------+----------------+--------------------+--------------+
| idCredicard | idPayCredCard | credCardFlag | cardNumber       | expirationDate | cardHolderName     | securityCode |
+-------------+---------------+--------------+------------------+----------------+--------------------+--------------+
|           1 |             1 | Master       | 6300048751239548 | 2023-06-25     | KARENINA H HOLANDA | 654          |
|           2 |             2 | ELO          | 4563210008796004 | 2025-04-22     | PAULO M CARDOSO    | 213          |
|           3 |             4 | Master       | 3356001478000259 | 2026-02-18     | AMANDA S CARDONA   | 965          |
|           4 |             5 | Visa         | 123000456247828  | 2022-03-14     | NATAN O SILVEIRA   | 315          |
+-------------+---------------+--------------+------------------+----------------+--------------------+--------------+

/* criar tabela pix */
create table Pix(
idPix int auto_increment primary key,
idPaypix int,
typePix enum('CPF','E-mail','Telefone','Chave Aleatória') not null,
pixNumber varchar(45),
constraint fk_pay_pix foreign key(idPaypix) references Payments(idPayment)
);

desc Pix;
+-----------+----------------------------------------------------+------+-----+---------+----------------+
| Field     | Type                                               | Null | Key | Default | Extra          |
+-----------+----------------------------------------------------+------+-----+---------+----------------+
| idPix     | int(11)                                            | NO   | PRI | NULL    | auto_increment |
| idPaypix  | int(11)                                            | YES  | MUL | NULL    |                |
| typePix   | enum('CPF','E-mail','Telefone','Chave Aleatória')  | NO   |     | NULL    |                |
| pixNumber | varchar(45)                                        | YES  |     | NULL    |                |
+-----------+----------------------------------------------------+------+-----+---------+----------------+

/*inserindo dados na tabela pix*/
insert into Pix values (1, 2, 'CPF', '41203654785');

select * from Pix;
+-------+----------+---------+-------------+
| idPix | idPaypix | typePix | pixNumber   |
+-------+----------+---------+-------------+
|     1 |        2 | CPF     | 41203654785 |
+-------+----------+---------+-------------+

/* criar tabela dinheiro */
create table Cash(
	idCash int auto_increment primary key,
	idPayCash int,
	valuePay decimal(5,2) not null,
	constraint fk_pay_cash foreign key (idCash) references payments(idPayment)
);

desc Cash;
+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| idCash    | int(11)      | NO   | PRI | NULL    | auto_increment |
| idPayCash | int(11)      | YES  |     | NULL    |                |
| valuePay  | decimal(5,2) | NO   |     | NULL    |                |
+-----------+--------------+------+-----+---------+----------------+

/* inserindo dados na tabela dinheiro */
insert into Cash values (1, 3, 130);


