SELECT 
orders.order_id,
customer.customer_id,
orders.delivery_partner_id,
order_item.product_id,
customer_feedbacks.feedback_id,
orders.order_date order_datetime,
customer.area,
customer.customer_name,
customer.customer_segment,
products.product_name,
products.category,
order_item.quantity,
products.price,
round(products.price*order_item.quantity,2) Value,
orders.payment_method,
delivery.promised_time,
delivery.actual_time,
delivery.delivery_time_minutes,
delivery.reasons_if_delayed,
customer_feedbacks.rating,
customer_feedbacks.feedback_category,
customer_feedbacks.feedback_text,
customer_feedbacks.sentiment,
rating.Emoji,
rating.Star,
category.Img,
DATE(orders.order_date) Date
from 
orders,customer,order_item,products,customer_feedbacks,delivery,rating,category
where 
orders.customer_id=customer.customer_id
and round(order_item.order_id)=orders.order_id
and order_item.product_id=round(products.product_id)
and customer_feedbacks.order_id=orders.order_id
and customer_feedbacks.customer_id=orders.customer_id
and delivery.delivery_partner_id=orders.delivery_partner_id
and delivery.order_id=orders.order_id
and customer_feedbacks.rating=rating.Rating
and products.category=category.category;