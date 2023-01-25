INSERT INTO customers (name, age, type, description, is_active)
VALUES (
    MD5(RAND()),
    60*RAND(),
    'citizen',
    CONCAT(MD5(RAND()), MD5(RAND())),
    IF(RAND() > 0.3, 1, 0)
);