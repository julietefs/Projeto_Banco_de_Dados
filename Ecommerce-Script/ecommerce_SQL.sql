/* criação do banco de dados para o cenário  de E-commerce */
create database ecommerce;
use ecommerce;

/* criar tabela clientes*/
create table clients(
	idClient int auto_increment primary key,
	Fname varchar(10),
	Minit char(3),
	Lname varchar(20),
	CPF char(11) not null,
	Address varchar(30),
	constraint unique_cpf_client unique (CPF)
);

show table clients;

+----------+-------------+------+-----+---------+----------------+
| Field    | Type        | Null | Key | Default | Extra          |
+----------+-------------+------+-----+---------+----------------+
| idClient | int(11)     | NO   | PRI | NULL    | auto_increment |
| Fname    | varchar(10) | YES  |     | NULL    |                |
| Minit    | char(3)     | YES  |     | NULL    |                |
| Lname    | varchar(20) | YES  |     | NULL    |                |
| CPF      | char(11)    | NO   | UNI | NULL    |                |
| Address  | varchar(30) | YES  |     | NULL    |                |
+----------+-------------+------+-----+---------+----------------+



/* inserindo dados clientes*/
insert into clients
	values(1,'Carina','Mel','Santos','15478963245','Rua sapucaia do sul, MG'),
	      (2, 'João','Gon','Barcellos','45698712365','Av Gondim, PB'),
	      (3, 'Werner','Heu','Malta','12352587469','Rua Tavora de Almeida, RJ'),
	      (4, 'Maria','Cla','Silva','653989674','Rua Agamenon Magalhães,PE'),
	      (5, 'Ricardo','Cam','Oliveira','78549632456','Av Mon. Julio Maria,SP');

select * from clients;

+----------+---------+-------+-----------+-------------+----------------------------+
| idClient | Fname   | Minit | Lname     | CPF         | Address                    |
+----------+---------+-------+-----------+-------------+----------------------------+
|        1 | Carina  | Mel   | Santos    | 15478963245 | Rua sapucaia do sul, MG    |
|        2 | João    | Gon   | Barcellos | 45698712365 | Av Gondim, PB              |
|        3 | Werner  | Heu   | Malta     | 12352587469 | Rua Tavora de Almeida, RJ  |
|        4 | Maria   | Cla   | Silva     | 653989674   | Rua Agamenon Magalhães,PE  |
|        5 | Ricardo | Cam   | Oliveira  | 78549632456 | Av Mon. Julio Maria,SP     |
+----------+---------+-------+-----------+-------------+----------------------------+

/* criar tabela produto*/
/* Size = dimensão do produto*/
create table product(
	idProduct int auto_increment primary key,
	Pname varchar(10) not null,
	classification_kids bool default false,
	category enum ('Eletrônico','Vestimenta','Brinquedos','Alimentos') not null,
	avaliacao decimal default 0,
	size varchar(10)
);

desc product;

+---------------------+-----------------------------------------------------------+------+-----+---------+----------------+
| Field               | Type                                                      | Null | Key | Default | Extra          |
+---------------------+-----------------------------------------------------------+------+-----+---------+----------------+
| idProduct           | int(11)                                                   | NO   | PRI | NULL    | auto_increment |
| Pname               | varchar(10)                                               | NO   |     | NULL    |                |
| classification_kids | tinyint(1)                                                | YES  |     | 0       |                |
| category            | enum('Eletrônico','Vestimenta','Brinquedos','Alimentos')  | NO   |     | NULL    |                |
| avaliacao           | decimal(10,0)                                             | YES  |     | 0       |                |
| size                | varchar(10)                                               | YES  |     | NULL    |                |
+---------------------+-----------------------------------------------------------+------+-----+---------+----------------+

/* inserindo dados na tabela produto */
 
insert into product values (1,'Webcam', false,'Eletrônico',4.4,null);
insert into product values (2,'Camisa Poo', false,'Vestimenta',5.0, null);
insert into product values (3,'Biscoito', false,'Alimentos',4.3, null);
insert into product values (4,'Boneco Bin', true,'Brinquedos',5.0, 10);
insert into product values (5,'Mouse', false, 'Eletrônico',5.0, 8);

select * from product;
+-----------+------------+---------------------+-------------+-----------+------+
| idProduct | Pname      | classification_kids | category    | avaliacao | size |
+-----------+------------+---------------------+-------------+-----------+------+
|         1 | Webcam     |                   0 | Eletrônico  |         4 | NULL |
|         2 | Camisa Poo |                   0 | Vestimenta  |         5 | NULL |
|         3 | Biscoito   |                   0 | Alimentos   |         4 | NULL |
|         4 | Boneco Bin |                   1 | Brinquedos  |         5 | 10   |
|         5 | Mouse      |                   0 | Eletrônico  |         5 | 8    |
+-----------+------------+---------------------+-------------+-----------+------+


/* criar tabela pedido*/
create table orders(
	idOrder int auto_increment primary key,
	idOrderClient int,
	orderStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
    orderDescription varchar(255),
    SenValue decimal default 10,
    idpaymentCash bool default false, 
    constraint fk_orders_client foreign key (idOrderClient) references clients(idClient)
);

desc orders;
+------------------+---------------------------------------------------+------+-----+------------------+----------------+
| Field            | Type                                              | Null | Key | Default          | Extra          |
+------------------+---------------------------------------------------+------+-----+------------------+----------------+
| idOrder          | int(11)                                           | NO   | PRI | NULL             | auto_increment |
| idOrderClient    | int(11)                                           | YES  | MUL | NULL             |                |
| orderStatus      | enum('Cancelado','Confirmado','Em processamento') | YES  |     | Em processamento |                |
| orderDescription | varchar(255)                                      | YES  |     | NULL             |                |
| SenValue         | decimal(10,0)                                     | YES  |     | 10               |                |
| idpaymentCash    | tinyint(1)                                        | YES  |     | 0                |                |
+------------------+---------------------------------------------------+------+-----+------------------+----------------+

/* inserindo dados na tabela orders*/

insert into orders values(1, 1, 'Confirmado',	'2x Webcam Multilaser', default, default);
insert into orders values(2, 2, 'Em processamento',' 3x Camisa Adidas', 25.5, false);	
insert into orders values(3, 3, default, '1x Biscoito', default, true);
insert into orders values(4, 4, 'Confirmado', '5x Boneco Biu', 50.0, false);
insert into orders values(5, 5, default, '1x Mouse', default, false);


select *from orders;
+---------+---------------+------------------+----------------------+----------+---------------+
| idOrder | idOrderClient | orderStatus      | orderDescription     | SenValue | idpaymentCash |
+---------+---------------+------------------+----------------------+----------+---------------+
|       1 |             1 | Confirmado       | 2x Webcam Multilaser |       10 |             0 |
|       2 |             2 | Em processamento |  3x Camisa Adidas    |       26 |             0 |
|       3 |             3 | Em processamento | 1x Biscoito          |       10 |             1 |
|       4 |             4 | Confirmado       | 5x Boneco Biu        |       50 |             0 |
|       5 |             5 | Em processamento | 1x Mouse             |       10 |             0 |
+---------+---------------+------------------+----------------------+----------+---------------+

/* criar tabela estoque */
create table productStorage(
	idProdStorage int auto_increment primary key,
	storageLocation varchar(255),
	quantity int default 0
);


desc productStorage;
+-----------------+--------------+------+-----+---------+----------------+
| Field           | Type         | Null | Key | Default | Extra          |
+-----------------+--------------+------+-----+---------+----------------+
| idProdStorage   | int(11)      | NO   | PRI | NULL    | auto_increment |
| storageLocation | varchar(255) | YES  |     | NULL    |                |
| quantity        | int(11)      | YES  |     | 0       |                |
+-----------------+--------------+------+-----+---------+----------------+

/* inserindo dados na tabela estoque */ 

insert into productStorage values (1, 'Rio de Janeiro, RJ', 90);
insert into productStorage values (2, 'Recife, PE', 65);
insert into productStorage values (3, 'São Paulo, SP', 110);
insert into productStorage values (4, 'Manaus, AM', 58);
insert into productStorage values (5, 'Curitiba, PR', 32);


select * from productStorage;
+---------------+--------------------+----------+
| idProdStorage | storageLocation    | quantity |
+---------------+--------------------+----------+
|             1 | Rio de Janeiro, RJ |       90 |
|             2 | Recife, PE         |       65 |
|             3 | São Paulo, SP      |      110 |
|             4 | Manaus, AM         |       58 |
|             5 | Curitiba, PR       |       32 |
+---------------+--------------------+----------+


/* criar tabela fornecedor*/
create table supplier(
	idSupplier int auto_increment primary key,
	SocialName varchar(255) not null,
	CNPJ varchar(20) not null,
	contact char(11) not null,
	constraint unique_supplier unique (CNPJ)
);

desc supplier;
+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| idSupplier | int(11)      | NO   | PRI | NULL    | auto_increment |
| SocialName | varchar(255) | NO   |     | NULL    |                |
| CNPJ       | varchar(20)  | NO   | UNI | NULL    |                |
| contact    | char(11)     | NO   |     | NULL    |                |
+------------+--------------+------+-----+---------+----------------+

/* inserindo dados na tabela fornecedor */
insert into supplier values (1, 'CIL - COMERCIO DE INFORMATICA LTDA', '24073694000589', '8540055000');
insert into supplier values (2, 'HAZ COMÉRCIO VAREJISTA S.A.','45213698741235', '8426359874');
insert into supplier values (3, 'MERCADINHO RIO CLARO LTDA', '45821476932075', '4125789634');
insert into supplier values (4, 'RI HAPPY BRINQUEDOS S.A.', '47854692001463','8132004569');
insert into supplier values (5, 'LOGNET COMÉRCIO DE ELETRONICOS LTDA','63001524879524','4695231700');

 select * from supplier;
+------------+--------------------------------------+----------------+------------+
| idSupplier | SocialName                           | CNPJ           | contact    |
+------------+--------------------------------------+----------------+------------+
|          1 | CIL - COMERCIO DE INFORMATICA LTDA   | 24073694000589 | 8540055000 |
|          2 | HAZ COMÉRCIO VAREJISTA S.A.          | 45213698741235 | 8426359874 |
|          3 | MERCADINHO RIO CLARO LTDA            | 45821476932075 | 4125789634 |
|          4 | RI HAPPY BRINQUEDOS S.A.             | 47854692001463 | 8132004569 |
|          5 | LOGNET COMÉRCIO DE ELETRONICOS LTDA  | 63001524879524 | 4695231700 |
+------------+--------------------------------------+----------------+------------+

/* criar tabela vendedor*/
create table seller(
	idSeller int auto_increment primary key,
	SocialName varchar(255) not null,
	AbstName varchar (255),
	CNPJ varchar(20),
	CPF char(9),
	Location varchar(255),
	contact char(11) not null,
	constraint unique_cnpj_seller unique (CNPJ),
	constraint unique_cpf_seller unique (CPF)
);

desc seller;
+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| idSeller   | int(11)      | NO   | PRI | NULL    | auto_increment |
| SocialName | varchar(255) | NO   |     | NULL    |                |
| AbstName   | varchar(255) | YES  |     | NULL    |                |
| CNPJ       | varchar(20)  | YES  | UNI | NULL    |                |
| CPF        | char(9)      | YES  | UNI | NULL    |                |
| Location   | varchar(255) | YES  |     | NULL    |                |
| contact    | char(11)     | NO   |     | NULL    |                |
+------------+--------------+------+-----+---------+----------------+

/* inserindo dados na tabela vendedor */
insert into seller values (1, 'CALIL ELETRONICOS LTDA', 'CAL DO MOUSE', '32548965412007', null, 'Rua das ninfas n36, Recife-PE', '8148796215');
insert into seller values (2, 'TANIA VISCONDI MODAS LTDA-ME', 'TANIA MODAS','63654789230045', null, 'Av. Manoel Gondim, n400,Tibira-PB','8345632175');
insert into seller values (3, 'SECOS E MOLHADOS ATACADO E VAREJO', 'MERCADINHO SECOS E MOLHADOS', '56320014789542', null, 'Rua Mandacaru, n38, Ferreiros-PE','8176524391');
insert into seller values (4, 'ATLANTIS TOY LTDA', 'ATLANTIS TOY', '21045632147854', null, 'Rua Avenca, n90, São Paulo-SP','1186235907');
insert into seller values (5, 'BLANTIDIO ELETRONICOS LTDA','BALANTIDIO TECH', '34785412025789', null, 'Av Mateo Alonso, n24, Caruaru-PE', '8196324785');

select * from seller;
+----------+-----------------------------------+-----------------------------+----------------+------+-----------------------------------+------------+
| idSeller | SocialName                        | AbstName                    | CNPJ           | CPF  | Location                          | contact    |
+----------+-----------------------------------+-----------------------------+----------------+------+-----------------------------------+------------+
|        1 | CALIL ELETRONICOS LTDA            | CAL DO MOUSE                | 32548965412007 | NULL | Rua das ninfas n36, Recife-PE     | 8148796215 |
|        2 | TANIA VISCONDI MODAS LTDA-ME      | TANIA MODAS                 | 63654789230045 | NULL | Av. Manoel Gondim, n400,Tibira-PB | 8345632175 |
|        3 | SECOS E MOLHADOS ATACADO E VAREJO | MERCADINHO SECOS E MOLHADOS | 56320014789542 | NULL | Rua Mandacaru, n38, Ferreiros-PE  | 8176524391 |
|        4 | ATLANTIS TOY LTDA                 | ATLANTIS TOY                | 21045632147854 | NULL | Rua Avenca, n90, São Paulo-SP     | 1186235907 |
|        5 | BLANTIDIO ELETRONICOS LTDA        | BALANTIDIO TECH             | 34785412025789 | NULL | Av Mateo Alonso, n24, Caruaru-PE  | 8196324785 |
+----------+-----------------------------------+-----------------------------+----------------+------+-----------------------------------+------------+



/* criando tabela Produtos por vendedor(terceiro) */
create table productSeller(
	idPseller int,
	idPproduct int,
	prodQuantity int default 1,
	primary key (idPseller, idPproduct),
	constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
	constraint fk_product_product foreign key (idPproduct) references product(idProduct)
);

desc productSeller;
+--------------+---------+------+-----+---------+-------+
| Field        | Type    | Null | Key | Default | Extra |
+--------------+---------+------+-----+---------+-------+
| idPseller    | int(11) | NO   | PRI | NULL    |       |
| idPproduct   | int(11) | NO   | PRI | NULL    |       |
| prodQuantity | int(11) | YES  |     | 1       |       |
+--------------+---------+------+-----+---------+-------+


/* inserindo dados na tabela produtos por vendedor (terceiro) */
insert into productSeller values (4, 4, 26);
insert into productSeller values (1, 1, 45);
insert into productSeller values (2, 2, default);
insert into productSeller values (3, 3, 63);
insert into productSeller values (5, 5, 99);

select* from productSeller;
+-----------+------------+--------------+
| idPseller | idPproduct | prodQuantity |
+-----------+------------+--------------+
|         1 |          1 |           45 |
|         2 |          2 |            1 |
|         3 |          3 |           63 |
|         4 |          4 |           26 |
|         5 |          5 |           99 |
+-----------+------------+--------------+



/* criando tabela relação entre produto/pedido */
create table productOrder(
	idPOproduct int,
	idPOorder int,
	poQuantity int default 1,
	poStatus enum('Disponível','Sem estoque') default 'Disponível',
	primary key (idPOproduct, idPOorder),
	constraint fk_productorder_seller foreign key (idPOproduct) references product(idProduct),
	constraint fk_productorder_product foreign key (idPOorder) references orders(idOrder)
);

desc productOrder;
+-------------+-----------------------------------+------+-----+-------------+-------+
| Field       | Type                              | Null | Key | Default     | Extra |
+-------------+-----------------------------------+------+-----+-------------+-------+
| idPOproduct | int(11)                           | NO   | PRI | NULL        |       |
| idPOorder   | int(11)                           | NO   | PRI | NULL        |       |
| poQuantity  | int(11)                           | YES  |     | 1           |       |
| poStatus    | enum('Disponível','Sem estoque')  | YES  |     | Disponível  |       |
+-------------+-----------------------------------+------+-----+-------------+-------+


/* inserindo dados na tabela produto/pedido */
insert into productOrder values (1, 1, 2, 'Disponível');
insert into productOrder values (2, 2, 3, 'Disponível');
insert into productOrder values (3, 3, 1, default);
insert into productOrder values (4, 4, 5, 'Disponível');
insert into productOrder values (5, 5, 1, default);

select * from productOrder;
+-------------+-----------+------------+-------------+
| idPOproduct | idPOorder | poQuantity | poStatus    |
+-------------+-----------+------------+-------------+
|           1 |         1 |          2 | Disponível  |
|           2 |         2 |          3 | Disponível  |
|           3 |         3 |          1 | Disponível  |
|           4 |         4 |          5 | Disponível  |
|           5 |         5 |          1 | Disponível  |
+-------------+-----------+------------+-------------+



/* criação de tabela relação Produto em estoque */
create table storageLocation(
	idLproduct int,
	idLstorage int,
	location varchar(255) not null,
	primary key (idLproduct, idLstorage),
	constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
	constraint fk_storage_location_storage foreign key (idLstorage) references productStorage(idProdStorage)
);

desc storageLocation;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| idLproduct | int(11)      | NO   | PRI | NULL    |       |
| idLstorage | int(11)      | NO   | PRI | NULL    |       |
| location   | varchar(255) | NO   |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+

/* inserindo dados na tabela produto em estoque */
insert into storageLocation values (1, 1, 'Rio de Janeiro, RJ');
insert into storageLocation values (2, 2, 'Recife-PE');
insert into storageLocation values (3, 3, 'São Paulo, SP');
insert into storageLocation values (4, 4, 'Manaus, AM');
insert into storageLocation values (5, 5, 'Curitiba, PR');

select * from storageLocation;
+------------+------------+--------------------+
| idLproduct | idLstorage | location           |
+------------+------------+--------------------+
|          1 |          1 | Rio de Janeiro, RJ |
|          2 |          2 | Recife-PE          |
|          3 |          3 | São Paulo, SP      |
|          4 |          4 | Manaus, AM         |
|          5 |          5 | Curitiba, PR       |
+------------+------------+--------------------+


/* criação de tabela relação produto/fornecedor */
create table productSupplier(
	idPsSupplier int,
	idPsProduct int,
	quantity int not null,
	primary key (idPsSupplier, idPsProduct),
	constraint fk_product_supplier_supplier foreign key (idPsSupplier)
	references supplier(idSupplier),
	constraint fk_product_supplier_product foreign key (idPsProduct)
	references product(idProduct)
);


desc productSupplier;
+--------------+---------+------+-----+---------+-------+
| Field        | Type    | Null | Key | Default | Extra |
+--------------+---------+------+-----+---------+-------+
| idPsSupplier | int(11) | NO   | PRI | NULL    |       |
| idPsProduct  | int(11) | NO   | PRI | NULL    |       |
| quantity     | int(11) | NO   |     | NULL    |       |
+--------------+---------+------+-----+---------+-------+


/* inserindo dados na tabela produto/fornecedor */ 
insert into productSupplier values (1, 1, 45);
insert into productSupplier values (2, 2, 1);
insert into productSupplier values (3, 3, 63);
insert into productSupplier values (4, 4, 26);
insert into productSupplier values (5, 5, 99);

 select * from productSupplier;
+--------------+-------------+----------+
| idPsSupplier | idPsProduct | quantity |
+--------------+-------------+----------+
|            1 |           1 |       45 |
|            2 |           2 |        1 |
|            3 |           3 |       63 |
|            4 |           4 |       26 |
|            5 |           5 |       99 |
+--------------+-------------+----------+


/* criação tabela pagamento*/
create table payments(
	idPayment int auto_increment primary key,
	idPayOrder int,
	idPayproduct int,
	typePayment enum('Cartão','Boleto','Pix'),
	totalPrice decimal(5,2) not null,
	paymentStatus enum('Autorizado','Não Autorizado','Processando','Estornado')default 'Processando',
	constraint fk_pay_order foreign key(idPayOrder) references orders(idOrder),
	constraint fk_pay_product foreign key(idPayproduct) references product(idProduct)
);

desc payments;
+---------------+----------------------------------------------------------------+------+-----+-------------+----------------+
| Field         | Type                                                           | Null | Key | Default     | Extra          |
+---------------+----------------------------------------------------------------+------+-----+-------------+----------------+
| idPayment     | int(11)                                                        | NO   | PRI | NULL        | auto_increment |
| idPayOrder    | int(11)                                                        | YES  | MUL | NULL        |                |
| idPayproduct  | int(11)                                                        | YES  | MUL | NULL        |                |
| typePayment   | enum('Cartão','Boleto','Pix')                                  | YES  |     | NULL        |                |
| totalPrice    | decimal(5,2)                                                   | NO   |     | NULL        |                |
| paymentStatus | enum('Autorizado','Não Autorizado','Processando','Estornado')  | YES  |     | Processando |                |
+---------------+----------------------------------------------------------------+------+-----+-------------+----------------+



/* inserindo dados na tabela pagamento */
insert into payments values (1, 1, 1, 'Cartão', 95, 'Autorizado');
insert into payments values (2, 2, 2, 'Cartão', 110, default);
insert into payments values (3, 3, 3, 'Pix', 11.5, 'Autorizado');
insert into payments values (4, 4, 4,'Cartão', 259.9, 'Autorizado');
insert into payments values (5, 5, 5,'Cartão', 86, 'Autorizado');

select * from payments;
+-----------+------------+--------------+-------------+------------+---------------+
| idPayment | idPayOrder | idPayproduct | typePayment | totalPrice | paymentStatus |
+-----------+------------+--------------+-------------+------------+---------------+
|         1 |          1 |            1 | Cartão      |      95.00 | Autorizado    |
|         2 |          2 |            2 | Cartão      |     110.00 | Processando   |
|         3 |          3 |            3 | Pix         |      11.50 | Autorizado    |
|         4 |          4 |            4 | Cartão      |     259.90 | Autorizado    |
|         5 |          5 |            5 | Cartão      |      86.00 | Autorizado    |
+-----------+------------+--------------+-------------+------------+---------------+


/* criando tabela cartão de crédito */
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

select * from CreditCard;
+-------------+---------------+--------------+------------------+----------------+--------------------+--------------+
| idCredicard | idPayCredCard | credCardFlag | cardNumber       | expirationDate | cardHolderName     | securityCode |
+-------------+---------------+--------------+------------------+----------------+--------------------+--------------+
|           1 |             1 | Master       | 6300048751239548 | 2023-06-25     | KARENINA H HOLANDA | 654          |
|           2 |             2 | ELO          | 4563210008796004 | 2025-04-22     | PAULO M CARDOSO    | 213          |
|           3 |             4 | Master       | 3356001478000259 | 2026-02-18     | AMANDA S CARDONA   | 965          |
|           4 |             5 | Visa         | 123000456247828  | 2022-03-14     | NATAN O SILVEIRA   | 315          |
+-------------+---------------+--------------+------------------+----------------+--------------------+--------------+


/*criando tabela pix */
create table Cash(
idCash int auto_increment primary key,
idPayCash int,
typePix enum('CPF','E-mail','Telefone','Chave Aleatória') not null,
Pix varchar(45),
constraint fk_pay_cash foreign key(idPayCash) references Payments(idPayment)
);

desc Cash;
+-----------+----------------------------------------------------+------+-----+---------+----------------+
| Field     | Type                                               | Null | Key | Default | Extra          |
+-----------+----------------------------------------------------+------+-----+---------+----------------+
| idCash    | int(11)                                            | NO   | PRI | NULL    | auto_increment |
| idPayCash | int(11)                                            | YES  | MUL | NULL    |                |
| typePix   | enum('CPF','E-mail','Telefone','Chave Aleatória')  | NO   |     | NULL    |                |
| Pix       | varchar(45)                                        | YES  |     | NULL    |                |
+-----------+----------------------------------------------------+------+-----+---------+----------------+


/* inserindo dados na tabela pix */
insert into Cash values (1, 3, 'CPF','365420149');

 select * from Cash;
+--------+-----------+---------+-----------+
| idCash | idPayCash | typePix | Pix       |
+--------+-----------+---------+-----------+
|      1 |         3 | CPF     | 365420149 |
+--------+-----------+---------+-----------+

/* criando tabela Boleto */
create table Ticket(
idTicket int auto_increment primary key,
idPayTicket int,
bankName varchar(30) not null,
barCode char(50) not null,
dueDate date not null,
constraint fk_pay_ticket foreign key(idPayTicket) references Payments(idPayment)
);

desc Ticket;
+-------------+-------------+------+-----+---------+----------------+
| Field       | Type        | Null | Key | Default | Extra          |
+-------------+-------------+------+-----+---------+----------------+
| idTicket    | int(11)     | NO   | PRI | NULL    | auto_increment |
| idPayTicket | int(11)     | YES  | MUL | NULL    |                |
| bankName    | varchar(30) | NO   |     | NULL    |                |
| barCode     | char(50)    | NO   |     | NULL    |                |
| dueDate     | date        | NO   |     | NULL    |                |
+-------------+-------------+------+-----+---------+----------------+













