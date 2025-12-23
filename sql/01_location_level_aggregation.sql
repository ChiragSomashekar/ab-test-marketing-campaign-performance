SELECT
  promotion,
  location_id,
  ROUND(AVG(sales_in_thousands), 2) AS avg_sales_per_location
FROM
`tc-da-1.turing_data_analytics.wa_marketing_campaign`
GROUP BY
promotion, location_id
ORDER BY
promotion
