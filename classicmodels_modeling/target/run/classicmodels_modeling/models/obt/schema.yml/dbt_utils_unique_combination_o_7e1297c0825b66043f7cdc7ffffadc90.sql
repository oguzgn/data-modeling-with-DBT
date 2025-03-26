select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      





with validation_errors as (

    select
        order_number, order_line_number
    from "postgres"."classicmodels_obt"."orders_obt"
    group by order_number, order_line_number
    having count(*) > 1

)

select *
from validation_errors



      
    ) dbt_internal_test