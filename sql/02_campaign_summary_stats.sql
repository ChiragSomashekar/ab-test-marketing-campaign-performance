SELECT
  promotion,
  ROUND(SUM(sales_in_thousands), 2) AS total_sales,
  ROUND(AVG(sales_in_thousands), 2) AS avg_sales,
  ROUND(STDDEV(sales_in_thousands), 2) AS stddev_sales,
  COUNT(*) AS total_orders
FROM
`tc-da-1.turing_data_analytics.wa_marketing_campaign`
GROUP BY
promotion
