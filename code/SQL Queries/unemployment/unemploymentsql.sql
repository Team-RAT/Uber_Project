/* create a table of unemployment rate data for UK cities*/

USE [uber_project]
GO

CREATE SCHEMA unemployment  -- create a schema for unemployment related tables
GO

CREATE TABLE unemployment.Rates_perc
Go

SELECT 
	   [UALAD]
	   -- give aliases to simplify titles as all columns (other than UALAD) are unemployment rate (%)
      ,[Jan 11 to Dec 11 Rate (%)] AS [2011]
      ,[Jan 2012 to Dec 2012 Rate (%)] AS [2012]
      ,[Jan 2013 to Dec 2013 Rate (%)] AS [2013]
      ,[Jan 2014 to Dec 2014 Rate (%)] AS [2014]
      ,[Jan 2015 to Dec 2015 Rate (%)] AS [2015]
      ,[Jan 2016 to Dec 2016  Rate (%)] AS [2016]
INTO unemployment.Rates_perc
FROM [dbo].[UnemploymentData]
GO
