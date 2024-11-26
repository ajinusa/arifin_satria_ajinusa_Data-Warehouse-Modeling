-- dim_promotion
{{
  config(
    materialized='table'
  )
}}

With t_data AS (
SELECT DISTINCT 
  `Sales Channel ` as sales_chanel,
FROM
    {{ source('bronze', 'amazon_sale_report') }}
)

SELECT {{ dbt_utils.generate_surrogate_key([
				'sales_chanel'
			]) }} as sales_chanel_id, *
FROM t_data
