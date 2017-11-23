USE [uber_project]
GO

UPDATE [unemployment].[Rates_perc]
SET [UALAD] =
	CASE WHEN [UALAD] = 'Aberdeen City' THEN 'Aberdeen'
		 WHEN [UALAD] = 'Blackburn with Darwen' THEN 'Blackburn'
		 WHEN [UALAD] = 'Dundee City' THEN 'Dundee'
		 WHEN [UALAD] = 'Kingston upon Hull, City of' THEN 'Hull'
	ELSE [UALAD]
	END
