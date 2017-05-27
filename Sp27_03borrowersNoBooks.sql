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
-- Author:		
-- Create date: 
-- Description:	
---- =============================================
CREATE PROCEDURE borrowersNoBooks 
	-- Add the parameters for the stored procedure here
	@cardNo INT=NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT *
	FROM tbl_borrower
		LEFT JOIN tbl_book_loans ON tbl_borrower.cardNo=tbl_book_loans.cardNo
	WHERE tbl_book_loans.cardNo IS NULL;
END
GO