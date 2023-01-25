INSERT INTO customers (name, age, type, is_active)
VALUES (
    MD5(RAND()),
    30*RAND()+20,
    'villain',
    IF(RAND() > 0.6, 1, 0)
);