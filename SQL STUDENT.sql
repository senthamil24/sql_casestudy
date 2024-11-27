
select *from adaptation;
select*from book;
select*from book_review;
select*from author;

SELECT
  author_name,
  title,
  publish_year
FROM author
JOIN book
  ON author.id = book.author;
  insert into author values(6,"suganthi",2002,2025);
  select*from author;
  select*from book;
  SELECT
  name,
  title,
  publish_year
FROM author
JOIN book
  ON author.id = book.author
WHERE publish_year >= 2005;


select*from books;