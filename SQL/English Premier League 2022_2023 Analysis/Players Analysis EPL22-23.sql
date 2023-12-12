-- Total SCA for Players 

SELECT Player, SUM(SCA) AS TotalSCA
FROM [EPL ANLYS]
GROUP BY Player
ORDER BY TotalSCA DESC;

-- Total SCA P90 for Players 

SELECT Player, SUM(SCA90) AS TotalSCA_P90
FROM [EPL ANLYS]
WHERE "_90s" > 10 
GROUP BY Player
ORDER BY TotalSCA_P90 DESC;

-- Total GCA for Players 

SELECT Player, SUM(GCA) AS TotalGCA
FROM [EPL ANLYS]
GROUP BY Player
ORDER BY TotalGCA DESC;

-- Total GCA P90 for Players (More than 10 games played)

SELECT Player, SUM(GCA90) AS TotalGCA_P90
FROM [EPL ANLYS]
WHERE "_90s" > 10 
GROUP BY Player
ORDER BY TotalGCA_P90 DESC;

-- Percentage of SCA Contribution from Dead Ball situations for Top 10 Players (Excluding Goalkeepers & Players with less than 10 games) 

WITH TopSCAPlayers AS (
    SELECT Player, SUM(SCA) AS TotalSCA
    FROM [EPL ANLYS]
    WHERE Pos <> 'GK'  
    AND _90s > 10  
    GROUP BY Player
    HAVING SUM(SCA) > 0 
    ORDER BY TotalSCA DESC  
    OFFSET 0 ROWS FETCH FIRST 10 ROWS ONLY  
)

SELECT tg.Player, SUM(pp.PassDead) AS PassDeadSCA,
    CASE 
        WHEN TotalSCA = 0 THEN 0
        ELSE (SUM(pp.PassDead) * 100.0 / TotalSCA)
    END AS PassDeadContribution
FROM [EPL ANLYS] pp
JOIN TopSCAPlayers tg ON pp.Player = tg.Player
GROUP BY tg.Player, TotalSCA
ORDER BY TotalSCA DESC;  

-- Percentage of SCA Contribution from Live Ball situations for Top 10 Players (Excluding Goalkeepers & Players with less than 10 games) 

WITH TopSCAPlayers AS (
    SELECT Player, SUM(SCA) AS TotalSCA
    FROM [EPL ANLYS]
    WHERE Pos <> 'GK'  
    AND _90s > 10  
    GROUP BY Player
    HAVING SUM(SCA) > 0 
    ORDER BY TotalSCA DESC  
    OFFSET 0 ROWS FETCH FIRST 10 ROWS ONLY  
)

SELECT tg.Player, SUM(pp.PassLive) AS PassLiveSCA,
    CASE 
        WHEN TotalSCA = 0 THEN 0
        ELSE (SUM(pp.PassLive) * 100.0 / TotalSCA)
    END AS PassLiveContribution
FROM [EPL ANLYS] pp
JOIN TopSCAPlayers tg ON pp.Player = tg.Player
GROUP BY tg.Player, TotalSCA
ORDER BY TotalSCA DESC;  

-- Percentage of SCA Contribution from Take On situations for Top 10 Players (Excluding Goalkeepers & Players with less than 10 games) 

WITH TopSCAPlayers AS (
    SELECT Player, SUM(SCA) AS TotalSCA
    FROM [EPL ANLYS]
    WHERE Pos <> 'GK'  
    AND _90s > 10  
    GROUP BY Player
    HAVING SUM(SCA) > 0 
    ORDER BY TotalSCA DESC  
    OFFSET 0 ROWS FETCH FIRST 10 ROWS ONLY  
)

SELECT tg.Player, SUM(pp.[TO]) AS TOSCA,
    CASE 
        WHEN TotalSCA = 0 THEN 0
        ELSE (SUM(pp.[TO]) * 100.0 / TotalSCA)
    END AS TOContribution
FROM [EPL ANLYS] pp
JOIN TopSCAPlayers tg ON pp.Player = tg.Player
GROUP BY tg.Player, TotalSCA
ORDER BY TotalSCA DESC;  

-- Percentage of SCA Contribution from Fouls Drawn for Top 10 Players (Excluding Goalkeepers & Players with less than 10 games) 

WITH TopSCAPlayers AS (
    SELECT Player, SUM(SCA) AS TotalSCA
    FROM [EPL ANLYS]
    WHERE Pos <> 'GK'  
    AND _90s > 10  
    GROUP BY Player
    HAVING SUM(SCA) > 0 
    ORDER BY TotalSCA DESC  
    OFFSET 0 ROWS FETCH FIRST 10 ROWS ONLY  
)

SELECT tg.Player, SUM(pp.Fld) AS FldSCA,
    CASE 
        WHEN TotalSCA = 0 THEN 0
        ELSE (SUM(pp.Fld) * 100.0 / TotalSCA)
    END AS FldContribution
FROM [EPL ANLYS] pp
JOIN TopSCAPlayers tg ON pp.Player = tg.Player
GROUP BY tg.Player, TotalSCA
ORDER BY TotalSCA DESC;  

-- Percentage of SCA Contribution from Shots Taken for Top 10 Players (Excluding Goalkeepers & Players with less than 10 games)

WITH TopSCAPlayers AS (
    SELECT Player, SUM(SCA) AS TotalSCA
    FROM [EPL ANLYS]
    WHERE Pos <> 'GK'  
    AND _90s > 10  
    GROUP BY Player
    HAVING SUM(SCA) > 0 
    ORDER BY TotalSCA DESC  
    OFFSET 0 ROWS FETCH FIRST 10 ROWS ONLY  
)

SELECT tg.Player, SUM(pp.Sh) AS ShSCA,
    CASE 
        WHEN TotalSCA = 0 THEN 0
        ELSE (SUM(pp.Sh) * 100.0 / TotalSCA)
    END AS ShContribution
FROM [EPL ANLYS] pp
JOIN TopSCAPlayers tg ON pp.Player = tg.Player
GROUP BY tg.Player, TotalSCA
ORDER BY TotalSCA DESC;  

-- Percentage of SCA Contribution from Defensive Actions for Top 10 Players (Excluding Goalkeepers & Players with less than 10 games)

WITH TopSCAPlayers AS (
    SELECT Player, SUM(SCA) AS TotalSCA
    FROM [EPL ANLYS]
    WHERE Pos <> 'GK'  
    AND _90s > 10  
    GROUP BY Player
    HAVING SUM(SCA) > 0 
    ORDER BY TotalSCA DESC  
    OFFSET 0 ROWS FETCH FIRST 10 ROWS ONLY  
)

SELECT tg.Player, SUM(pp.Def) AS DefSCA,
    CASE 
        WHEN TotalSCA = 0 THEN 0
        ELSE (SUM(pp.Def) * 100.0 / TotalSCA)
    END AS ShContribution
FROM [EPL ANLYS] pp
JOIN TopSCAPlayers tg ON pp.Player = tg.Player
GROUP BY tg.Player, TotalSCA
ORDER BY TotalSCA DESC;  


-- Percentage of GCA Contribution from Defensive Actions for Top 10 Players (Excluding Goalkeepers & Players with less than 10 games)

WITH TopGCAPlayers AS (
    SELECT Player, SUM(GCA) AS TotalGCA
    FROM [EPL ANLYS]
    WHERE Pos <> 'GK'  
    AND _90s > 10  
    GROUP BY Player
    HAVING SUM(GCA) > 0 
    ORDER BY TotalGCA DESC  
    OFFSET 0 ROWS FETCH FIRST 10 ROWS ONLY  
)

SELECT tg.Player, SUM(pp.Def2) AS Def2GCA,
    CASE 
        WHEN TotalGCA = 0 THEN 0
        ELSE (SUM(pp.Def2) * 100.0 / TotalGCA)
    END AS ShContribution
FROM [EPL ANLYS] pp
JOIN TopGCAPlayers tg ON pp.Player = tg.Player
GROUP BY tg.Player, TotalGCA
ORDER BY TotalGCA DESC; 

-- Percentage of GCA Contribution from Shots Taken for Top 10 Players (Excluding Goalkeepers & Players with less than 10 games)

WITH TopGCAPlayers AS (
    SELECT Player, SUM(GCA) AS TotalGCA
    FROM [EPL ANLYS]
    WHERE Pos <> 'GK'  
    AND _90s > 10  
    GROUP BY Player
    HAVING SUM(GCA) > 0 
    ORDER BY TotalGCA DESC  
    OFFSET 0 ROWS FETCH FIRST 10 ROWS ONLY  
)

SELECT tg.Player, SUM(pp.Sh2) AS Sh2GCA,
    CASE 
        WHEN TotalGCA = 0 THEN 0
        ELSE (SUM(pp.to2) * 100.0 / TotalGCA)
    END AS ShContribution
FROM [EPL ANLYS] pp
JOIN TopGCAPlayers tg ON pp.Player = tg.Player
GROUP BY tg.Player, TotalGCA
ORDER BY TotalGCA DESC; 

-- Percentage of GCA Contribution from Take On situations for Top 10 Players (Excluding Goalkeepers & Players with less than 10 games)

WITH TopGCAPlayers AS (
    SELECT Player, SUM(GCA) AS TotalGCA
    FROM [EPL ANLYS]
    WHERE Pos <> 'GK'  
    AND _90s > 10  
    GROUP BY Player
    HAVING SUM(GCA) > 0 
    ORDER BY TotalGCA DESC  
    OFFSET 0 ROWS FETCH FIRST 10 ROWS ONLY  
)

SELECT tg.Player, SUM(pp.TO2) AS TO2GCA,
    CASE 
        WHEN TotalGCA = 0 THEN 0
        ELSE (SUM(pp.TO2) * 100.0 / TotalGCA)
    END AS TOContribution
FROM [EPL ANLYS] pp
JOIN TopGCAPlayers tg ON pp.Player = tg.Player
GROUP BY tg.Player, TotalGCA
ORDER BY TotalGCA DESC; 

-- Percentage of GCA Contribution from Fouls Drawn for Top 10 Players (Excluding Goalkeepers & Players with less than 10 games)

WITH TopGCAPlayers AS (
    SELECT Player, SUM(GCA) AS TotalGCA
    FROM [EPL ANLYS]
    WHERE Pos <> 'GK'  
    AND _90s > 10  
    GROUP BY Player
    HAVING SUM(GCA) > 0 
    ORDER BY TotalGCA DESC  
    OFFSET 0 ROWS FETCH FIRST 10 ROWS ONLY  
)

SELECT tg.Player, SUM(pp.Fld2) AS Fld2GCA,
    CASE 
        WHEN TotalGCA = 0 THEN 0
        ELSE (SUM(pp.Fld2) * 100.0 / TotalGCA)
    END AS FldContribution
FROM [EPL ANLYS] pp
JOIN TopGCAPlayers tg ON pp.Player = tg.Player
GROUP BY tg.Player, TotalGCA
ORDER BY TotalGCA DESC; 

-- Percentage of GCA Contribution from Live Ball Situations for Top 10 Players (Excluding Goalkeepers & Players with less than 10 games)

WITH TopGCAPlayers AS (
    SELECT Player, SUM(GCA) AS TotalGCA
    FROM [EPL ANLYS]
    WHERE Pos <> 'GK'  
    AND _90s > 10  
    GROUP BY Player
    HAVING SUM(GCA) > 0 
    ORDER BY TotalGCA DESC  
    OFFSET 0 ROWS FETCH FIRST 10 ROWS ONLY  
)

SELECT tg.Player, SUM(pp.PassLive2) AS PassLive2GCA,
    CASE 
        WHEN TotalGCA = 0 THEN 0
        ELSE (SUM(pp.PassLive2) * 100.0 / TotalGCA)
    END AS PassLiveContribution
FROM [EPL ANLYS] pp
JOIN TopGCAPlayers tg ON pp.Player = tg.Player
GROUP BY tg.Player, TotalGCA
ORDER BY TotalGCA DESC; 


-- Percentage of GCA Contribution from Dead Ball Situations for Top 10 Players (Excluding Goalkeepers & Players with less than 10 games)

WITH TopGCAPlayers AS (
    SELECT Player, SUM(GCA) AS TotalGCA
    FROM [EPL ANLYS]
    WHERE Pos <> 'GK'  
    AND _90s > 10  
    GROUP BY Player
    HAVING SUM(GCA) > 0 
    ORDER BY TotalGCA DESC  
    OFFSET 0 ROWS FETCH FIRST 10 ROWS ONLY  
)

SELECT tg.Player, SUM(pp.PassDead2) AS PassDead2GCA,
    CASE 
        WHEN TotalGCA = 0 THEN 0
        ELSE (SUM(pp.PassDead2) * 100.0 / TotalGCA)
    END AS PassDeadContribution
FROM [EPL ANLYS] pp
JOIN TopGCAPlayers tg ON pp.Player = tg.Player
GROUP BY tg.Player, TotalGCA
ORDER BY TotalGCA DESC;
