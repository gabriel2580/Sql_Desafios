/*
Desafio: pedido dos clientes
*/

/*
Etapa 1 

Criamos um banco de dados para clientes e seus pedidos. Contudo,
 nem todos os clientes fizeram algum pedido. Faça uma consulta que
 lista o nome, name, e o email de todos os clientes seguidos pelo
 item e pelo preço, price, dos pedidos que eles fizeram. Use um LEFT OUTER JOIN
 para que um cliente seja listado mesmo se ele não fez pedidos e não adicione nenhum ORDER BY.
*/

CREATE TABLE customers (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45),
    email VARCHAR(45));
    
INSERT INTO customers (name, email) VALUES ("Doctor Who", "doctorwho@timelords.com");
INSERT INTO customers (name, email) VALUES ("Harry Potter", "harry@potter.com");
INSERT INTO customers (name, email) VALUES ("Captain Awesome", "captain@awesome.com");

CREATE TABLE orders (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    customer_id INTEGER,
    item VARCHAR(45),
    price REAL);
    
INSERT INTO orders (customer_id, item, price)
VALUES (1, "Sonic Screwdriver", 1000.00);
INSERT INTO orders (customer_id, item, price)
VALUES (2, "High Quality Broomstick", 40.00);
INSERT INTO orders (customer_id, item, price)
VALUES (1, "TARDIS", 1000000.00);

SELECT * FROM customers;
SELECT * FROM orders;

SELECT name, email, item, price FROM
customers LEFT JOIN orders
ON customers.id = orders.customer_id;

/*
Etapa 2

Agora, crie outra consulta que vai resultar em uma linha para cada cliente,
 com seu nome name, seu emaile a quantia total de dinheiro que ele gastou
 com pedidos. Ordene as linhas de acordo com o dinheiro gasto, do que gastou mais para o que gastou menos.
(Dica: você sempre deve usar GROUP BY na coluna com maior probabilidade de ser única em uma linha).
*/

SELECT name, email, item, SUM(price)FROM
customers LEFT JOIN orders
ON customers.id = orders.customer_id
GROUP BY name
ORDER BY price DESC;


