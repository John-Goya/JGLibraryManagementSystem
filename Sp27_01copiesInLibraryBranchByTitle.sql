-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE copiesInLibraryBranchByTitle
	-- Add the parameters for the stored procedure here
	@title VARCHAR(50) = NULL, 
	@branchName VARCHAR(50) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

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
	WHERE title LIKE '%' + ISNULL(@title ,title) + '%'
	AND branchName LIKE '%' + ISNULL(@branchName ,@branchName) + '%'
END
GO