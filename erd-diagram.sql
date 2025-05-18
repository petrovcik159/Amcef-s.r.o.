CREATE TABLE [Zamestnanec] (
  [id] int PRIMARY KEY,
  [meno] nvarchar(255),
  [priezvisko] nvarchar(255),
  [pozicia] nvarchar(255),
  [sadzba] float
)
GO

CREATE TABLE [Dochadzka] (
  [id] int PRIMARY KEY,
  [datum] date,
  [cas_prichodu] time,
  [cas_odchodu] time,
  [typ] nvarchar(255),
  [zamestnanec_id] int,
  [projekt_id] int
)
GO

CREATE TABLE [Projekt] (
  [id] int PRIMARY KEY,
  [nazov] nvarchar(255),
  [rozpocet] float,
  [datum_od] date,
  [datum_do] date,
  [zodpovedna_osoba] int,
  [stav] nvarchar(255),
  [naklady_na_pracu] float,
  [naklady_na_material] float,
  [naklady_na_dopravu] float
)
GO

CREATE TABLE [ProjektZamestnanec] (
  [id] int PRIMARY KEY,
  [projekt_id] int,
  [zamestnanec_id] int,
  [rola] nvarchar(255)
)
GO

CREATE TABLE [Sklad] (
  [id] int PRIMARY KEY,
  [nazov] nvarchar(255),
  [lokalita] nvarchar(255)
)
GO

CREATE TABLE [Material] (
  [id] int PRIMARY KEY,
  [nazov] nvarchar(255),
  [mnozstvo] int,
  [jednotkova_cena] float,
  [sklad_id] int
)
GO

CREATE TABLE [Spotreba_materialu] (
  [id] int PRIMARY KEY,
  [projekt_id] int,
  [material_id] int,
  [mnozstvo] int
)
GO

CREATE TABLE [Naradie] (
  [id] int PRIMARY KEY,
  [nazov] nvarchar(255),
  [typ] nvarchar(255),
  [stav] nvarchar(255),
  [sklad_id] int,
  [aktualny_projekt_id] int,
  [zamestnanec_id] int
)
GO

CREATE TABLE [Vypozicanie_naradia] (
  [id] int PRIMARY KEY,
  [naradie_id] int,
  [zamestnanec_id] int,
  [projekt_id] int,
  [datum_od] date,
  [datum_do] date
)
GO

CREATE TABLE [Oprava_naradia] (
  [id] int PRIMARY KEY,
  [naradie_id] int,
  [datum] date,
  [popis] text,
  [opravil_zamestnanec_id] int
)
GO

CREATE TABLE [Vozidlo] (
  [id] int PRIMARY KEY,
  [znacka_model] nvarchar(255),
  [ev_cislo] nvarchar(255),
  [stav] nvarchar(255),
  [cena_za_km] float,
  [najazdene_km] int,
  [projekt_id] int
)
GO

CREATE TABLE [Využitie_vozidla] (
  [id] int PRIMARY KEY,
  [vozidlo_id] int,
  [datum] date,
  [km] int,
  [zamestnanec_id] int,
  [projekt_id] int
)
GO

ALTER TABLE [Dochadzka] ADD FOREIGN KEY ([zamestnanec_id]) REFERENCES [Zamestnanec] ([id])
GO

ALTER TABLE [Dochadzka] ADD FOREIGN KEY ([projekt_id]) REFERENCES [Projekt] ([id])
GO

ALTER TABLE [Projekt] ADD FOREIGN KEY ([zodpovedna_osoba]) REFERENCES [Zamestnanec] ([id])
GO

ALTER TABLE [ProjektZamestnanec] ADD FOREIGN KEY ([projekt_id]) REFERENCES [Projekt] ([id])
GO

ALTER TABLE [ProjektZamestnanec] ADD FOREIGN KEY ([zamestnanec_id]) REFERENCES [Zamestnanec] ([id])
GO

ALTER TABLE [Material] ADD FOREIGN KEY ([sklad_id]) REFERENCES [Sklad] ([id])
GO

ALTER TABLE [Spotreba_materialu] ADD FOREIGN KEY ([projekt_id]) REFERENCES [Projekt] ([id])
GO

ALTER TABLE [Spotreba_materialu] ADD FOREIGN KEY ([material_id]) REFERENCES [Material] ([id])
GO

ALTER TABLE [Naradie] ADD FOREIGN KEY ([sklad_id]) REFERENCES [Sklad] ([id])
GO

ALTER TABLE [Naradie] ADD FOREIGN KEY ([aktualny_projekt_id]) REFERENCES [Projekt] ([id])
GO

ALTER TABLE [Naradie] ADD FOREIGN KEY ([zamestnanec_id]) REFERENCES [Zamestnanec] ([id])
GO

ALTER TABLE [Vypozicanie_naradia] ADD FOREIGN KEY ([naradie_id]) REFERENCES [Naradie] ([id])
GO

ALTER TABLE [Vypozicanie_naradia] ADD FOREIGN KEY ([zamestnanec_id]) REFERENCES [Zamestnanec] ([id])
GO

ALTER TABLE [Vypozicanie_naradia] ADD FOREIGN KEY ([projekt_id]) REFERENCES [Projekt] ([id])
GO

ALTER TABLE [Oprava_naradia] ADD FOREIGN KEY ([naradie_id]) REFERENCES [Naradie] ([id])
GO

ALTER TABLE [Oprava_naradia] ADD FOREIGN KEY ([opravil_zamestnanec_id]) REFERENCES [Zamestnanec] ([id])
GO

ALTER TABLE [Vozidlo] ADD FOREIGN KEY ([projekt_id]) REFERENCES [Projekt] ([id])
GO

ALTER TABLE [Využitie_vozidla] ADD FOREIGN KEY ([vozidlo_id]) REFERENCES [Vozidlo] ([id])
GO

ALTER TABLE [Využitie_vozidla] ADD FOREIGN KEY ([zamestnanec_id]) REFERENCES [Zamestnanec] ([id])
GO

ALTER TABLE [Využitie_vozidla] ADD FOREIGN KEY ([projekt_id]) REFERENCES [Projekt] ([id])
GO
