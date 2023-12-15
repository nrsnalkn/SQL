/*
  SQL KOMUTLARI GRUPLARA AYRILIR :

  1.(Data Definition Language - DDL) Veri Tanimlama Dili
  CREATE: Tablo oluşturur.
  ALTER: Tabloyu günceller.
  DROP: Tabloyu siler.
  
  
  2.(Data Manipulation Language - DML) Veri Kullanma Dili
  INSERT:Tabloya veri ekler
  UPDATE:Tablodaki verileri günceller
  DELETE:Tablodaki verileri siler
  

  3.(Data Query Language - DQL) Veri Sorgulama Dili
  SELECT: Tablodaki verileri listeler. 
*/


--SORU1.1: talebeler isminde tablo olusturalım

create table talebeler(
ogrenci_tc char(11),      -- Uzunlugu belli olan String veriler icin char() data turu kullanılır
ogrenci_isim varchar(20), -- Uzunlugu belli olmayan String veriler icin varchar() data turu kullanılır
not_ort real,             -- Ondalıklı sayılar icin real data turu kullanılır
kayit_tarihi date         -- Tarih icin date data turu kullanılır
);




--SORU1.2: talebeler tablosundaki verileri listeleyelim

select * from talebeler;




-- SORU1.3: talebeler tablosuna veri ekleyelim

insert into talebeler values('12345678912','Ahmet',72.5,'2020-02-14');
insert into talebeler values('12345678965','Mehmet',80.5,'2021-05-16');
insert into talebeler values('12345678975','Veli',86.5,'2022-02-25');




-- SORU1.4: simdi tekrar talebeler tablosundaki verileri listeleyelim

select * from talebeler;



-- SORU1.5: talebeler tablosunu silelim

drop table talebeler;

/*=====================================SELECT=======================================================


select * from tablo_adi ==> * Tüm sutunlardaki verileri listeler



DQL Grubundan ==> SELECT komutu ile 'Tablodaki İstedigimiz Sütundaki Verileri Listeleyebiliriz'


Syntax:
-------


select sutun_adi from tablo_adi; ==> Sadece belirtilen sutundaki verileri listeler


========================================================================================================*/


create table ogrenciler
(
id int,
isim varchar(40),
adres varchar(100),
sinav_notu int
);

insert into ogrenciler values(120, 'Ali Can', 'Ankara', 75);
insert into ogrenciler values(121, 'Veli Mert', 'Trabzon', 85);
insert into ogrenciler values(122, 'Ayşe Tan', 'Bursa', 65);
insert into ogrenciler values(123, 'Derya Soylu', 'Istanbul', 95);
insert into ogrenciler values(124, 'Yavuz Bal', 'Ankara', 85);
insert into ogrenciler values(125, 'Emre Gül', 'Hatay', 90);
insert into ogrenciler values(126, 'Harun Reşit', 'Isparta', 100);


-- soru 1: ogrenciler tablosundaki tum sutunlari listeleyin

select * from ogrenciler;

--soru 2: ogrenciler tablosundaki isim sutununu listeleyin

select isim from ogrenciler;



-- Soru 3: ogrenciler tablosundaki adres sutununu listeleyin

select adres from ogrenciler;


--SORU4: ogrenciler tablosundaki 'sinav_notu' sutunundaki verileri listeleyiniz
select sinav_notu from ogrenciler;


--SORU5: ogrenciler tablosundaki 'isim' ve 'sinav_notu' sutunundaki verileri listeleyiniz
select isim , sinav_notu from ogrenciler;
/*
where ==> sart belirtmemiz gerektiginde kullanilir
*/

--SORU6: ogrenciler tablosundaki sinav_notu 80'den büyük olan öğrencilerin tüm bilgilerini listele
select * from ogrenciler where sinav_notu >80;

--SORU7: ogrenciler tablosundaki adres'i 'Ankara' olan ögrencilerin tüm bilgilerini listele

select * from ogrenciler where adres = 'Ankara';

--SORU8: ogrenciler tablosundaki sinav_notu 85 ve adres'i 'Ankara' olan öğrenci isim'ini listele
select isim from ogrenciler where sinav_notu = 85 and adres = 'Ankara';

--SORU9: ogrenciler tablosundaki sinav_notu 65 veya 85 olan ogrencilerin tüm bilgilerini listele
select * from ogrenciler where sinav_notu = 65 or sinav_notu = 85;
/*
in == > birden fazla ifade ile tanimlayabilecegimiz durumlari in komutu ile yazabiliriz
select * from ogrenciler where sinav_notu in (65, 85);
in komutu parantezin icinde yazilanlari getirir

*/


--SORU10: .ogrenciler tablosundaki sinav_notu 65 veya 85 olmayan ogrencilerin tüm bilgilerini listele
select * from ogrenciler where sinav_notu not in (65,85);


--not in ==> komutu parantesin icinde olmayanlari getirir
--SORU11: ogrenciler tablosunda sinav_notu 65 ve 85 arasında olan ogrencilerin tüm bilgilerini listele

select * from ogrenciler where sinav_notu >= 65 and sinav_notu= <85 ;
/* between iki veri arasindaki bilgileri getirir

select * from ogrenciler where sinav_notu between 65 and 85 ;
*/
--SORU12:.ogrenciler tablosunda sinav_notu 75 ve 90 arasında olmayan ögrencilerin isim'ini ve sinav_notu listele

select * from ogrenciler where sinav_notu not between 75 and 90 ;










