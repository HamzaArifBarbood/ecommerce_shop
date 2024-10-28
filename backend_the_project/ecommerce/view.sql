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
SELECT SUM(round((items.item_price-(items.item_price*items.item_discount/100)),2)) as totalPrice  ,COUNT(cart_id) as quantity , as itempricediscount , items.* ,cart.* from cart
      INNER JOIN items on items.item_id=cart.cart_itemid
      
      GROUP by cart.cart_itemid,cart.cart_userid
           