CREATE TABLE artists(
id SERIAL4 PRIMARY KEY,
name VARCHAR(255)
);

CREATE TABLE albums(
id SERIAL4 PRIMARY KEY,
title VARCHAR(255),
artist_id int4 REFERENCES artists(id)
);

CREATE TABLE stocks(
id SERIAL4 PRIMARY KEY,
artist_id int4 REFERENCES artists(id),
album_id int4 REFERENCES albums(id),
quantity INT2
);

