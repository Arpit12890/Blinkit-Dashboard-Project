select i.product_id,p.category,p.product_name,p.price,i.date,i.stock_received,i.damaged_stock,round(p.price*i.stock_received,2) Price
from inventory i,products p 
where i.product_id=p.product_id;