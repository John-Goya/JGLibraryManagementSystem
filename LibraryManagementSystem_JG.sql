USE LibraryManagementSystem_JG
GO

/*
SELECT * FROM tbl_publisher
SELECT * FROM tbl_book
SELECT * FROM tbl_book_author
SELECT * FROM tbl_book_loans
ORDER BY branchID
SELECT * FROM tbl_book_copies
ORDER BY bookID

SELECT * FROM tbl_library_branch
SELECT * FROM tbl_borrower
ORDER BY cardNo
SELECT * FROM tbl_book_loans
ORDER BY cardNo
*/



CREATE TABLE tbl_publisher (
	publisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	publisherAddress VARCHAR(50) NOT NULL,
	publisherPhone VARCHAR(20)
);


INSERT INTO tbl_publisher (publisherName, publisherAddress, publisherPhone)
VALUES	('Pearson', '3075 Ray Rd #200', '888-977-7900'),
		('Penguin Random House', '1745 Broadway', '212-782-9000'),
		('HarperCollins', '53 Glenmaura National Blvd #300', '212-207-7000'),
		('Simon & Schuster', '1230 6th Ave', '212-698-7000');


CREATE TABLE tbl_book (
	bookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	title  VARCHAR(50) NOT NULL,
	publisherName VARCHAR(50) NOT NULL
);


INSERT INTO tbl_book (title, publisherName)
VALUES  ('The Lost Tribe','Pearson'),
		('Jane Eyre','Penguin Random House'),
		('Catcher in the Rye','HarperCollins'),
		('The Shining','Simon & Schuster'),
		('The Great Gatsby','Pearson'),
		('Moby Dick','Penguin Random House'),
		('Pride and Prejudce','HarperCollins'),
		('Adventures of Huckleberry Finn','Simon & Schuster'),
		('To Kill a Mockingbird','Pearson'),
		('Nineteen Eighty-Four','Penguin Random House'),
		('Wuthering Heights','HarperCollins'),
		('A Christmas Carol','Simon & Schuster'),
		('A Tale of Two Cites','Pearson'),
		('Lord of the Files','Penguin Random House'),
		('Dracula','HarperCollins'),
		('Little Women','Simon & Schuster'),
		('The Scarlet Letter','Pearson'),
		('Odyssey','Penguin Random House'),
		('Anna Karenina','HarperCollins'),
		('Brave New World','Simon & Schuster');


CREATE TABLE tbl_book_author (
	bookID INT NOT NULL,
	authorName VARCHAR(50) NOT NULL
);

INSERT INTO tbl_book_author (bookID, authorName)
VALUES  ('1','Lee, Mark'),
		('2','Bronte, Charlotte'),
		('3','Salinger, JD'),
		('4','King, Stephen'),
		('5','Fitzgerald, F. Scott'),
		('6','Melville, Herman'),
		('7','Austen, Jane'),
		('8','Twain, Mark'),
		('9','Lee, Harper'),
		('10','Orwell, George'),
		('11','Bronte, Emily'),
		('12','Dickens, Charles'),
		('13','Dickens, Charles'),
		('14','Golding, William'),
		('15','Stoker, Bram'),
		('16','Alcott, Louisa May'),
		('17','Hawthorne, Nathaniel'),
		('18','Homer'),
		('19','Tolstoy, Leo'),
		('20','Huxley, Aldous');


CREATE TABLE tbl_book_loans (
	bookID INT NOT NULL,
	branchID INT NOT NULL,
	cardNo INT NOT NULL,
	dateOut DATE NOT NULL,
	dueDate DATE NOT NULL
);

/*
UPDATE tbl_book_loans
SET dueDate = '2017-05-27'
WHERE bookID = 8 AND cardNo = 1

SELECT * FROM tbl_book_loans
ORDER BY branchID
*/

INSERT INTO tbl_book_loans(bookID, branchID, cardNo, dateOut, dueDate)
VALUES  ('10','2','1','2017-05-01','2017-05-31'), ('9','1','1','2017-05-01','2017-05-26'),('8','1','1','2017-05-01','2017-05-27'), ('7','2','1','2017-05-01','2017-05-31'),('6','2','1','2017-05-01','2017-05-31'),
		('5','1','1','2017-05-01','2017-05-31'), ('4','1','1','2017-05-01','2017-05-31'),('3','2','1','2017-05-01','2017-05-31'),  ('2','2','1','2017-05-01','2017-05-31'),
		('3','3','2','2017-05-01','2017-05-31'),  ('4','4','2','2017-05-01','2017-05-31'), ('5','4','2','2017-05-01','2017-05-31'),('6','3','2','2017-05-01','2017-05-31'),
		('7','2','3','2017-05-01','2017-05-31'),  ('8','1','3','2017-05-01','2017-05-31'), ('9','1','3','2017-05-01','2017-05-31'),('10','2','3','2017-05-01','2017-05-31'),
		('11','3','4','2017-05-01','2017-05-31'), ('12','4','4','2017-05-01','2017-05-31'),('13','4','4','2017-05-01','2017-05-31'),('14','3','4','2017-05-01','2017-05-31'),
		('15','3','5','2017-05-01','2017-05-31'), ('16','1','5','2017-05-01','2017-05-31'),('17','1','5','2017-05-01','2017-05-31'),('18','3','5','2017-05-01','2017-05-31'),
		('19','2','6','2017-05-01','2017-05-31'), ('20','4','6','2017-05-01','2017-05-31'),('1','4','6','2017-05-01','2017-05-31'),('2','2','5','2017-05-01','2017-05-31'),
		('5','1','7','2017-05-01','2017-05-31'),  ('4','1','7','2017-05-01','2017-05-31'),('3','3','7','2017-05-01','2017-05-31'),('2','3','7','2017-05-01','2017-05-31'),('1','1','7','2017-05-01','2017-05-31'),
		('20','1','7','2017-05-01','2017-05-31'),  ('19','3','7','2017-05-01','2017-05-31'),('18','3','7','2017-05-01','2017-05-31'),('17','1','7','2017-05-01','2017-05-31'),
		('3','2','8','2017-05-01','2017-05-31'),  ('4','1','8','2017-05-01','2017-05-31'),('5','1','8','2017-05-01','2017-05-31'),('6','2','8','2017-05-01','2017-05-31'),
		('7','3','9','2017-05-01','2017-05-31'),  ('8','4','9','2017-05-01','2017-05-31'),('9','4','9','2017-05-01','2017-05-31'),('10','3','9','2017-05-01','2017-05-31'),
		('11','3','10','2017-05-01','2017-05-31'),('12','1','10','2017-05-01','2017-05-31'),('13','1','10','2017-05-01','2017-05-31'),('14','3','10','2017-05-01','2017-05-31');


CREATE TABLE tbl_book_copies (
	bookID INT NOT NULL,
	branchID INT NOT NULL,
	no_Of_Copies INT NOT NULL
);

INSERT INTO tbl_book_copies (bookID, branchID, no_Of_Copies)
VALUES	('1','1','6'),  ('2','2','5'),  ('3','3','3'),  ('4','4','4'),
		('5','1','3'),  ('6','2','4'),  ('7','3','4'),  ('8','4','5'),
		('9','1','4'),  ('10','2','3'), ('11','3','5'), ('12','4','6'),
		('13','1','5'), ('14','2','6'), ('15','3','6'), ('16','4','3'),
		('17','1','6'), ('18','2','3'), ('19','3','4'), ('20','4','5'),
		('20','1','3'), ('19','2','4'), ('18','3','5'), ('17','4','6'),
		('16','1','4'), ('15','2','5'), ('14','3','6'), ('13','4','3'),
		('12','1','5'), ('11','2','6'), ('10','3','3'), ('9','4','4'),
		('8','1','4'),  ('7','2','3'),  ('6','3','4'),  ('5','4','5'),
		('4','1','3'),  ('3','2','4'),  ('2','3','5'),  ('1','4','6');


CREATE TABLE tbl_library_branch (
	branchID  INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	branchName VARCHAR(50) NOT NULL,
	address VARCHAR(50) NOT NULL
);

INSERT INTO tbl_library_branch(branchName, address)
VALUES  ('Sharpstown','226 Sunset Ave.'),
		('Central','123 Main St.'),
		('South Shore','51 Mill Pond Dr.'),
		('Mission','10 Fairground Ln.');


CREATE TABLE tbl_borrower (
	cardNo INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	borrowerName VARCHAR(50) NOT NULL,
	borrowerAddress VARCHAR(50) NOT NULL,
	borrowerPhone VARCHAR(20) NOT NULL
);

INSERT INTO tbl_borrower(borrowerName, borrowerAddress, borrowerPhone)
VALUES  ('Francis Albanesi','85 Logan Drive ','(122) 201-4742'),
		('Napier Paquet','568 6th Street ','(451) 687-5904'),
		('Lillia Mills','174 Brown Road ','(316) 797-4160'),
		('Willis Garey','962 Silver Spear Drive ','(426) 321-1786'),
		('Lindsey Harper','697 Bridle Drive ','(389) 163-4745'),
		('Alphonzo Augustine','8430 University St.','(120) 416-0886'),
		('Amos Rider','2 Hartford St.','(459) 551-3837'),
		('Hazel Elwyn','13 Tarkiln Hill St. ','(879) 829-6198'),
		('Laelia Johnson','71 Pilgrim Avenue',' (125) 546-4478'),
		('Anish Rennold','514 S. Magnolia St.','(226) 906-2721'),
		('Christine J. Santos','4 Goldfield Rd.','(251) 546-9442'),
		('Sonja M. Steed','70 Bowman St.','(251) 446-8851');

--1.
SELECT DISTINCT tbl_book_copies.no_Of_Copies
				,tbl_book.title
				,tbl_library_branch.branchName
	FROM tbl_book
		INNER JOIN tbl_publisher 
			ON tbl_publisher.publisherName=tbl_book.publisherName
		INNER JOIN tbl_book_author
			ON tbl_book.bookID=tbl_book_author.bookID
		INNER JOIN tbl_book_loans
			ON tbl_book_author.bookID=tbl_book_loans.bookID
		INNER JOIN tbl_book_copies
			ON tbl_book_loans.bookID=tbl_book_copies.bookID
		INNER JOIN tbl_library_branch
			ON tbl_book_loans.[branchID]=tbl_library_branch.[branchID]
		INNER JOIN tbl_borrower 
			ON tbl_book_loans.cardNo=tbl_borrower.cardNo
	WHERE tbl_book.title='The Lost Tribe' AND tbl_library_branch.branchName='Sharpstown';

--2.
SELECT DISTINCT tbl_book_copies.no_Of_Copies
				,tbl_book.title
				,tbl_library_branch.branchName
	FROM tbl_book
		INNER JOIN tbl_publisher 
			ON tbl_publisher.publisherName=tbl_book.publisherName
		INNER JOIN tbl_book_author
			ON tbl_book.bookID=tbl_book_author.bookID
		INNER JOIN tbl_book_loans
			ON tbl_book_author.bookID=tbl_book_loans.bookID
		INNER JOIN tbl_book_copies
			ON tbl_book_loans.bookID=tbl_book_copies.bookID
		INNER JOIN tbl_library_branch
			ON tbl_book_loans.[branchID]=tbl_library_branch.[branchID]
		INNER JOIN tbl_borrower 
			ON tbl_book_loans.cardNo=tbl_borrower.cardNo
	WHERE tbl_book.title='The Lost Tribe';

--3.
SELECT *
	FROM tbl_borrower
		LEFT JOIN tbl_book_loans ON tbl_borrower.cardNo=tbl_book_loans.cardNo
	WHERE tbl_book_loans.cardNo IS NULL;

--4.
SELECT DISTINCT book.title
				,b.borrowerName
				,b.borrowerAddress
				,bl.dueDate
				,lb.branchName
	FROM tbl_book_loans AS bl
		JOIN tbl_borrower AS b ON bl.cardNo=b.cardNo
		JOIN tbl_library_branch AS lb ON bl.branchID=lb.branchID
		JOIN tbl_book AS book ON bl.bookID=book.bookID
	WHERE lb.branchName='Sharpstown' AND bl.dueDate=CAST(GETDATE() AS DATE);

--5.
SELECT lb.branchName
		, COUNT(bl.branchID) AS "Number of copies"
	FROM tbl_library_branch AS lb
		INNER JOIN tbl_book_loans AS bl ON lb.branchID=bl.branchID
	GROUP BY lb.branchName;

--6.
SELECT b.borrowerName
		,b.borrowerAddress
		,bl.cardNo
		,COUNT(*) AS "books checked out"
	FROM tbl_book_loans AS bl
		INNER JOIN tbl_borrower AS b ON bl.cardNo=b.cardNo
	GROUP BY b.borrowerName, b.borrowerAddress, bl.cardNo HAVING COUNT(*)>5

--7.
SELECT DISTINCT b.title
		, COUNT(bc.no_Of_Copies) AS "Number of copies"
	FROM tbl_book AS b
		INNER JOIN tbl_publisher AS p
			ON p.publisherName=b.publisherName
		INNER JOIN tbl_book_author AS ba
			ON b.bookID=ba.bookID
		INNER JOIN tbl_book_loans AS bl
			ON ba.bookID=bl.bookID
		INNER JOIN tbl_book_copies AS bc
			ON bl.bookID=bc.bookID
		INNER JOIN tbl_library_branch AS lb
			ON bl.[branchID]=bl.[branchID]
	WHERE lb.branchName='Central' AND ba.authorName='King, Stephen'
	GROUP BY b.title;









--1.
CREATE PROCEDURE 


SELECT DISTINCT tbl_book_copies.no_Of_Copies, tbl_book.title, tbl_library_branch.branchName
FROM
	tbl_book
	INNER JOIN tbl_publisher 
		ON tbl_publisher.publisherName=tbl_book.publisherName
	INNER JOIN tbl_book_author
		ON tbl_book.bookID=tbl_book_author.bookID
	INNER JOIN tbl_book_loans
		ON tbl_book_author.bookID=tbl_book_loans.bookID
	INNER JOIN tbl_book_copies
		ON tbl_book_loans.bookID=tbl_book_copies.bookID
	INNER JOIN tbl_library_branch
		ON tbl_book_loans.[branchID]=tbl_library_branch.[branchID]
	INNER JOIN tbl_borrower 
		ON tbl_book_loans.cardNo=tbl_borrower.cardNo
WHERE tbl_book.title='The Lost Tribe' AND tbl_library_branch.branchName='Sharpstown';

/*
			,tbl_book_author
			,tbl_publisher
			,tbl_book_loans
			,tbl_book_copies
			,tbl_borrower
			,tbl_library_branch
*/

--2.
SELECT DISTINCT tbl_book_copies.no_Of_Copies, tbl_book.title, tbl_library_branch.branchName

FROM
	tbl_book
	INNER JOIN tbl_publisher 
		ON tbl_publisher.publisherName=tbl_book.publisherName
	INNER JOIN tbl_book_author
		ON tbl_book.bookID=tbl_book_author.bookID
	INNER JOIN tbl_book_loans
		ON tbl_book_author.bookID=tbl_book_loans.bookID
	INNER JOIN tbl_book_copies
		ON tbl_book_loans.bookID=tbl_book_copies.bookID
	INNER JOIN tbl_library_branch
		ON tbl_book_loans.[branchID]=tbl_library_branch.[branchID]
	INNER JOIN tbl_borrower 
		ON tbl_book_loans.cardNo=tbl_borrower.cardNo

WHERE tbl_book.title='The Lost Tribe'


--3.
SELECT *
FROM tbl_borrower
LEFT JOIN tbl_book_loans ON tbl_borrower.cardNo=tbl_book_loans.cardNo
WHERE tbl_book_loans.cardNo IS NULL
/*
SELECT tbl_book.title, tbl_borrower.borrowerName, tbl_borrower.borrowerAddress
FROM
	tbl_borrower
INNER JOIN tbl_borrower
		ON tbl_book_loans.cardNo=tbl_borrower.cardNo
	WHERE tbl_book_loans.cardNo=(10);

SELECT *
FROM tbl_borrower
LEFT JOIN tbl_book_loans ON tbl_borrower.cardNo=tbl_book_loans.cardNo
WHERE tbl_book_loans.cardNo IS NULL
*/

--4.
SELECT DISTINCT book.title, borrow.borrowerName, borrowerAddress, loan.dueDate, branch.branchName
FROM tbl_book_loans AS loan
JOIN tbl_borrower AS borrow ON loan.cardNo=borrow.cardNo
JOIN tbl_library_branch AS branch ON loan.branchID=branch.branchID
JOIN tbl_book AS book ON loan.bookID=book.bookID
WHERE branch.branchName='Sharpstown' AND loan.dueDate=CAST(GETDATE() AS DATE)


/*
SELECT CAST(GETDATE() AS DATE)
CAST (CURRENT_TIMESTAMP AS DATE)
SELECT CAST(GETDATE() AS DATE), 
WHERE TIMESTAMP >= CURDATE() CAST(GETDATE() AS DATE)=(CURRENT_TIMESTAMP AS DATE)

WHERE tbl_book_loans.dueDate=GETDATE()
*/


--5
/*
SELECT COUNT(copies.no_of_Copies)
UNION

SELECT branch.branchID, copies.no_Of_Copies count(*) 
	FROM branch
		JOIN tbl_book_loans AS loans ON branch.branchID=loans.branchID
		JOIN tbl_book_copies AS copies ON branch.branchID=copies.branchID
	GROUP BY copies.no_Of_Copies;
*/

SELECT COUNT(bc.no_Of_Copies), b.branchName
FROM tbl_library_branch AS b
JOIN tbl_book_loans AS bl ON b.branchID=bl.branchID
JOIN tbl_book_copies AS bc ON b.branchID=bc.branchID
ORDER BY b.branchName


SELECT COUNT(lb.branchID)
	FROM tbl_library_branch AS lb
		JOIN tbl_book_loans AS bl ON lb.branchID=bl.branchID
		JOIN tbl_book_copies AS bc ON lb.branchID=bc.branchID
			WHERE lb.branchID = '1'

SELECT * FROM tbl_book_loans



--6.
/*
SELECT b.borrowerName
		,b.borrowerAddress
		,bl.cardNo
		,COUNT(*) AS "books checked out"
	FROM tbl_book_loans AS bl
		JOIN tbl_borrower AS b ON bl.cardNo=b.cardNo
	WHERE bl.cardNo>5
	GROUP BY bl.cardNo, b.borrowerName, b.borrowerAddress
*/

SELECT b.borrowerName
		,b.borrowerAddress
		,bl.cardNo
		,COUNT(*) AS "books checked out"
FROM tbl_book_loans AS bl
		INNER JOIN tbl_borrower AS b ON bl.cardNo=b.cardNo
	GROUP BY b.borrowerName, b.borrowerAddress, bl.cardNo HAVING COUNT(*)>5


/*
SELECT b.borrowerName
		,b.borrowerAddress
		,bl.cardNo
		,COUNT(*) AS "books checked out"
	FROM tbl_book_loans AS bl
		JOIN tbl_borrower AS b ON bl.cardNo=b.cardNo
	WHERE bl.cardNo>5
	GROUP BY bl.cardNo, b.borrowerName, b.borrowerAddress



SELECT COUNT(bl.cardNo)
	FROM tbl_book_loans AS bl
		JOIN tbl_borrower AS b ON b.cardNo=bl.cardNo
	WHERE bl.cardNo;

SELECT CarName, COUNT(CarName) AS CarCount FROM tbl GROUP BY CarName



SELECT b.borrowerName
		,b.borrowerAddress
		,COUNT(*) as "books checked out"
	FROM tbl_book_loans AS bl
		JOIN tbl_borrower AS b ON bl.cardNo=b.cardNo
	WHERE bl.cardNo>=5;
	GROUP BY bl.cardNo



SELECT b.borrowerName
		,b.borrowerAddress
		,bl.cardNo
		,COUNT(*) AS "books checked out"
	FROM tbl_book_loans AS bl
		JOIN tbl_borrower AS b ON bl.cardNo=b.cardNo
	WHERE bl.cardNo>5
	GROUP BY bl.cardNo, b.borrowerName, b.borrowerAddress
	



SELECT  F.FamilyID,
        COUNT(*) NumberOfChildren
FROM Family F
LEFT JOIN FamilyChild FC
    ON F.FamilyID = FC.FamilyID
GROUP BY F.FamilyID








SELECT COUNT
JOIN tbl_borrower
		ON tbl_book_loans.cardNo=tbl_borrower.cardNo
	INNER JOIN tbl_book_author
		ON tbl_book.bookID=tbl_book_author.bookID
	INNER JOIN tbl_book_loans
		ON tbl_book_author.bookID=tbl_book_loans.bookID
	INNER JOIN tbl_book_copies
		ON tbl_book_loans.bookID=tbl_book_copies.bookID
	INNER JOIN tbl_library_branch
		ON tbl_book_loans.[branchID]=tbl_library_branch.[branchID]
	INNER JOIN tbl_borrower 
		ON tbl_book_loans.cardNo=tbl_borrower.cardNo

7.
SELECT DISTINCT b.title
				,bc.no_Of_Copies
	FROM tbl_book AS b
		INNER JOIN tbl_publisher AS p
			ON p.publisherName=b.publisherName
		INNER JOIN tbl_book_author AS ba
			ON b.bookID=ba.bookID
		INNER JOIN tbl_book_loans AS bl
			ON ba.bookID=bl.bookID
		INNER JOIN tbl_book_copies AS bc
			ON bl.bookID=bc.bookID
		INNER JOIN tbl_library_branch AS lb
			ON bl.[branchID]=bl.[branchID]
	WHERE lb.branchName='Central' AND ba.authorName = 'S'LIKE '%king%';
*/
	SELECT * book
		FROM tbl_book AS b
		INNER JOIN tbl_publisher AS p
			ON p.publisherName=b.publisherName
		INNER JOIN tbl_book_author AS ba
			ON b.bookID=ba.bookID
		INNER JOIN tbl_book_loans AS bl
			ON ba.bookID=bl.bookID
		INNER JOIN tbl_book_copies AS bc
			ON bl.bookID=bc.bookID
		INNER JOIN tbl_library_branch AS lb
			ON bl.[branchID]=bl.[branchID]
	WHERE lb.branchName='Central' AND ba.authorName='King, Stephen'