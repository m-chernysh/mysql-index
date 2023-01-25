INSERT INTO customers (name, age, type, description, is_active)
VALUES (
    MD5(RAND()),
    20*RAND()+20,
    'superman',
    CONCAT(MD5(RAND()), MD5(RAND()), MD5(RAND()), MD5(RAND())),
    IF(RAND() > 0.5, 1, 0)
);