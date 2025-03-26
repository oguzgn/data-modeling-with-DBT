





with validation_errors as (

    select
        order_number, order_line_number
    from "postgres"."classicmodels_obt"."orders_obt"
    group by order_number, order_line_number
    having count(*) > 1

)

select *
from validation_errors


