-- 1. Event Performance: Tickets sold and unique attendees per event
SELECT 
    e.event_name,
    SUM(ts.quantity) AS total_tickets_sold,
    COUNT(DISTINCT ts.attendee_id) AS unique_attendees
FROM TicketSales ts
JOIN Events e ON ts.event_id = e.event_id
GROUP BY e.event_name
ORDER BY total_tickets_sold DESC;

-- 2. Capacity Alerts: Events exceeding 90% of capacity
SELECT 
    event_name, 
    capacity, 
    SUM(quantity) AS tickets_sold
FROM Events e
JOIN TicketSales ts ON e.event_id = ts.event_id
GROUP BY e.event_id
HAVING tickets_sold > capacity * 0.9;

-- 3. RFM Analysis: Attendee Recency, Frequency, and Ticket Count
WITH attendee_metrics AS (
    SELECT
        a.attendee_id,
        a.name,
        MAX(ts.sale_date) AS last_purchase,
        COUNT(ts.sale_id) AS purchase_frequency,
        SUM(ts.quantity) AS tickets_bought
    FROM Attendees a
    LEFT JOIN TicketSales ts ON a.attendee_id = ts.attendee_id
    GROUP BY a.attendee_id
)
SELECT *, 
       (strftime('%s', '2025-09-01') - strftime('%s', last_purchase)) / 86400 AS recency_days
FROM attendee_metrics;

-- 4. Marketing ROI per Attendee
WITH attendee_revenue AS (
    SELECT 
        ts.attendee_id,
        SUM(ts.quantity * 100) AS total_spent
    FROM TicketSales ts
    GROUP BY ts.attendee_id
)
SELECT 
    a.attendee_id,
    a.name,
    ms.spend_amount,
    ar.total_spent,
    (ar.total_spent - ms.spend_amount) AS profit
FROM Attendees a
LEFT JOIN MarketingSpend ms ON a.attendee_id = ms.attendee_id
LEFT JOIN attendee_revenue ar ON a.attendee_id = ar.attendee_id;

-- 5. Monthly Sales Trends
SELECT 
    STRFTIME('%Y-%m', sale_date) AS month,
    SUM(quantity) AS total_tickets_sold
FROM TicketSales
GROUP BY month
ORDER BY month;

-- 6. Returning Attendees (tickets purchased > 1)
SELECT 
    a.attendee_id,
    a.name,
    COUNT(DISTINCT ts.sale_id) AS total_purchases
FROM Attendees a
JOIN TicketSales ts ON a.attendee_id = ts.attendee_id
GROUP BY a.attendee_id
HAVING total_purchases > 1;

-- 7. Average Order Value
SELECT 
    ROUND(SUM(quantity * 100.0) / COUNT(DISTINCT sale_id), 2) AS average_order_value
FROM TicketSales;

-- 8. Frequently Bought Event Pairs
SELECT 
    ts1.event_id AS event_1,
    ts2.event_id AS event_2,
    COUNT(DISTINCT ts1.attendee_id) AS attendees_in_common
FROM TicketSales ts1
JOIN TicketSales ts2 ON ts1.attendee_id = ts2.attendee_id AND ts1.event_id < ts2.event_id
GROUP BY event_1, event_2
ORDER BY attendees_in_common DESC
LIMIT 10;

-- 9. Churned Attendees (Inactive for > 365 days)
SELECT 
    a.attendee_id,
    a.name,
    MAX(ts.sale_date) AS last_purchase,
    ROUND((strftime('%s', '2025-09-01') - strftime('%s', MAX(ts.sale_date))) / 86400) AS days_since_last_purchase
FROM Attendees a
JOIN TicketSales ts ON a.attendee_id = ts.attendee_id
GROUP BY a.attendee_id
HAVING days_since_last_purchase > 365;
