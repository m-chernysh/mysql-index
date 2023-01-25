docker compose exec mysql bash

mysql -p

mysql> CREATE DATABASE db_test;
mysql> USE db_test;
mysql> SHOW ENGINES;


CREATE TABLE customers (
    id          INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(50) NOT NULL,
    age         INT         NOT NULL,
    type        VARCHAR(25) NOT NULL,
    description TEXT        NULL,
    is_active   BOOL
);


docker compose exec mysql ./app/generator.sh

# https://dev.mysql.com/doc/refman/8.0/en/create-index.html

# Обычный индекс b-tree
CREATE INDEX idx_type ON customers (type) USING BTREE;

explain
select count(*)
from customers
where type='superman';


# Индекс по строке, префикс
CREATE INDEX idx_name ON customers (name);
CREATE INDEX idx_part_of_name ON customers (name(10));

explain
select id, name, age
from customers
where name like "02a155%"
order by `name`
limit 50 offset 800;



# Составной индекс (покрывающий)
CREATE INDEX idx_type_age ON customers (type, age) USING BTREE;

explain
select age
from customers
where type='superman'
  and age between 20 and 30;


# Функциональные
ALTER TABLE customers ADD INDEX idx_length_description((LENGTH(description)));

explain
select count(*)
from customers
where length(description) = 128;



# Частичные
CREATE INDEX inx_type_active_active ON customers (type) WHERE is_active=1;
