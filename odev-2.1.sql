-- film tablosunda bulunan tüm sütunlardaki verileri replacement cost değeri 12.99 dan büyük eşit ve 16.99 küçük olma koşuluyla sıralayınız ( BETWEEN - AND yapısını kullanınız.)
SELECT * FROM film 
WHERE replacement_cost BETWEEN 12.99 AND 16.98  -- 16.99 yerine .98 alma sebebim, "16.99dan kücük" degerlerin istenmesi. Cünkü yazdığım değer dahil alacak. 