# PerkBank
### Türkçe içerikli örnek veritabanı

Northwind, AdventureWorks, Pubs gibi veritabanlarına alternatif; eğitim amaçlı kullanılabilecek ve Türkçe içerikli bir veritabanıdır.

  1. Veritabanı içeriği başka bir veritabanının çeviri yöntemleri ile dönüştürülmüş bir versiyonu kesinlikle değildir
  2. İçerik zenginleştirilmesi için önerilere açıktır
  3. Tablo isimlerinin İngilizce olması sorgulama dilinin T-SQL İngilizce olmasından kaynaklıdır
     - 3.1 "SELECT * FROM Kullanicilar" gibi bir sorgu kişisel fikir olarak pek hoş durmayan bir sorgu
     - 3.2 "SELECT * FROM  Users" gibi bir sorgu anlam kaybetmeden ve ORM tool'ları kullanırken (Entity Framework vb) kolay hareket edebilmenizi sağlayacaktır
  4. .bak uzantılı haliyle beraber .sql uzantılı hali de repository içerisinde olacaktır.
  5. İçerik MS-SQL Server'a göre oluşturulmuştur. Diğer veritabanlarına göre de ilerleyen zamanlarda talebe göre düzenlenebilir
     - 5.1 Farkıl versiyonlamalar için desteklere kapımız kapalı değildir :)


# Tablolar ve Kullanım Amaçları
  1. Enterprise.LookupTypes : Veritabanında tanımlı -daha çok seçim yapılabilecek veriler- verilerin üst kategorisi anlamında kullanılan tablodur
     - 1.1 Örnek : Ülke, şehir, müşteri tipi
  2. Enterprise.Lookups : Veritabanında daha çok hazır tanımların yapılmasını gerektiren verilerin tutulduğu tablodur.
     - 2.1 Örnek : Türkiye, Almanya, İstanbul, Ankara, İzmir, Keçiören, Beşiktaş, Dolar, Euro, Havale
     - 2.2 Veriler arasında hiyerarşi kulabilmektedir
       - 2.2.1 Örnek : Türkiye => Kars => Akyaka gibi hiyerarşi oluşturulabilmektedir
  3. Enterprise.ActorTypes : Veritabanında muhatap alınan her varlık bir aktör olarak kabul edilip, bu aktörlere ait tipler bu tabloda tutulmaktadır
     - 3.1 Örnek: Personel, Bireysel Müşteri, Firma
  4. Enterprise.Actors : Bankanın muhatap aldığı her varlık bu tabloda tutulacaktır. Veritabanının merkezi tablolarından biridir
     - 4.1 Örnek : Can Perk, Ahmet Yıldız, Yıldırım Kırtasiye Ltd. Şti.
  5. Account.Accounts : Bireysel veya firma farketmeksizin banka hesaplarının tutulduğu tablodur. Kaç adet hesap türü ve döviz cinsi varsa ona göre veri içeriği zenginleştirilebilmektedir.
  6. Account.TransferHistories : Banka içi hesapların birbirleri arasında yaptığı para transferinin geçmişini tutan tablodur.
  7. Account.Histories : Günlük hayatta hesap hareketleri diye bildiğimiz durumun tabloya yansıtılmış hâlidir
  
