CREATE DATABASE librarymanagement;

-- Create books table
CREATE TABLE books(
	bookId INT NOT NULL PRIMARY KEY,
    bookName VARCHAR(25),
    bookAuthor VARCHAR(20),
    quantity INT
);

INSERT INTO books (bookId, bookName, bookAuthor, quantity) VALUES 
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 5),
(2, 'To Kill a Mockingbird', 'Harper Lee', 3),
(3, '1984', 'George Orwell', 4),
(4, 'Pride and Prejudice', 'Jane Austen', 2),
(5, 'The Catcher in the Rye', 'J.D. Salinger', 6),
(6, 'The Lord of the Rings', 'J.R.R. Tolkien', 2),
(7, 'The Hobbit', 'J.R.R. Tolkien', 3),
(8, 'Fahrenheit 451', 'Ray Bradbury', 4),
(9, 'Brave New World', 'Aldous Huxley', 5);

-- create borrowers table
CREATE TABLE borrowers(
	borrowerId INT NOT NULL PRIMARY KEY,
    borrowerName VARCHAR(25),
    departmentId INT,
    borrowerPhoneNo INT,
    borrowerEmail VARCHAR(20),
    FOREIGN KEY (departmentId) REFERENCES departments(departmentId)
);

INSERT INTO borrowers (borrowerId, borrowerName, departmentId, borrowerPhoneNo, borrowerEmail) VALUES 
(1, 'John Doe', 2, 0734567890, 'Jd@gmail.com'),
(2, 'Jane Smith', 1, 0745678901, 'Jsmith@yahoo.com'),
(3, 'Alice Johnson', 4, 0156789012, 'AjN22@gmail.com'),
(4, 'Bob Brown', 3, 0767890123, 'Bobby2487@gmail.com'),
(5, 'Charlie Davis', 5, 0178901234, 'cdcomm21@gmail.com'),
(6, 'Diana Prince', 3, 0789012345, 'dpdpp45@gmail.com'),
(7, 'Ethan Hunt', 1, 0190123456, 'ethunt@gmail.com'),
(8, 'Felicity Smoak', 2, 0746382043, 'farrow11@gmail.com'),
(9, 'George Washington', 4, 0743345678, 'ggws@yahoo.com'),
(10, 'Hannah Montana', 4, 0134567890, 'hm22@gmail.com');

-- create loaned books table
CREATE TABLE loaned_books(
	loanId INT NOT NULL PRIMARY KEY,
    borrowerID INT,
    bookID INT,
    loanDate DATE,
    dueDate DATE,
    returnDate DATE,
    penaltyFees DECIMAL(10,2),
    FOREIGN KEY (borrowerID) REFERENCES borrowers(borrowerId),
    FOREIGN KEY (bookID) REFERENCES books(bookId)
);

INSERT INTO loaned_books (loanId, borrowerID, bookID, loanDate, dueDate, returnDate, penaltyFees) VALUES 
(1, 1, 2, '2025-01-01', '2025-01-15', '2025-01-10', 0.00),
(2, 2, 3, '2025-02-01', '2025-02-15', '2025-02-08', 0.00),
(3, 3, 4, '2025-03-01', '2025-03-15', '2025-03-20', 150.00),
(4, 4, 5, '2025-04-01', '2025-04-15', NULL, 0.00),
(5, 5, 6, '2025-05-01', '2025-05-15', NULL, 0.00);


-- create departments table
CREATE TABLE departments(
	departmentId INT NOT NULL PRIMARY KEY,
    departmentName VARCHAR(20),
    departmentPhoneNo INT
);

INSERT INTO departments (departmentId, departmentName, departmentPhoneNo) VALUES 
(1, 'Arts', 0775392045),
(2, 'Mathematics', 0138473840),
(3, 'Science', 0746289494),
(4, 'History', 0749204838),
(5, 'Technology', 0147829485);