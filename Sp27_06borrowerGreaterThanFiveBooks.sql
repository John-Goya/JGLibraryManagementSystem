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
CREATE PROCEDURE borrowerGreaterThanFiveBooks 
	-- Add the parameters for the stored procedure here
	@cardNo int = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT b.borrowerName
		,b.borrowerAddress
		,bl.cardNo
		,COUNT(*) AS "books checked out"
	FROM tbl_book_loans AS bl
		INNER JOIN tbl_borrower AS b ON bl.cardNo=b.cardNo
	GROUP BY b.borrowerName, b.borrowerAddress, bl.cardNo HAVING COUNT(*)>5
END
GO
