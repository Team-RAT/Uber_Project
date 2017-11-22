USE [uber_project]
GO

SELECT 
	   [UALAD]
      ,[Code]
      ,[Jan 11 to Dec 11 Rate (%)] AS [2011 Rate (%)]
      ,[Jan 11 to Dec 11  + - (%)2] AS [2011 +/- (%)]
      ,[Jan 2012 to Dec 2012 Rate (%)] AS [2012 Rate (%)]
      ,[Jan 2012 to Dec 2012 + - (%)2] AS [2012 +/- (%)]
      ,[Jan 2013 to Dec 2013 Rate (%)] AS [2013 Rate (%)]
      ,[Jan 2013 to Dec 2013 + - (%)2] AS [2013 +/- (%)]
      ,[Jan 2014 to Dec 2014 Rate (%)] AS [2014 Rate (%)]
      ,[Jan 2014 to Dec 2014 + - (%)2] AS [2014 +/- (%)]
      ,[Jan 2015 to Dec 2015 Rate (%)] AS [2015 Rate (%)]
      ,[Jan 2015 to Dec 2015 + - (%)2] AS [2015 +/- (%)]
      ,[Jan 2016 to Dec 2016  Rate (%)] AS [2016 Rate (%)]
      ,[Jan 2016 to Dec 2016  + - (%)2] AS [2016 +/- (%)]
FROM [dbo].[UnemploymentData]
GO

