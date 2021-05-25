select
    ord.order_id
    , ord.customer_id
    , pay.amount
from {{ ref('stg_orders') }} as ord
left join {{ ref('stg_payments') }} as pay on ord.order_id = pay.order_id
where pay.status = 'success'