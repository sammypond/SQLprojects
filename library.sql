USE db_library
GO
/* FIRST CREATING THE 5 TABLES WITH PRIMARY KEYS*/

CREATE TABLE tbl_library_branch (
	branchid INT PRIMARY KEY NOT NULL,
	branchname VARCHAR(20) NOT NULL,
	address VARCHAR(20) NOT NULL
);

CREATE TABLE tbl_publisher (
	publishername VARCHAR(50) PRIMARY KEY NOT NULL, 
	address VARCHAR(50) NOT NULL, 
	phone INT NOT NULL,  
);

CREATE TABLE tbl_books (
	bookid INT PRIMARY KEY NOT NULL, 
	title VARCHAR(50) NOT NULL, 
	publishername VARCHAR(50) NOT NULL CONSTRAINT fk_publishername FOREIGN KEY REFERENCES tbl_publisher(publishername) ON UPDATE CASCADE ON DELETE CASCADE,

);

CREATE TABLE tbl_borrower(
	cardno INT NOT NULL,
	borrower_name VARCHAR(50) NOT NULL, 
	borrower_address VARCHAR(50) NOT NULL,
	borrower_phone BIGINT NOT NULL
);

/*BELOW ARE FOREIGN KEY TABLES */
CREATE TABLE tbl_book_authors (
		bookid INT PRIMARY KEY NOT NULL,
		authorname VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_book_loans (
	id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	bookid INT NOT NULL,
	branchid INT NOT NULL,  
	cardno INT NOT NULL, 
	dateout DATE NOT NULL,
	datedue DATE NOT NULL
);

CREATE TABLE tbl_book_copies (
	id INT PRIMARY KEY NOT NULL IDENTITY (1,10),
	bookid INT NOT NULL,
	branchid INT NOT NULL, 
	numberofcopies INT NOT NULL,
);

/*POPULATING MY TABLES*/


INSERT INTO tbl_library_branch 
	(branchid, branchname, address)
	VALUES
	(10, 'Sharpstown', '10 Mercer St'),
	(11, 'Central', '15 Roy Ave'),
	(12, 'Midtown', '20 Denny Way'),
	(13, 'Northend', '25 NE 35th'),
	(14, 'The Hood', '30 Alder St')
;

INSERT INTO tbl_publisher 
	(publishername, tbl_publisher.address, phone)
	VALUES	
	('House', '15 Lane Ave', 1834758968),
	('Penguin', '20 Penny Lane', 2064493610),
	('Indy', '10632 Dixon Dr', 2063722029)
;


INSERT INTO tbl_books
	(bookid, title, publishername)
	VALUES
	(10, 'Ray Charles', 'House'),
	(11, 'Charles Bradley', 'Penguin'),
	(12, 'Carles Barkley', 'Indy'),
	(13, 'War and Peace', 'House'),
	(14, 'It', 'Penguin'),
	(15, 'The Lost Tribe', 'Indy'),
	(16, 'A Modest Proposal', 'House'),
	(17, 'the Qoran', 'Penguin'),
	(18, 'Bible', 'Indy'),
	(19, 'Cookbook', 'House'),
	(20, 'Tin Tin', 'Penguin'),
	(21, 'Red Book', 'Indy'),
	(22, 'Manifesto', 'House'),
	(23, '50 Shades', 'Indy'),
	(24, 'Of Grey', 'Penguin'),
	(25, 'Into the Wild', 'House'),
	(26, 'Rhyse', 'Indy'),
	(27, 'Reseee', 'Penguin'),
	(28, 'Rayrles', 'House'),
	(29, 'Ry Carlos', 'Indy')
;


INSERT INTO tbl_borrower 
	(cardno, borrower_name, borrower_address, borrower_phone)
	VALUES
	(50, 'Steve', '1 Downing St', 1839485769),
	(51, 'Sai', '15 Downing St', 1849485769),
	(52, 'Sven', '18 Downing St', 1839048769),
	(53, 'Sally', '21 Downing St', 1829377699),
	(54, 'Susan', '98 Downing St', 1839848769),
	(55, 'Sirus', '76 Downing St', 1839485769),
	(56, 'Spencer', '96 Downing St', 1333385769),
	(57, 'Sample', '21 Downing St', 1834444769),
	(58, 'Siquoia', '93 Downing St', 2988857609),
	(59, 'Squeeker', '29 Ukjs', 2837465869),
	(60, 'Bleeker', '1 Ugi Nogo', 2843957689)
;
	
INSERT INTO tbl_book_authors 
	(bookid, authorname)
	VALUES
	(10, 'Steven King'),
	(11, 'Marcus Peters'),
	(12, 'Phyllis Kigo'),
	(13, 'Steven Knight'),
	(14, 'Steven King'),
	(15, 'Casper Abelman'),
	(16, 'Steven King'),
	(17, 'Moi Chao'),
	(18, 'Lu Pai'),
	(19, 'Randy Johnson'),
	(20, 'Steg Weider'),
	(21, 'Ijsdu' ),
	(22, 'Stogle Igsby'),
	(23, 'Nico Nico'),
	(24, 'Menti Nog'),
	(25, 'Steving Upo'),
	(26, 'Hik Hoi'),
	(27, 'Ito Mito'),
	(28, 'Ijdog'),
	(29, 'Sam Marritz')
;

INSERT INTO tbl_book_loans 
		(Bookid, branchid, cardno, dateout, datedue)
		VALUES	
		(10, 10, 50, '1988-10-20', '1988-11-20'),
		(11, 11, 50, '1988-10-20', '1988-11-20'),
		(12, 11, 50, '1988-10-20', '1988-11-20'),
		(13, 11, 50, '1988-10-20', '1988-11-20'),
		(14, 12, 50, '1988-10-20', '1988-11-20'),
		(15, 12, 51, '1988-11-20', '1988-12-20'),
		(16, 12, 51, '1988-11-20', '1988-12-20'),
		(17, 12, 51, '1988-11-20', '1988-12-20'),
		(18, 12, 51, '1988-11-20', '1988-12-20'),
		(19, 12, 51, '1988-11-20', '1988-12-20'),
		(20, 13, 52, '1988-10-20', '1988-11-20'),
		(21, 14, 52, '1988-10-20', '1988-11-20'),
		(22, 14, 52, '1988-10-20', '1988-11-20'),
		(23, 13, 52, '1988-10-20', '1988-11-20'),
		(24, 13, 52, '1988-10-20', '1988-11-20'),
		(10, 11, 53, '1988-10-20', '1988-11-20'),
		(10, 11, 53, '1988-10-20', '1988-11-20'),
		(10, 11, 53, '1988-10-20', '1988-11-20'),
		(10, 11, 53, '1988-10-20', '1988-11-20'),
		(10, 11, 53, '1988-10-20', '1988-11-20'),
		(10, 11, 50, '1988-10-20', '1988-11-20'),
		(11, 11, 50, '1988-10-20', '1988-11-20'),
		(12, 11, 50, '1988-10-20', '1988-11-20'),
		(13, 11, 50, '1988-10-20', '1988-11-20'),
		(14, 12, 50, '1988-10-20', '1988-11-20'),
		(15, 12, 54, '1988-11-20', '1988-12-20'),
		(16, 12, 55, '1988-11-20', '1988-12-20'),
		(17, 12, 56, '1988-11-20', '1988-12-20'),
		(18, 12, 53, '1988-11-20', '1988-12-20'),
		(19, 12, 51, '1988-11-20', '1988-12-20'),
		(20, 13, 50, '1988-10-20', '1988-11-20'),
		(21, 14, 56, '1988-10-20', '1988-11-20'),
		(22, 14, 55, '1988-10-20', '1988-11-20'),
		(23, 13, 57, '1988-10-20', '1988-11-20'),
		(24, 13, 51, '1988-10-20', '1988-11-20'),
		(19, 11, 59, '1988-10-20', '1988-11-20'),
		(18, 11, 54, '1988-10-20', '1988-11-20'),
		(11, 11, 53, '1988-10-20', '1988-11-20'),
		(22, 11, 52, '1988-10-20', '1988-11-20'),
		(27, 11, 57, '1988-10-20', '1988-11-20'),
		(20, 13, 52, '1988-10-20', '1988-11-20'),
		(29, 14, 57, '1988-10-20', '1988-11-20'),
		(27, 14, 59, '1988-10-20', '1988-11-20'),
		(27, 13, 54, '1988-10-20', '1988-11-20'),
		(25, 13, 51, '1988-10-20', '1988-11-20'),
		(14, 11, 50, '1988-10-20', '1988-11-20'),
		(13, 11, 53, '1988-10-20', '1988-11-20'),
		(12, 11, 53, '1988-10-20', '1988-11-20'),
		(11, 11, 59, '1988-10-20', '1988-11-20'),
		(20, 11, 53, '1988-10-20', '1988-11-20')
	;

INSERT INTO tbl_book_copies 
	(bookid, branchid, numberofcopies)
	VALUES 
	(10, 10, 5),
	(11, 10, 5),
	(12, 10, 5),
	(13, 10, 5),
	(14, 10, 5),
	(15, 10, 5),
	(16, 10, 5),
	(17, 10, 5),
	(18, 10, 5),
	(19, 10, 5),
	(20, 10, 5),
	(21, 10, 5),
	(22, 10, 5),
	(23, 10, 5),
	(24, 10, 5),
	(25, 10, 5),
	(26, 10, 5),
	(27, 10, 5),
	(28, 10, 5),
	(29, 10, 5),

	/* ----------------------------------new branch*/
	
	(10, 11, 5),
	(11, 11, 5),
	(12, 11, 5),
	(13, 11, 5),
	(14, 11, 5),
	(15, 11, 5),
	(16, 11, 5),
	(17, 11, 5),
	(18, 11, 5),
	(19, 11, 5),
	(20, 11, 5),
	(21, 11, 5),
	(22, 11, 5),
	(23, 11, 5),
	(24, 11, 5),
	(25, 11, 5),
	(26, 11, 5),
	(27, 11, 5),
	(28, 11, 5),
	(29, 11, 5),
	/* ----------------------------------new branch*/
	(10, 12, 5),
	(11, 12, 5),
	(12, 12, 5),
	(13, 12, 5),
	(14, 12, 5),
	(15, 12, 5),
	(16, 12, 5),
	(17, 12, 5),
	(18, 12, 5),
	(19, 12, 5),
	(20, 12, 5),
	(21, 12, 5),
	(22, 12, 5),
	(23, 12, 5),
	(24, 12, 5),
	(25, 12, 5),
	(26, 12, 5),
	(27, 12, 5),
	(28, 12, 5),
	(29, 12, 5),
	/* ----------------------------------new branch*/
	(10, 13, 5),
	(11, 13, 5),
	(12, 13, 5),
	(13, 13, 5),
	(14, 13, 5),
	(15, 13, 5),
	(16, 13, 5),
	(17, 13, 5),
	(18, 13, 5),
	(19, 13, 5),
	(20, 13, 5),
	(21, 13, 5),
	(22, 13, 5),
	(23, 13, 5),
	(24, 13, 5),
	(25, 13, 5),
	(26, 13, 5),
	(27, 13, 5),
	(28, 13, 5),
	(29, 13, 5),
	/* ----------------------------------new branch*/
	(10, 14, 5),
	(11, 14, 5),
	(12, 14, 5),
	(13, 14, 5),
	(14, 14, 5),
	(15, 14, 5),
	(16, 14, 5),
	(17, 14, 5),
	(18, 14, 5),
	(19, 14, 5),
	(20, 14, 5),
	(21, 14, 5),
	(22, 14, 5),
	(23, 14, 5),
	(24, 14, 5),
	(25, 14, 5),
	(26, 14, 5),
	(27, 14, 5),
	(28, 14, 5),
	(29, 14, 5)
;
	/*---END TABLES---*/

	SELECT * FROM tbl_library_branch
	SELECT * FROM tbl_publisher
	SELECT * FROM tbl_books
	SELECT * FROM tbl_borrower
	SELECT * FROM tbl_book_authors
	SELECT * FROM tbl_book_loans
	SELECT * FROM tbl_book_copies
	/*1*/
	SELECT tbl_books.bookid, tbl_book_copies.branchid, branchname, numberofcopies, title FROM tbl_books
	INNER JOIN tbl_book_copies on tbl_books.bookid = tbl_book_copies.bookid
	INNER JOIN tbl_library_branch ON tbl_book_copies.branchid = tbl_library_branch.branchid
	WHERE title = 'The Lost Tribe' AND branchname = 'Sharpstown'
	;
	/*2*/
	SELECT tbl_books.bookid, tbl_book_copies.branchid, branchname, numberofcopies, title FROM tbl_books
	INNER JOIN tbl_book_copies on tbl_books.bookid = tbl_book_copies.bookid
	INNER JOIN tbl_library_branch ON tbl_book_copies.branchid = tbl_library_branch.branchid
	WHERE title = 'The Lost Tribe'
	;
	/* 3 */
	SELECT * FROM tbl_borrower
	WHERE NOT EXISTS 
		(SELECT * 
		FROM tbl_book_loans
		WHERE tbl_book_loans.cardno = tbl_borrower.cardno)
	;
	/* 4 */ 
	/*todays date = 11/20/1988*/
	SELECT title, borrower_address, borrower_name, branchname, datedue FROM tbl_book_loans
	INNER JOIN tbl_borrower ON tbl_book_loans.cardno = tbl_borrower.cardno
	INNER join tbl_books ON tbl_books.bookid = tbl_book_loans.bookid
	INNER JOIN tbl_library_branch ON tbl_book_loans.branchid = tbl_library_branch.branchid
	WHERE branchname = 'Sharpstown' AND datedue = '1988-11-20'
	;
	/* 5 */
	/*This displays the amount of books each branch has loaned out */
	SELECT branchname, tbl_book_loans.bookid, dateout, datedue, COUNT(tbl_book_loans.branchid) AS loans_out FROM tbl_library_branch
	INNER JOIN tbl_book_loans ON tbl_library_branch.branchid = tbl_book_loans.branchid
	GROUP BY tbl_library_branch.branchname, tbl_book_loans.bookid, tbl_book_loans.dateout, tbl_book_loans.datedue
	;

	/* 6 */
	SELECT borrower_name, borrower_address, COUNT(tbl_book_loans.cardno) AS loans_out FROM tbl_borrower 
	INNER JOIN tbl_book_loans ON tbl_borrower.cardno = tbl_book_loans.cardno
	GROUP BY borrower_name, borrower_address HAVING COUNT(*) > 5
	;
	/* 7 */ 
	SELECT authorname, title, branchname, numberofcopies FROM tbl_book_authors
	INNER JOIN tbl_books ON tbl_book_authors.bookid = tbl_books.bookid
	INNER JOIN tbl_book_copies ON tbl_books.bookid = tbl_book_copies.bookid
	INNER JOIN tbl_library_branch ON tbl_book_copies.branchid = tbl_library_branch.branchid
	WHERE authorname = 'Steven King' and branchname = 'Central'
	;