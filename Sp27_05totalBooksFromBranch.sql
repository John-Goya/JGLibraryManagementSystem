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
CREATE PROCEDURE totalBooksFromBranch 
	-- Add the parameters for the stored procedure here
	@branchID int = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT lb.branchName
		, COUNT(bl.branchID) AS "Number of copies"
	FROM tbl_library_branch AS lb
		INNER JOIN tbl_book_loans AS bl ON lb.branchID=bl.branchID
	GROUP BY lb.branchName;
END
GO
