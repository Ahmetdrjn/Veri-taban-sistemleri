create database school_library;
use school_library;
create table uyeler(
uyeNo int not null identity(1,1) Primary Key,
uyeAdi nvarchar(50) not null,
uyeSoyadi nvarchar(50) not null,
cinsiyet nchar(5),
eposta nvarchar(100),
telefon int
);
ALTER TABLE uyeler
    ADD adresNo INT
    CONSTRAINT FK_uyeler_adresNo 
        FOREIGN KEY (adresNo) 
        REFERENCES adresler(adresNo);

use school_library;
create table adresler(
adresNo int not null identity(1,1) Primary Key,
sehir nvarchar(50) not null,
mahalle nvarchar(50) not null,
cadde nvarchar(50) not null,
binaNo int,
postaKodu nvarchar(20),
ulke nvarchar(50)
);

crate table emanet(
emanetNo int not null identity(1,1) PRIMARY KEY,
ISBN varchar(20) not null,
uyeNo int not null,
kutuphaneNo int not null,
emanetTarihi datetime,
teslimTarihi datetime,
);


USE school_library;
ALTER TABLE emanet ADD CONSTRAINT "uyelerEmanet" 
FOREIGN KEY (uyeNo) REFERENCES uyeler(uyeNo);

USE school_library;
ALTER TABLE emanet ADD CONSTRAINT "emanetKitaplar" 
FOREIGN KEY (ISBN) REFERENCES kitaplar(ISBN);

USE school_library;
ALTER TABLE emant ADD CONSTRAINT "kutuphaneEmanet" 
FOREIGN KEY (kutuphaneNo) REFERENCES kutuphane(kutuphaneNo);


create table kitaplar(
KitapAdi varchar(27)
ISBN varchar(27) PRIMARY KEY,
sayfaSayisi int,
YayinTarihi varchar(27),
);

create table yazarlar(
yazarNo int identity(1,1) PRIMARY KEY,
yazarAdi varchar(27),
yazarSoyadi varchar(27),
);

create table kategoriler(
kategoriNo int identity(1,1) PRIMARY KEY,
kategoriAdi varchar(27),
);

create table kutuphane(

kutuphaneNo int not null identity(1,1) PRIMARY KEY,
kutuphaneIsmi nvarchar(150),
aciklama nvarchar(500),
adresNo int constraint FK_adresler_kutuphane
FOREIGN KEY(adresNo) references adresler(adresNo)
);

USE school_library;
ALTER TABLE kutuphane ADD CONSTRAINT "adresler_kutupahne" 
FOREIGN KEY (adresNo) REFERENCES adresler(adresNo)

create table kitapKutuphane(
kutuphaneNo int not null,
ISBN varchar(27) not null,
miktar int,
constraint "kitapKutuphane_PK" PRIMARY KEY ("kutuphaneNo", "ISBN"),
constraint "kitapKutuphane_FK" FOREIGN KEY ("kutuphaneNo") REFERENCES kategoriler(kategoriNo)
);

ALTER TABLE kitapKutuphane ADD CONSTRAINT "kitap_kutuphane_kitaplar_FK" FOREIGN KEY ("ISBN") REFERENCES kitaplar(ISBN);


USE school_library;
ALTER TABLE kitapKutuphane ADD CONSTRAINT kutuphane_kitap_kutuphane
FOREIGN KEY (kutuphaneNo) REFERENCES kutuphane(kutuphaneNo);

USE school_library;
ALTER TABLE kitapKutuphane ADD CONSTRAINT kitaplar_kitap_kutupahne
FOREIGN KEY (ISBN) REFERENCES kutupahne(ISBN);


create table kitapKategori(
ISBN varchar(27) not null,
kategoriNo int not null,
constraint "kitapKategori_PK" PRIMARY KEY ("kategoriNo", "ISBN")
);

USE school_library;
ALTER TABLE kitapKategori ADD CONSTRAINT kategoriler_kitap_kategori
FOREIGN KEY (kategoriNo) REFERENCES kategoriler(kategoriNo);

USE school_library;
ALTER TABLE kitapKategori ADD CONSTRAINT kitaplar_kitap_kategoriler
FOREIGN KEY (ISBN) REFERENCES kitaplar(ISBN);


create table kitapYazar(
ISBN varchar(27) not null,
yazarNo int not null,
constraint "kitapYazar_PK" PRIMARY KEY ("yazarNo", "ISBN")
);

USE school_library;
ALTER TABLE kitapYazar ADD CONSTRAINT yazarlar_kitap_yazarlar
FOREIGN KEY (yazarNo) REFERENCES yazarlar(yazarNo);

USE school_library;
ALTER TABLE kitapYazar ADD CONSTRAINT kitaplar_kitap_yazar
FOREIGN KEY (ISBN) REFERENCES kitaplar(ISBN);






