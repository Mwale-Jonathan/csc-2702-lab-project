-- CREATE Operations (Insert Data)
-- Insert Category
INSERT INTO "Category" (name) VALUES 
('Fiction'),
('Non-Fiction'),
('Science'),
('Technology');

-- Insert Publisher
INSERT INTO "Publisher" (name, city, country) VALUES 
('Penguin Books', 'London', 'UK'),
('O''Reilly Media', 'Sebastopol', 'USA'),
('Pearson', 'London', 'UK');

-- Insert Author
INSERT INTO "Author" (first_name, middle_number, last_name, bio) VALUES 
('Robert', 'C', 'Martin', 'Robert C. Martin is a software engineer and author.'),
('Stephen', NULL, 'King', 'Stephen King is an American author of horror, suspense, and fantasy.'),
('J.K.', NULL, 'Rowling', 'British author best known for the Harry Potter series.');

-- Insert Book
INSERT INTO "Book" (publisher_id, category_id, isbn, title, publication_date, 
                   location, cover, total_copies, available_copies, 
                   date_created, last_edited) VALUES 
(1, 1, '9780132350884', 'Clean Code', '2008-08-01', 'Floor 2, Shelf A1', 
 'clean-code.jpg', 5, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert BookAuthor relationship
INSERT INTO "BookAuthor" (book_id, author_id) VALUES (1, 1);

-- Insert User
INSERT INTO "User" (first_name, last_name, middle_name, phone, email, 
                   image, password, is_active, is_staff, is_superuser,
                   date_joined, last_login) VALUES 
('John', 'Doe', NULL, '1234567890', 'john.doe@email.com', 
 'profile.jpg', 'hashedpassword', TRUE, FALSE, FALSE,
 CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- READ Operations (Select Data)
-- Get all books with their authors and categories
SELECT b.title, b.isbn, a.first_name, a.last_name, c.name as category, 
       b.available_copies
FROM "Book" b
JOIN "BookAuthor" ba ON b.id = ba.book_id
JOIN "Author" a ON ba.author_id = a.id
JOIN "Category" c ON b.category_id = c.id;

-- Get user loan history
SELECT u.first_name, u.last_name, b.title, l.checkout_date, l.due_date, 
       l.checkin_date
FROM "Loan" l
JOIN "User" u ON l.user_id = u.id
JOIN "Copy" c ON l.copy_id = c.id
JOIN "Book" b ON c.book_id = b.id;

-- Get overdue books and associated fines
SELECT u.first_name, u.last_name, b.title, f.amount, f.status
FROM "Fine" f
JOIN "User" u ON f.user_id = u.id
JOIN "Loan" l ON f.loan_id = l.id
JOIN "Copy" c ON l.copy_id = c.id
JOIN "Book" b ON c.book_id = b.id
WHERE f.status = 'UNPAID';

-- UPDATE Operations
-- Update book availability
UPDATE "Book"
SET available_copies = available_copies - 1
WHERE id = 1 AND available_copies > 0;

-- Update user information
UPDATE "User"
SET phone = '9876543210',
    last_login = CURRENT_TIMESTAMP
WHERE email = 'john.doe@email.com';

-- Update loan status (check-in a book)
UPDATE "Loan"
SET checkin_date = CURRENT_DATE
WHERE id = 1 AND checkin_date IS NULL;

-- DELETE Operations
-- Delete a book (ensure no active loans/copies exist)
DELETE FROM "BookAuthor" WHERE book_id = 1;
DELETE FROM "Book" WHERE id = 1;

-- Delete a user (ensure no active loans/fines exist)
DELETE FROM "User" WHERE id = 1;

-- Sample Data Population
-- More Categories
INSERT INTO "Category" (name) VALUES 
('History'),
('Philosophy'),
('Computer Science'),
('Mathematics');

-- More Publishers
INSERT INTO "Publisher" (name, city, country) VALUES 
('Addison-Wesley', 'Boston', 'USA'),
('Manning Publications', 'Shelter Island', 'USA'),
('Wiley', 'Hoboken', 'USA');

-- More Authors
INSERT INTO "Author" (first_name, middle_number, last_name, bio) VALUES 
('Martin', NULL, 'Fowler', 'Author of books on software development.'),
('Eric', NULL, 'Evans', 'Creator of Domain-Driven Design.'),
('Kent', NULL, 'Beck', 'Creator of Extreme Programming and Test-Driven Development.');

-- More Books
INSERT INTO "Book" (publisher_id, category_id, isbn, title, publication_date, 
                   location, cover, total_copies, available_copies, 
                   date_created, last_edited) VALUES 
(2, 6, '9780321125217', 'Domain-Driven Design', '2003-08-30', 
 'Floor 1, Shelf B2', 'ddd.jpg', 3, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 6, '9780201616224', 'Test-Driven Development', '2002-11-18', 
 'Floor 1, Shelf B3', 'tdd.jpg', 4, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
