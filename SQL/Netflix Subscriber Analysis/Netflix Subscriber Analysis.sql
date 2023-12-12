SELECT * FROM [Netflix Database];

-- Customer Segmentation by Age, Gender, Device, and Region 

SELECT
    Age,
    Gender,
    Device,
    Country, 
    COUNT(*) AS CustomerCount
FROM
    [Netflix Database]
GROUP BY
    Age,
    Gender,
    Device,
    Country
ORDER BY
    Age,
    Gender,
    Device,
    Country;

-- Top 10 Countries with the Highest Number of Users 

WITH RankedCountries AS (
    SELECT
        Country,
        COUNT(*) AS CustomerCount,
        ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS CountryRank
    FROM
        [Netflix Database]
    GROUP BY
        Country
)
SELECT
    Country,
    CustomerCount
FROM
    RankedCountries
WHERE
    CountryRank <= 10;

-- Top 10 Age groups with the Highest Number of Users 

SELECT TOP 10
    Age,
    UserCount
FROM (
    SELECT
        Age,
        COUNT(*) AS UserCount
    FROM
        [Netflix Database]
    GROUP BY
        Age
    ) AS Subquery
ORDER BY
    UserCount DESC;

-- Number of Users by Device  

SELECT 
    Device,
    UserCount
FROM (
    SELECT
        Device,
        COUNT(*) AS UserCount
    FROM
        [Netflix Database]
    GROUP BY
        Device
    ) AS Subquery
ORDER BY
    UserCount DESC;

-- Number of users by gender and their percentages

SELECT
    Gender,
    COUNT(*) AS UserCount,
    (COUNT(*) * 100.0 / SUM(COUNT(*)) OVER ()) AS Percentage
FROM
    [Netflix Database]
GROUP BY
    Gender;

-- Determining Life Time Value (LTV) of Users 

SELECT
    AVG(DATEDIFF(MONTH, Join_Date, Last_Payment_Date)) AS AvgSubscriptionDuration,
    AVG(Monthly_Revenue) AS AvgMonthlyRevenue,
    AVG(DATEDIFF(MONTH, Join_Date, Last_Payment_Date)) * AVG(Monthly_Revenue) AS LifetimeValue
FROM
    [Netflix Database];

-- Number of New Users by Month 

SELECT
    DATEPART(YEAR, Join_Date) AS JoinYear,
    DATEPART(MONTH, Join_Date) AS JoinMonth,
    COUNT(*) AS NewUserCount
FROM
    [Netflix Database]
GROUP BY
    DATEPART(YEAR, Join_Date),
    DATEPART(MONTH, Join_Date)
ORDER BY
    NewUserCount DESC;

-- Type of Subscription and Cost 

WITH UserSubscriptionRevenue AS (
    SELECT
        [Subscription_Type],
        [Monthly_Revenue],
        DATEDIFF(MONTH, Join_Date, Last_Payment_Date) AS SubscriptionDuration,
        [Monthly_Revenue] * DATEDIFF(MONTH, Join_Date, Last_Payment_Date) AS UserTotalRevenue
    FROM
        [Netflix Database] 
)
SELECT
    [Subscription_Type],
    MAX([Monthly_Revenue]) AS SubscriptionCost,
    SUM(UserTotalRevenue) AS TotalRevenueGenerated
FROM
    UserSubscriptionRevenue
GROUP BY
    [Subscription_Type]
ORDER BY
    [Subscription_Type];

-- Types of Subscriptions, Total Revenue by Subscription, and Percentage of Users by Subscription

WITH UserSubscriptionDurations AS (
    SELECT
        User_ID,
        [Subscription_Type],
        DATEDIFF(MONTH, Join_Date, Last_Payment_Date) AS SubscriptionDuration,
        [Monthly_Revenue] AS MonthlyRevenue
    FROM
        [Netflix Database] 
)
SELECT
    usd.[Subscription_Type] AS SubscriptionType,
    COUNT(DISTINCT usd.User_ID) AS UserCount,
    SUM(usd.SubscriptionDuration * usd.MonthlyRevenue) AS TotalRevenue,
    (COUNT(DISTINCT usd.User_ID) * 100.0) / SUM(COUNT(DISTINCT usd.User_ID)) OVER () AS UserPercentage
FROM
    UserSubscriptionDurations AS usd
GROUP BY
    usd.[Subscription_Type]
ORDER BY
    TotalRevenue DESC;

-- Number of Users Based On Different Subscription Lengths

WITH UserSubscriptionDurations AS (
    SELECT
        User_ID,
        DATEDIFF(MONTH, Join_Date, Last_Payment_Date) AS SubscriptionDuration
    FROM
        [Netflix Database] 
)
SELECT
    CASE
        WHEN usd.SubscriptionDuration >= 12 THEN '12 Months Plus'
        WHEN usd.SubscriptionDuration >= 6 THEN '6 Months Plus'
        WHEN usd.SubscriptionDuration >= 3 THEN '3 Months Plus'
        ELSE 'Less Than 3 Months'
    END AS SubscriptionLength,
    COUNT(DISTINCT usd.User_ID) AS UserCount
FROM
    UserSubscriptionDurations AS usd
GROUP BY
    CASE
        WHEN usd.SubscriptionDuration >= 12 THEN '12 Months Plus'
        WHEN usd.SubscriptionDuration >= 6 THEN '6 Months Plus'
        WHEN usd.SubscriptionDuration >= 3 THEN '3 Months Plus'
        ELSE 'Less Than 3 Months'
    END
ORDER BY
    SubscriptionLength;


