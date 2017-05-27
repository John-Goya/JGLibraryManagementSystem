USE LibraryManagementSystem_JG
GO

EXEC dbo.copiesInLibraryBranchByTitle @title='The Lost Tribe', @branchName='Sharpstown'

EXEC noOfCopiesOFTitleInBranch @title='The Lost Tribe'

EXEC borrowersNoBooks

EXEC borrowerInfoDueToday @branchName='Sharpstown', @dueDate='2017-05-27'

EXEC totalBooksFromBranch 

EXEC borrowerGreaterThanFiveBooks

EXEC numberBooksAuthorBranch @branchName='Central', @authorName='King, Stephen'
