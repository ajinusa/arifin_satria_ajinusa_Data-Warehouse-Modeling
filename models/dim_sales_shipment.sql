-- dim_promotion
{{
  config(
    materialized='table'
  )
}}

With t_data AS (
SELECT DISTINCT 
  `ASIN` as asin,
  `ship-postal-code` as ship_postal_code,
  `ship-city` as ship_city,
  `ship-state` as ship_state,
  `ship-country` as ship_country,
  `ship-service-level` as ship_service_level,
  `Courier Status` as courier_status,
--   `status` as status
  
FROM
    {{ source('bronze', 'amazon_sale_report') }}
)

SELECT {{ dbt_utils.generate_surrogate_key([
				'`ASIN`'
			]) }} as sales_shipment_id, *
FROM t_data
