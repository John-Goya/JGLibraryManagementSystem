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
CREATE PROCEDURE borrowerInfoDueToday 
	-- Add the parameters for the stored procedure here
	@branchName VARCHAR(50)=NULL,
	@dueDate date=NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT DISTINCT book.title
				,b.borrowerName
				,b.borrowerAddress
				,bl.dueDate
				,lb.branchName
	FROM tbl_book_loans AS bl
		JOIN tbl_borrower AS b ON bl.cardNo=b.cardNo
		JOIN tbl_library_branch AS lb ON bl.branchID=lb.branchID
		JOIN tbl_book AS book ON bl.bookID=book.bookID
	WHERE @branchName LIKE '%' + ISNULL(@branchName ,@branchName) + '%' AND dueDate = ISNULL(@duedate, dueDate)
END
GO