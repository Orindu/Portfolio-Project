--Analysing FiFa21 Data Set Using SQL Query
Select * from Fifa21_tbl
--1. How many players in the dataset?
SELECT COUNT(DISTINCT fifa_id) AS TotalNumPayers FROM Fifa21_tbl

--2. How many nationalities do these players belong to?
SELECT COUNT(DISTINCT nationality) AS NationalityCount FROM Fifa21_tbl

--3. What nationality has the highest number of players? What is the top 3?
SELECT TOP 3 nationality, COUNT(*) AS NumOfPlayer FROM Fifa21_tbl
Group by nationality
Order by NumOfPlayer Desc

--4. What is the average wage and standard deviation?
SELECT ROUND(AVG(wage_eur),2) AS AverageWage, ROUND(STDEV(wage_eur),2) AS StandardDevation from Fifa21_tbl

--5. Which players has the highest wage – top 5?
SELECT TOP 5 short_name, CLUB_NAME, wage_eur FROM Fifa21_tbl
ORDER BY wage_eur DESC

--6. Which players has the lowest wage and club is named – bottom 5?
SELECT TOP 5 short_name, CLUB_NAME, wage_eur FROM Fifa21_tbl WHERE club_name IS NOT NULL
ORDER BY wage_eur ASC

--7. Which player(s) has the best overall rating?
SELECT TOP 1 short_name, CLUB_NAME, overall FROM Fifa21_tbl
ORDER BY overall DESC

--8. Which player(s) has the worst overall rating?
SELECT TOP 1 short_name, CLUB_NAME, overall FROM Fifa21_tbl
ORDER BY overall ASC

--9. Which club has the highest overall rating – top 5?
SELECT TOP 1 CLUB_NAME, overall FROM Fifa21_tbl WHERE CLUB_NAME IS NOT NULL
--GROUP BY CLUB_NAME
ORDER BY overall DESC

--10. Which club has the highest average rating – top 5?
SELECT TOP 5 CLUB_NAME, ROUND(AVG(overall),2) AS AvgOverall FROM Fifa21_tbl WHERE CLUB_NAME IS NOT NULL
GROUP BY CLUB_NAME
ORDER BY AvgOverall DESC

--11. What is the Ratio of left preferred_foot of players to   right preferred_foot?

SELECT CAST((SUM(CASE WHEN preferred_foot = 'Left' THEN 1 ELSE 0 END)) AS FLOAT)/COUNT(*) AS LeftFoot_Ratio,
	CAST((SUM(CASE WHEN preferred_foot = 'Right' THEN 1 ELSE 0 END)) AS FLOAT)/COUNT(*) AS RightFoot_Ratio
	FROM Fifa21_tbl

--12. What is the most common jersey number?
SELECT TOP 1 team_jersey_number, COUNT(*) AS JerseyCount from Fifa21_tbl
GROUP BY team_jersey_number
ORDER BY JerseyCount DESC

--13. What is the highest paying jersey number based on total wages?
SELECT TOP 1 team_jersey_number, COUNT(*) AS JerseyCount, SUM(wage_eur) AS TOTAL_WAGE FROM Fifa21_tbl
GROUP BY team_jersey_number
ORDER BY TOTAL_WAGE DESC
