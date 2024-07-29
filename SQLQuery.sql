create table Subject
(
subjectId int Primary key,
subTitle varchar(20) not null,
)

create table Book
(
BookID int primary key,
Title varchar(20) not null,
Price int not null,
Volume int not null,
author varchar(20) not null,
PublishDate Date not null,
subjectId int,
constraint fk_Subject foreign key(subjectId) references Subject(subjectId)
)

INSERT INTO Subject (subjectId, subtitle) VALUES
(1, 'Maths'),
(2, 'Science'),
(3, 'English'),
(4, 'Social'),
(5, 'Biology');

INSERT INTO Book (bookId, title, price, volume, author, publishDate, subjectId) VALUES
(1, 'book1', 300, 1, 'author1', '2022-01-15', 1),
(2, 'book2', 500, 2, 'author2', '2022-02-20', 1),
(3, 'book3', 350, 1, 'author3', '2023-03-05', 2),
(4, 'book4', 450, 1, 'author4', '2023-04-12', 2),
(5, 'book5', 400, 1, 'author5', '2021-05-10', 3),
(6, 'book6', 250, 1, 'author6', '2021-06-18', 3),
(7, 'book7', 350, 1, 'author7', '2020-07-25', 4),
(8, 'book8', 500, 2, 'author8', '2020-08-30', 4),
(9, 'book9', 200, 1, 'author9', '2022-09-15', 5),
(10, 'book10', 450, 1, 'author10', '2022-10-05', 5),
(11, 'book11', 550, 2, 'author11', '2022-11-15', 1),
(12, 'book12', 300, 1, 'author12', '2023-01-10', 2),
(13, 'book13', 400, 1, 'author13', '2021-02-20', 3),
(14, 'book14', 450, 2, 'author14', '2020-04-05', 4),
(15, 'book15', 350, 1, 'author15', '2022-11-25', 5);


select Book.title, Book.price, Book.volume, Book.author, Book.publishDate, Subject.subtitle
from Book
inner join Subject ON Book.subjectId = Subject.subjectId;

select * from Book
where publishDate between '2022-01-01' and '2023-12-31';

select author, COUNT(*) AS total from Book group by author;

select Subject.subtitle, COUNT(Book.bookId) as numberOfBooks FROM Book inner join subject on Book.subjectId = Subject.subjectId
group by subject.subtitle;


select count(*) as numberofBooks from book where year(PublishDate)<2000

update  Book set price= 500, volume=2 where BookID=2

update book set price = price*1.1 where subjectId=(select subjectId from Subject where subTitle='English')

delete book where BookID=15

select * from Book where price > 500 and subjectId = (select subjectId from Subject WHERE subtitle = 'Maths');

select Book.title, Book.price, Book.volume, Book.author, Book.publishDate, Subject.subtitle FROM Book INNER JOIN Subject on Book.subjectId = Subject.subjectId
order by Subject.subtitle ASC;

select min(price) as minPrice from Book

select count(*) as countOfmaths from book where subjectId=(select subjectId from Subject where subtitle='Maths')

