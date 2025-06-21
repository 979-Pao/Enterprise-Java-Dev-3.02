-- Crear tabla Author
CREATE TABLE Author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Crear tabla BlogPost
CREATE TABLE BlogPost (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    author_id INT,
    title VARCHAR(200),
    word_count INT,
    views INT,
    FOREIGN KEY (author_id) REFERENCES Author(author_id)
);

-- Insertar autores
INSERT INTO Author (name) VALUES
('Maria Charlotte'),
('Juan Perez'),
('Gemma Alcocer');

-- Insertar posts (uno por uno por las subconsultas)
INSERT INTO BlogPost (title, word_count, views, author_id)
VALUES ('Best Paint Colors', 814, 14,
        (SELECT author_id FROM Author WHERE name = 'Maria Charlotte'));

INSERT INTO BlogPost (title, word_count, views, author_id)
VALUES ('Small Space Decorating Tips', 1146, 221,
        (SELECT author_id FROM Author WHERE name = 'Juan Perez'));

INSERT INTO BlogPost (title, word_count, views, author_id)
VALUES ('Hot Accessories', 986, 105,
        (SELECT author_id FROM Author WHERE name = 'Maria Charlotte'));

INSERT INTO BlogPost (title, word_count, views, author_id)
VALUES ('Mixing Textures', 765, 22,
        (SELECT author_id FROM Author WHERE name = 'Maria Charlotte'));

INSERT INTO BlogPost (title, word_count, views, author_id)
VALUES ('Kitchen Refresh', 1242, 307,
        (SELECT author_id FROM Author WHERE name = 'Juan Perez'));

INSERT INTO BlogPost (title, word_count, views, author_id)
VALUES ('Homemade Art Hacks', 1002, 193,
        (SELECT author_id FROM Author WHERE name = 'Maria Charlotte'));

INSERT INTO BlogPost (title, word_count, views, author_id)
VALUES ('Refinishing Wood Floors', 1571, 7542,
        (SELECT author_id FROM Author WHERE name = 'Gemma Alcocer'));
