/*============================= GROUP BY =====================================

    GROUP BY cümleciği bir SELECT ifadesinde satırları, sutunların değerlerine 
    göre özet olarak GRUPLAMAK için kullanılır. 
   
    GROUP BY cümleceği her grup başına bir satır döndürür. 
    
    GROUP BY genelde, AVG(),COUNT(),MAX(),MIN() ve SUM() gibi aggregate 
    fonksiyonları ile birlikte kullanılır.
==============================================================================*/ 

create table insan(
id int primary key,
isim varchar(20),
soyisim varchar(20),
yas int,
cinsiyet char,
sehir varchar(20),
ulke varchar(20),
maas int
);


insert into insan values(200, 'Oguz', 'Kagan', '46', 'E', 'Berlin', 'Almanya', '32000');
insert into insan values(201, 'Burak', 'Ak', '30', 'E', 'Paris', 'Fransa', '50000');
insert into insan values(202, 'Funda', 'Nar', '30', 'K', 'Berlin', 'Almanya', '42000');
insert into insan values(203, 'Muhammet', 'Bir', '40', 'E', 'Paris', 'Fransa', '36000');
insert into insan values(204, 'Hasan',  'Ozay', '30', 'E', 'Izmir', 'Turkiye', '18000');
insert into insan values(205, 'Fatma', 'Yilmaz', '40', 'K', 'Istanbul', 'Turkiye', '20000');
insert into insan values(206, 'Resul', 'Demir', '35', 'E', 'Ankara', 'Turkiye', '21000');
insert into insan values(207, 'Elif', 'Can', '38', 'K', 'Isparta', 'Turkiye', '19000');
insert into insan values(208, 'Sinan', 'Burc', '32', 'E', 'Londra', 'Ingiltere', '60000');
insert into insan values(209, 'Hamza', 'Kul', '29', 'E', 'Londra', 'Ingiltere', '63000');
insert into insan values(210, 'Aylin', 'Van', '51', 'K', 'Roma', 'Italya', '38000');



select * from insan;

-- SORU01: ulke'lere göre gruplayarak ortalama yas'ı listeleyiniz

select ulke, round(avg(yas))  as ortalama_yas from insan group by ulke; 
-- as ile gecici isimlendirme yapilir
-- round () ile ondalikli sayilardan kurtuluruz

-- SORU02: ulke'lere göre gruplayarak kaç çalışan olduğunu listeleyiniz.

select ulke, count(isim) as calisan_sayisi from insan group by ulke;
--2.yol
select ulke, count(*) as calisan_sayisi from insan group by ulke;


-- SORU03: cinsiyet'e göre gruplayarak maas ortalamasını listeleyiniz
select cinsiyet ,round(avg (maas))  as ortalama_maas from insan group by cinsiyet;

-- SORU04: insan tablosunu, ulke'lere göre ve sehir'lere göre gruplayarak listeleyiniz
select ulke, sehir from insan group by ulke, sehir;

-- SORU05: ulke'lere göre ve sehir'lere göre gruplayarak çalışan sayısını listeleyiniz.
select ulke, sehir,count(id) as calisan_sayisi from insan group by ulke, sehir;

-- SORU06: ulke'lere göre ve cinsiyet'e göre gruplayarak çalışan sayısını 
--ve yas ortalamasını listeleyiniz.
select ulke , cinsiyet , count(isim) as calisan_sayisi ,round (avg(yas)) as ortalama_yas 
from insan group by ulke , cinsiyet;

-- SORU07: maas'ı 30000 den büyük olanların, 
-- ulke'lere göre ve cinsiyet'e göre gruplayarak çalışan sayısını, 
--yas ortalamasını listeleyiniz.
select ulke, cinsiyet , count(id) as calisan_sayisi, round(avg(yas))  as ortalama_yas 
from insan where maas>30000 group by ulke, cinsiyet;



/*

HAVING:

1) Sart belirtmek icin kullanılır
2) Where komutundan farkı: Gruplama yaptıktan sonra, cıkan sonucta sart kosulacaksa 
Having komutu kullanılır. 
3) Group by komutundan sonra yer alır.
*/




--SORU08: ulke'lere göre gruplayarak yas ortalamasını bulup, yas ortalaması 33'den buyuk olanları listeleyiniz. 

select ulke, avg(yas) from insan group by ulke
having avg(yas)>33;

--SORU9: ulke'lere göre gruplayarak ortalama maası bulup, ortalama maas 30000'den buyuk olanları listeleyiniz

select ulke, avg(maas) 
from insan 
group by ulke 
having avg(maas)>30000;

/*========================UNION, UNION ALL============================================
   
    UNION: İKİ VEYA DAHA FAZLA SORGU İFADESİNİN SONUC KUMELERİNİ BİRLEŞTİREREK 
	     TEK BİR SONUC KUMESİ OLUSTURUR.
   

    Syntax:
    ----------
    SELECT sutun_adi FROM tablo_adi
    UNION
    SELECT sutun_adi FROM tablo_adi;
    

 UNION:         SADECE BENZERSİZ VERİLERİ ALIR 

 UNION ALL:     BENZERLİ VERİLERİ DE ALIR
    

 NOT:  Birlesik olan Sorgu ifadesinin data türü diger sorgulardaki 
    ifadelerin data türü ile uyumlu olmalidir.
======================================================================================*/ 

CREATE TABLE personel 
(
	id int  PRIMARY KEY, 
	isim VARCHAR(50), 
	sehir VARCHAR(50), 
	maas int, 
	sirket VARCHAR(20)
);
   
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
INSERT INTO personel VALUES(345678902, 'Mehmet Ozturk', 'Istanbul', 3500, 'Honda'); 
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel VALUES(453445611, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO personel VALUES(123456710, 'Hatice Sahin','Bursa', 4200, 'Honda');

/* -----------------------------------------------------------------------------
  SORU1: maas'i 4000’den cok olan personelin maas, isim'lerini ve  
--maas'i 5000’den cok olan personelin maas, sehir'lerini gosteren 
--tekrarsız sorguyu yaziniz
------------------------------------------------------------------------------*/

select maas,isim as isim_sehir from personel where maas>4000
union 
select maas,sehir from personel where maas>5000;

/* -----------------------------------------------------------------------------
  SORU2: isim'i 'Mehmet Ozturk' olan kisilerin isim, maas'larini  ve  
--sehir'i 'Istabul' olan personelin sehir, maas'larini tekrarsız
--büyükten küçüge dogru siralayarak bir tabloda gosteren sorguyu yaziniz.    
------------------------------------------------------------------------------*/  

select isim as isim_sehir, maas from personel where isim='Mehmet Ozturk'
union
select sehir,maas from personel where sehir='Istanbul'
order by maas desc;

/* -----------------------------------------------------------------------------
  SORU3: sirket'i 'Honda', 'Ford' ve 'Tofas' olan personelin sirket ve isim'ini tekrarsız listeleyin
------------------------------------------------------------------------------*/  

select sirket, isim from personel where sirket='Honda'
union 
select sirket, isim from personel where sirket='Ford'
union 
select sirket, isim from personel where sirket='Tofas'

/* -----------------------------------------------------------------------------
  SORU4: maas'ı 5000’den az olan personelin isim, maas ve sirket bilgileri ile, 
-- 'Honda' calisani olmayan personelin isim, maas, sirket bilgilerini
-- tekrarsız listeleyen bir sorgu yaziniz. 
------------------------------------------------------------------------------*/ 

select isim, maas, sirket from personel where maas<5000 
union
select isim, maas, sirket from personel where sirket!='Honda'




















