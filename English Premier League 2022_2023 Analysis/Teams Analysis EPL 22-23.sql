-- Total SCA for Teams

SELECT Team, SUM(SCA) AS TotalSCA
FROM [TEAM STATS 2022_2023]
GROUP BY Team
ORDER BY TotalSCA DESC;

-- Total GCA for Teams 

SELECT Team, SUM(GCA) AS TotalGCA
FROM [TEAM STATS 2022_2023]
GROUP BY Team
ORDER BY TotalGCA DESC;

-- Total SCA P90 for Teams 

SELECT Team, SUM(SCA90) AS TotalSCA_P90
FROM [TEAM STATS 2022_2023]
GROUP BY Team
ORDER BY TotalSCA_P90 DESC;

-- Total GCA P90 for Teams

SELECT Team, SUM(GCA90) AS TotalGCA_P90
FROM [TEAM STATS 2022_2023]
GROUP BY Team
ORDER BY TotalGCA_P90 DESC;

-- Percentage of SCA Contribution from Dead Ball situations for Top 5 Teams

WITH TopSCATeams AS (
	SELECT Team, SUM(SCA) AS TotalSCA
	FROM [TEAM STATS 2022_2023]
	GROUP BY Team
	ORDER BY TotalSCA DESC
	OFFSET 0 ROWS FETCH FIRST 5 ROWS ONLY
)

SELECT tg.Team, SUM(pp.PassDead) AS PassDeadSCA,
	CASE 
		WHEN TotalSCA = 0 THEN 0 
		ELSE (SUM(pp.PassDead) * 100.0/TotalSCA)
	END AS PassDeadContribution
FROM [TEAM STATS 2022_2023] pp
JOIN TopSCATeams tg ON pp.Team = tg.Team
GROUP BY tg.Team, TotalSCA
ORDER BY TotalSCA DESC;

-- Percentage of SCA Contribution from Live Ball situations for Top 5 Teams

WITH TopSCATeams AS (
	SELECT Team, SUM(SCA) AS TotalSCA
	FROM [TEAM STATS 2022_2023]
	GROUP BY Team
	ORDER BY TotalSCA DESC
	OFFSET 0 ROWS FETCH FIRST 5 ROWS ONLY
)

SELECT tg.Team, SUM(pp.PassLive) AS PassLiveSCA,
	CASE 
		WHEN TotalSCA = 0 THEN 0 
		ELSE (SUM(pp.PassLive) * 100.0/TotalSCA)
	END AS PassLiveContribution
FROM [TEAM STATS 2022_2023] pp
JOIN TopSCATeams tg ON pp.Team = tg.Team
GROUP BY tg.Team, TotalSCA
ORDER BY TotalSCA DESC;

-- Percentage of SCA Contribution from Take On situations for Top 5 Teams 

WITH TopSCATeams AS (
	SELECT Team, SUM(SCA) AS TotalSCA
	FROM [TEAM STATS 2022_2023]
	GROUP BY Team
	ORDER BY TotalSCA DESC
	OFFSET 0 ROWS FETCH FIRST 5 ROWS ONLY
)

SELECT tg.Team, SUM(pp.[TO]) AS TOSCA,
	CASE 
		WHEN TotalSCA = 0 THEN 0 
		ELSE (SUM(pp.[TO]) * 100.0/TotalSCA)
	END AS TOContribution
FROM [TEAM STATS 2022_2023] pp
JOIN TopSCATeams tg ON pp.Team = tg.Team
GROUP BY tg.Team, TotalSCA
ORDER BY TotalSCA DESC;

-- Percentage of SCA Contribution from Shots Taken for Top 5 Teams 

WITH TopSCATeams AS (
	SELECT Team, SUM(SCA) AS TotalSCA
	FROM [TEAM STATS 2022_2023]
	GROUP BY Team
	ORDER BY TotalSCA DESC
	OFFSET 0 ROWS FETCH FIRST 5 ROWS ONLY
)

SELECT tg.Team, SUM(pp.Sh) AS ShSCA,
	CASE 
		WHEN TotalSCA = 0 THEN 0 
		ELSE (SUM(pp.Sh) * 100.0/TotalSCA)
	END AS ShContribution
FROM [TEAM STATS 2022_2023] pp
JOIN TopSCATeams tg ON pp.Team = tg.Team
GROUP BY tg.Team, TotalSCA
ORDER BY TotalSCA DESC;

-- Percentage of SCA Contribution from Fouls Drawn for Top 5 Teams 

WITH TopSCATeams AS (
	SELECT Team, SUM(SCA) AS TotalSCA
	FROM [TEAM STATS 2022_2023]
	GROUP BY Team
	ORDER BY TotalSCA DESC
	OFFSET 0 ROWS FETCH FIRST 5 ROWS ONLY
)

SELECT tg.Team, SUM(pp.Fld) AS FldSCA,
	CASE 
		WHEN TotalSCA = 0 THEN 0 
		ELSE (SUM(pp.Fld) * 100.0/TotalSCA)
	END AS FldContribution
FROM [TEAM STATS 2022_2023] pp
JOIN TopSCATeams tg ON pp.Team = tg.Team
GROUP BY tg.Team, TotalSCA
ORDER BY TotalSCA DESC;

-- Percentage of SCA Contribution from Defensive Actions for Top 5 Teams  

WITH TopSCATeams AS (
	SELECT Team, SUM(SCA) AS TotalSCA
	FROM [TEAM STATS 2022_2023]
	GROUP BY Team
	ORDER BY TotalSCA DESC
	OFFSET 0 ROWS FETCH FIRST 5 ROWS ONLY
)

SELECT tg.Team, SUM(pp.Def) AS DefSCA,
	CASE 
		WHEN TotalSCA = 0 THEN 0 
		ELSE (SUM(pp.Def) * 100.0/TotalSCA)
	END AS DefContribution
FROM [TEAM STATS 2022_2023] pp
JOIN TopSCATeams tg ON pp.Team = tg.Team
GROUP BY tg.Team, TotalSCA
ORDER BY TotalSCA DESC;

-- Percentage of GCA Contribution from Dead Ball situations for Top 5 Teams 

WITH TopGCATeams AS (
	SELECT Team, SUM(GCA) AS TotalGCA
	FROM [TEAM STATS 2022_2023]
	GROUP BY Team
	ORDER BY TotalGCA DESC
	OFFSET 0 ROWS FETCH FIRST 5 ROWS ONLY
)

SELECT tg.Team, SUM(pp.PassDead2) AS PassDeadGCA,
	CASE 
		WHEN TotalGCA = 0 THEN 0 
		ELSE (SUM(pp.PassDead2) * 100.0/TotalGCA)
	END AS PassDeadContribution
FROM [TEAM STATS 2022_2023] pp
JOIN TopGCATeams tg ON pp.Team = tg.Team
GROUP BY tg.Team, TotalGCA
ORDER BY TotalGCA DESC;

-- Percentage of GCA Contribution from Live Ball situations for Top 5 Teams 

WITH TopGCATeams AS (
	SELECT Team, SUM(GCA) AS TotalGCA
	FROM [TEAM STATS 2022_2023]
	GROUP BY Team
	ORDER BY TotalGCA DESC
	OFFSET 0 ROWS FETCH FIRST 5 ROWS ONLY
)

SELECT tg.Team, SUM(pp.PassLive2) AS PassLiveGCA,
	CASE 
		WHEN TotalGCA = 0 THEN 0 
		ELSE (SUM(pp.PassLive2) * 100.0/TotalGCA)
	END AS PassLiveContribution
FROM [TEAM STATS 2022_2023] pp
JOIN TopGCATeams tg ON pp.Team = tg.Team
GROUP BY tg.Team, TotalGCA
ORDER BY TotalGCA DESC;

-- Percentage of GCA Contribution from Take On situations for Top 5 Teams 

WITH TopGCATeams AS (
	SELECT Team, SUM(GCA) AS TotalGCA
	FROM [TEAM STATS 2022_2023]
	GROUP BY Team
	ORDER BY TotalGCA DESC
	OFFSET 0 ROWS FETCH FIRST 5 ROWS ONLY
)

SELECT tg.Team, SUM(pp.TO2) AS TOGCA,
	CASE 
		WHEN TotalGCA = 0 THEN 0 
		ELSE (SUM(pp.TO2) * 100.0/TotalGCA)
	END AS TOContribution
FROM [TEAM STATS 2022_2023] pp
JOIN TopGCATeams tg ON pp.Team = tg.Team
GROUP BY tg.Team, TotalGCA
ORDER BY TotalGCA DESC;

-- Percentage of GCA Contribution from Shots Taken for Top 5 Teams 

WITH TopGCATeams AS (
	SELECT Team, SUM(GCA) AS TotalGCA
	FROM [TEAM STATS 2022_2023]
	GROUP BY Team
	ORDER BY TotalGCA DESC
	OFFSET 0 ROWS FETCH FIRST 5 ROWS ONLY
)

SELECT tg.Team, SUM(pp.Sh2) AS ShGCA,
	CASE 
		WHEN TotalGCA = 0 THEN 0 
		ELSE (SUM(pp.Sh2) * 100.0/TotalGCA)
	END AS ShContribution
FROM [TEAM STATS 2022_2023] pp
JOIN TopGCATeams tg ON pp.Team = tg.Team
GROUP BY tg.Team, TotalGCA
ORDER BY TotalGCA DESC;

-- Percentage of GCA Contribution from Fouls Drawn for Top 5 Teams 

WITH TopGCATeams AS (
	SELECT Team, SUM(GCA) AS TotalGCA
	FROM [TEAM STATS 2022_2023]
	GROUP BY Team
	ORDER BY TotalGCA DESC
	OFFSET 0 ROWS FETCH FIRST 5 ROWS ONLY
)

SELECT tg.Team, SUM(pp.Fld2) AS FldGCA,
	CASE 
		WHEN TotalGCA = 0 THEN 0 
		ELSE (SUM(pp.Fld2) * 100.0/TotalGCA)
	END AS FldContribution
FROM [TEAM STATS 2022_2023] pp
JOIN TopGCATeams tg ON pp.Team = tg.Team
GROUP BY tg.Team, TotalGCA
ORDER BY TotalGCA DESC;

-- Percentage of GCA Contribution from Defensive Actions for Top 5 Teams 

WITH TopGCATeams AS (
	SELECT Team, SUM(GCA) AS TotalGCA
	FROM [TEAM STATS 2022_2023]
	GROUP BY Team
	ORDER BY TotalGCA DESC
	OFFSET 0 ROWS FETCH FIRST 5 ROWS ONLY
)

SELECT tg.Team, SUM(pp.Def2) AS DefGCA,
	CASE 
		WHEN TotalGCA = 0 THEN 0 
		ELSE (SUM(pp.Def2) * 100.0/TotalGCA)
	END AS DefContribution
FROM [TEAM STATS 2022_2023] pp
JOIN TopGCATeams tg ON pp.Team = tg.Team
GROUP BY tg.Team, TotalGCA
ORDER BY TotalGCA DESC;