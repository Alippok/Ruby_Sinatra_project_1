DROP TABLE stocks;
DROP TABLE albums;
DROP TABLE artists;



CREATE TABLE artists(
id SERIAL4 PRIMARY KEY,
name VARCHAR(255)
);

CREATE TABLE albums(
id SERIAL4 PRIMARY KEY,
title VARCHAR(255),
artist_id int4 REFERENCES artists(id),
buy_price int4,
sell_price int4
);

CREATE TABLE stocks(
id SERIAL4 PRIMARY KEY,
album_id int4 REFERENCES albums(id),
quantity INT2
);

