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
CREATE PROCEDURE numberBooksAuthorBranch 
	-- Add the parameters for the stored procedure here
	@branchName VARCHAR(50)=NULL, 
	@authorName VARCHAR(50)=NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

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
	WHERE branchName LIKE '%' + ISNULL(@branchName ,branchName) + '%' AND
	authorName=@authorName
	GROUP BY b.title;
END
GO
