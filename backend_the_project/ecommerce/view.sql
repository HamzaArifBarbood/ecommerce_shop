SELECT itemsview.*, 1 as "favorite"
from itemsview  inner join favorites on itemsview.item_id = favorites.favorite_itemid  and favorites.favorite_userid = 3
union ALL
SELECT *,  0 as "favorite"
from itemsview
WHERE item_id != ( SELECT itemsview.item_id from itemsview
            inner join favorites on itemsview.item_id favorites.favorite_itemid
            and favorites.favorite_userid = 3)


CREATE or REPLACE VIEW myfavorites  AS 
SELECT items.* , favorites.* ,users.user_id from favorites 
INNER JOIN items ON items.item_id=favorites.favorite_itemid
INNER JOIN users ON users.user_id=favorites.favorite_userid
     


      CREATE or REPLACE VIEW cartview As
SELECT SUM(round((items.item_price-(items.item_price*items.item_discount/100)),2)) as totalPrice  ,COUNT(cart.cart_itemid) as quantity ,  items.* ,cart.* from cart
      INNER JOIN items on items.item_id=cart.cart_itemid
      WHERE cart.cart_orderid=0
      
      GROUP by cart.cart_itemid,cart.cart_userid
           

                       INSERT INTO ordersdetails (
                        ordersdetails.orddetails_orderid,
                       ordersdetails.orddetails_itemid,
                       ordersdetails.orderdetails_type,
                                       ordersdetails.orderdetails_paymentmethod,
                                       ordersdetails.orderdetails_pricedelivery,
                                       ordersdetails.orddetails_Quntity,
                                       ordersdetails.orderdetails_totalprice,
                                       ordersdetails.orderdetails_coupon)
                                       SELECT (SELECT MAX(orders.order_id) from orders),cart.cart_itemid,0,1,90,COUNT(cart.cart_itemid),
                                       COUNT(cart.cart_itemid)*items.item_price,9 FROM cart 
                                                         INNER JOIN    items ON items.item_id=cart.cart_itemid 
                                                           GROUP BY cart.cart_itemid