-- KPI: DAU по дням
SELECT date(ts) AS day, COUNT(DISTINCT user_id) AS dau
FROM events GROUP BY day ORDER BY day;

-- Воронка: home → pricing → buy
SELECT
  SUM(CASE WHEN page='home'    THEN 1 ELSE 0 END) AS step1,
  SUM(CASE WHEN page='pricing' THEN 1 ELSE 0 END) AS step2,
  SUM(CASE WHEN page='buy'     THEN 1 ELSE 0 END) AS step3
FROM events;

-- Активность по тарифам
SELECT u.plan, COUNT(DISTINCT e.user_id) AS active
FROM events e JOIN users u ON e.user_id=u.id
GROUP BY u.plan;

-- Топ страниц
SELECT page, COUNT(*) FROM events GROUP BY page ORDER BY 2 DESC;
