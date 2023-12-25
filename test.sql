CREATE DATABASE  BookDB;
USE BookDB;


CREATE TABLE IF NOT EXISTS  BookStore(
	book_id INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR (255),
	author VARCHAR(255),
	genre VARCHAR(100),
	price DECIMAL(10,2),
	quantity_in_stock INT);

INSERT INTO IGNORE BookStore(title,author,genre,price,quantity_in_stock)
      VALUES ('The Great Adventure', 'John Doe', 'Adventure', 24.99, 40),
('Mysterious Secrets', 'Jane Smith', 'Mystery', 18.99, 20),
('Romantic Escapade', 'Michael Johnson', 'Romance', 19.99, 35),
( 'Sci-Fi Wonders', 'Emily White', 'Science Fiction', 22.99, 25),
('Historical Odyssey', 'Robert Brown', 'Historical Fiction', 27.99, 30),
('Business Mastery', 'Sarah Miller', 'Business', 34.99, 15),
('Cooking Delights', 'Daniel Davis', 'Cookbook', 15.99, 50),
('Artistic Creations', 'Emma Taylor', 'Art', 29.99, 18),
('Thrilling Suspense', 'Christopher Lee', 'Thriller', 21.99, 22),
('Fantasy Realm', 'Olivia Green', 'Fantasy', 25.99, 28);


SELECT * FROM BookStore;




CREATE TABLE IF NOT EXISTS Customers(
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(255),
	email VARCHAR(255),
	phone VARCHAR (50)
);

INSERT    INTO IGNORE Customers(name,email,phone) VALUES ('Aram', 'aram.grigoryan@example.com', '+3741114520'),('Narek', 'narek.avetisyan@example.com', '+37493302562'),('Lilit', 'lilit.sargsyan@example.com', '+37494222555'),('Ani', 'ani.harutyunyan@example.com', '+37441102365');

SELECT * FROM Customers;





CREATE TABLE IF NOT EXISTS Sales(
	sale_id INT PRIMARY KEY AUTO_INCREMENT,
	book_id INT,
	customer_id INT,
	date_of_sale DATE,
	quantity_sold INT,
	total_price DECIMAL (10,2),
	FOREIGN KEY (book_id) REFERENCES BookStore(book_id),
        FOREIGN KEY (customer_id) REFERENCES Customers(customer_id));



INSERT   INTO  IGNORE  Sales (book_id, customer_id, date_of_sale, quantity_sold, total_price)
VALUES
(1, 1, '2023-01-01', 2, 41.98),
(2, 2, '2023-02-01', 1, 15.99),
(3, 3, '2023-03-01', 3, 59.97),
(4, 4, '2023-04-01', 2, 45.98),
(5, 1, '2023-05-01', 1, 24.99);
 


SELECT * FROM Sales;





SELECT
    Sales.date_of_sale,
    BookStore.title,
    Customers.name
FROM
    Sales
JOIN
    BookStore ON Sales.book_id = BookStore.book_id
JOIN
    Customers ON Sales.customer_id = Customers.customer_id;

SELECT
    BookStore.genre,
    SUM(Sales.total_price) AS total_revenue
FROM
    Sales
JOIN
    BookStore ON Sales.book_id = BookStore.book_id
GROUP BY
    BookStore.genre;

