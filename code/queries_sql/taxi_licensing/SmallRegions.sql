USE [uber_project]
GO

CREATE TABLE licensing.SmallRegions
GO

SELECT
	   t3.[LA code]
      ,REPLACE(t3.[Column 3], ' 2', '') AS [Licensing Authority Mid Region]
      ,REPLACE(t3.[Wheelchair accessible taxis 4], ',', '') AS [Wheelchair accessible taxis 2013]
      ,REPLACE(t3.["Other  taxis 4"], ',', '') AS [Other  taxis 2013]
      ,REPLACE(t3.["Total  taxis"], ',', '') AS [Total  taxis 2013]
      ,REPLACE(t3.[Taxi only licensed drivers], ',', '') AS [Taxi only licensed drivers 2013]
      ,REPLACE(t3.[Wheelchair accessible PHVs 5], ',', '') AS [Wheelchair accessible PHVs 2013]
      ,REPLACE(t3.["Operator  licences  issued"], ',', '') AS [Operator  licences  issued 2013]
      ,REPLACE(t3.[PHV only Licenced Drivers], ',', '') AS [PHV only Licenced Drivers 2013]
      ,REPLACE(t3.[Dual taxi PHV driver licences], ',', '') AS [Dual taxi PHV driver licences 2013]
      ,REPLACE(t3.["Total  driver  licences  issued"], ',', '') AS [Total  driver  licences  issued 2013]
      ,REPLACE(t3.[Total licensed vehicles], ',', '') AS [Total licensed vehicles 2013]
	  ,REPLACE(t5.[Wheelchair accessible taxis], ',', '') AS [Wheelchair accessible taxis 2015]
      ,REPLACE(t5.[Other  taxis], ',', '') AS [Other  taxis 2015]
      ,REPLACE(t5.[Total  taxis], ',', '') AS [Total  taxis 2015]
      ,REPLACE(t5.[Taxi only licensed drivers], ',', '') AS [Taxi only licensed drivers 2015]
      ,REPLACE(t5.[Wheelchair accessible PHVs], ',', '') AS [Wheelchair accessible PHVs 2015]
      ,REPLACE(t5.[Operator  licences  issued], ',', '') AS [Operator  licences  issued 2015]
      ,REPLACE(t5.[PHV only Licenced Drivers], ',', '') AS [PHV only Licenced Drivers 2015]
      ,REPLACE(t5.[Dual taxi PHV driver licences], ',', '') AS [Dual taxi PHV driver licences 2015]
      ,REPLACE(t5.[Total  driver  licences  issued], ',', '') AS [Total  driver  licences  issued 2015]
      ,REPLACE(t5.[Total licensed vehicles], ',', '') AS [Total licensed vehicles 2015]
	  ,REPLACE(t7.[Wheelchair accessible taxis], ',', '') AS [Wheelchair accessible taxis 2017]
      ,REPLACE(t7.[Other  taxis], ',', '') AS [Other  taxis 2017]
      ,REPLACE(t7.[Total  taxis], ',', '') AS [Total  taxis 2017]
      ,REPLACE(t7.[Taxi only licensed drivers], ',', '') AS [Taxi only licensed drivers 2017]
      ,REPLACE(t7.[Wheelchair accessible PHVs], ',', '') AS [Wheelchair accessible PHVs 2017]
      ,REPLACE(t7.[Operator  licences  issued], ',', '') AS [Operator  licences  issued 2017]
      ,REPLACE(t7.[PHV only Licenced Drivers], ',', '') AS [PHV only Licenced Drivers 2017]
      ,REPLACE(t7.[Dual taxi PHV driver licences], ',', '') AS [Dual taxi PHV driver licences 2017]
      ,REPLACE(t7.[Total  driver  licences  issued], ',', '') AS [Total  driver  licences  issued 2017]
      ,REPLACE(t7.[Total licensed vehicles], ',', '') AS [Total licensed vehicles 2017]
INTO licensing.SmallRegions
FROM [dbo].[taxi2013] t3
INNER JOIN [dbo].[taxi2015] t5
	ON t3.[LA code] = t5.[LA code]
INNER JOIN [dbo].[taxi2017] t7
	ON t7.[LA code] = t5.[LA code]
WHERE t3.[Column 3] != ''