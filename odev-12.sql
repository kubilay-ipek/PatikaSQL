-- film tablosunda film uzunluğu length sütununda gösterilmektedir. Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?
SELECT COUNT(title) FROM film
WHERE length >
(
	SELECT AVG(length) FROM film
);

-- film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?
SELECT count(title) FROM film
WHERE rental_rate =
(
SELECT MAX(rental_rate) FROM film
);


-- film tablosunda en düşük rental_rate ve en düşük replacement_cost değerlerine sahip filmleri sıralayınız.
(
SELECT title,rental_rate,replacement_cost FROM film
ORDER BY rental_rate ASC
)
UNION
(
SELECT title,rental_rate,replacement_cost FROM film 
ORDER BY replacement_cost ASC
);

-- payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.

SELECT SUM(t1.number_of_ord) AS total_number_of_orders, t1.first_name, t1.last_name, t1.customer_id
FROM (
  SELECT COUNT(payment.payment_id) AS number_of_ord, customer.first_name, customer.last_name, payment.customer_id
  FROM payment
  LEFT JOIN customer ON customer.customer_id = payment.customer_id
  GROUP BY payment.customer_id, customer.first_name, customer.last_name
) t1
GROUP BY t1.customer_id, t1.first_name, t1.last_name
ORDER BY total_number_of_orders DESC