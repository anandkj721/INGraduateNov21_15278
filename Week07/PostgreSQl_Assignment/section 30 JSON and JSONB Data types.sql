--160. What Is JSON And How To Store In Database

CREATE TABLE books (
	id serial,
	bookinfo jsonb
)

INSERT INTO books (bookinfo)
VALUES
('{"title": "Introduction To Data Mining",
  "author": ["Pang-ning Tan", "Michael Steinbach", "Vipin Kumar"],
  "publisher":"Addison Wesley", "date": 2006}'),
('{"title": "Deep Learning with Python", "author": "Francois Chollet", "publisher":"Manning", "date": 2018}'),
('{"title": "Neural Networks - A Visual Intro for Beginners", "author": "Michael Taylor", "publisher":"self", "date": 2017}'),
('{"title": "Big Data In Practice", "author": "Bernard Marr", "publisher":"Wiley", "date": 2016}');

SELECT * FROM books

 SELECT bookinfo->'author' FROM books;

 INSERT INTO books (bookinfo) VALUES
 ('{"title" : "arificial intelligence with uncertainty", "author": ["Deyi Li" ,"Yi Du"], 
  "publisher":"chapman and hall", "date": 2008}');


SELECT bookinfo->'title' FROM books;

Q)enter the following:
arificial intelligence with uncertainty by Deyi Li and Yi Du that was published 
in 2008 by chaman and hall

and select back the titles of all the books in table.

 INSERT INTO books (bookinfo) VALUES
 ('{"title" : "arificial intelligence with uncertainty", "author": ["Deyi Li" ,"Yi Du"], 
  "publisher":"chapman and hall", "date": 2008}');


SELECT bookinfo->'title' FROM books;