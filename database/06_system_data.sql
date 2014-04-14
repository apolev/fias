
INSERT INTO place_types(id, title)
VALUES
    (1, 'транспортный объект')
;

INSERT INTO place_types(id, title, parent_id, system_name)
VALUES
    (2, 'аэропорт', 1, 'airport'),
    (3, 'вокзал', 1, 'railway_station'),
    (4, 'автовокзал', 1, 'bus_terminal'),
    (5, 'порт', 1, 'port')
;

INSERT INTO places(title, type_id)
VALUES
    ('Внуково', 2),
    ('Домодедово', 2),
    ('Остафьево', 2),
    ('Раменское', 2),
    ('Чкаловский', 2),
    ('Пулково 1', 2),
    ('Пулково 2', 2),
    ('Балтийский', 3),
    ('Витебский', 3),
    ('Ладожский', 3),
    ('Московский', 3),
    ('Финляндский', 3),
    ('Белорусский', 3),
    ('Казанский', 3),
    ('Киевский', 3),
    ('Курский', 3),
    ('Ленинградский', 3),
    ('Павелецкий', 3),
    ('Рижский', 3),
    ('Савеловский', 3),
    ('Ярославский', 3),
    ('Щелковский', 4),
    ('Павелецкий', 4),
    ('Морской', 5)
;

UPDATE places p
SET full_title = p.title || ' ' || pt.title
FROM place_types pt
WHERE pt.id = p.type_id;

SELECT setval('place_types_id_seq',  (SELECT MAX(id) FROM place_types LIMIT 1));
