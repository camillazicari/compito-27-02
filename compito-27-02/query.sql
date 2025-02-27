USE [s3l4-archiviazione]

CREATE TABLE Impieghi (
IDImpiego INT IDENTITY(1,1)  NOT NULL PRIMARY KEY,
TipoImpiego NCHAR(30) NOT NULL,
Assunzione DATETIME NOT NULL,
)

CREATE TABLE Impiegati (
IDImpiegato INT IDENTITY(1,1)  NOT NULL PRIMARY KEY,
Cognome NCHAR(20) NOT NULL,
Nome NCHAR(20) NOT NULL,
CF NCHAR(16) NOT NULL UNIQUE,
Eta INT NOT NULL,
RedditoMensile MONEY NOT NULL,
DetrazioneFiscale BIT NOT NULL,
IDImpiego INT  NOT NULL,
CONSTRAINT FK_id_impiego FOREIGN KEY (IDImpiego) REFERENCES Impieghi(IDImpiego)
)

INSERT INTO Impieghi(TipoImpiego, Assunzione) VALUES 
('Amministratore Delegato (CEO)', '2020-01-10 09:00:00'),

('Direttore Finanziario', '2021-01-12 13:00:00'),

('Responsabile Marketing', '2021-01-12 13:00:00'),

('Direttore delle Risorse Umane', '2021-07-05 10:00:00'),

('Responsabile Marketing', '2020-06-12 11:00:00'),

('Responsabile IT', '2018-11-08 08:15:00'),

('Contabile', '2017-04-03 09:30:00'),

('Addetto alla Logistica', '2023-05-25 07:45:00'),

('Responsabile Qualità', '2019-02-18 10:30:00'),

('Ingegnere di Produzione', '2021-08-30 08:50:00'),

('Progettista', '2020-12-14 09:15:00'),

('Sviluppatore Software', '2022-01-27 10:10:00'),

('Data Analyst', '2023-06-06 11:30:00'),

('Addetto al Servizio Clienti', '2018-10-09 08:40:00'),

('Commerciale', '2017-07-21 10:00:00'),

('Tecnico Manutentore', '2022-11-11 07:30:00'),

('Responsabile Acquisti', '2019-05-16 09:20:00'),

('Social Media Manager', '2021-03-23 10:45:00'),

('Contabile', '2016-09-05 08:20:00'),

('Operatore di Magazzino', '2023-07-29 06:50:00')


INSERT INTO Impiegati (Cognome, Nome, CF, Eta, RedditoMensile, DetrazioneFiscale, IDImpiego)  VALUES  

('Rossi', 'Marco', 'RSSMRC80A01H501Z', 44, 5000.00, 1, 1),  

('Bianchi', 'Laura', 'BNCGLR75B45H501Y', 49, 4500.00, 1, 2),  

('Verdi', 'Andrea', 'VRDNDR82C12H501X', 42, 4000.00, 1, 3),  

('Gialli', 'Elena', 'GLLLNE88D23H501W', 36, 3800.00, 0, 4),  

('Neri', 'Francesco', 'NRIFRC90E11H501V', 34, 3700.00, 0, 5),  

('Blu', 'Giovanni', 'BLUGVN78F09H501U', 46, 4200.00, 1, 6),  

('Marrone', 'Sara', 'MRRSRA85G14H501T', 39, 3500.00, 0, 7), 

('Viola', 'Paolo', 'VLAPLO92H30H501S', 31, 3000.00, 0, 8),  

('Grigio', 'Anna', 'GRGANN95I18H501R', 28, 3300.00, 1, 9),  

('Arancio', 'Luca', 'ARCLOC89L25H501Q', 35, 3900.00, 0, 10),  

('Celeste', 'Marta', 'CLSMRT91M06H501P', 33, 3600.00, 0, 11),  

('Indaco', 'Giulia', 'INDGLA94N22H501O', 30, 3400.00, 1, 12),  

('Turchese', 'Stefano', 'TRCSTF97O15H501N', 27, 3200.00, 1, 13),  

('Magenta', 'Valeria', 'MGNVLR96P03H501M', 28, 3100.00, 0, 14),  

('Zaffiro', 'Roberto', 'ZFRRBT83Q19H501L', 41, 3700.00, 1, 15),  

('Porpora', 'Cristina', 'PRPCRS79R10H501K', 45, 3400.00, 1, 16),  

('Beige', 'Alessandro', 'BGAALS81S07H501J', 43, 3900.00, 1, 17),  

('Ametista', 'Daniela', 'AMTDNL87T11H501I', 37, 3600.00, 0, 18),  

('Perla', 'Giorgio', 'PRLGRG76U09H501H', 48, 3500.00, 1, 19),  

('Smeraldo', 'Chiara', 'SMRCHR99V05H501G', 25, 2900.00, 0, 20);  

--a--
SELECT * FROM Impiegati WHERE Eta > 29;

--b--
SELECT * FROM Impiegati WHERE RedditoMensile > 800;

--c--
SELECT * FROM Impiegati WHERE DetrazioneFiscale = 1;

--d--
SELECT * FROM Impiegati WHERE DetrazioneFiscale = 0;

--e--
SELECT * FROM Impiegati WHERE Cognome LIKE 'G%' ORDER BY Cognome ASC;

--f--
SELECT COUNT(IDImpiegato) AS ImpRegistrati FROM Impiegati;

--g--
SELECT SUM(RedditoMensile) AS TotRedditi FROM Impiegati;

--h--
SELECT AVG(RedditoMensile) AS MediaRedditi FROM Impiegati;

--i--
SELECT MAX(RedditoMensile) AS RedditoMaggiore FROM Impiegati;

--j--
SELECT MIN(RedditoMensile) AS RedditoMinore FROM Impiegati;

--k--
SELECT I.Cognome, I.Nome, I.CF, I.Eta, I.RedditoMensile, I.DetrazioneFiscale, IM.TipoImpiego, IM.Assunzione  
FROM Impiegati I  
INNER JOIN Impieghi IM ON I.IDImpiego = IM.IDImpiego  
WHERE IM.Assunzione BETWEEN '2020-01-01 00:00:00' AND '2021-01-01 00:00:00';

--l--
SELECT I.Cognome, I.Nome, I.CF, I.Eta, I.RedditoMensile, I.DetrazioneFiscale, IM.TipoImpiego, IM.Assunzione
FROM Impiegati I
INNER JOIN Impieghi IM ON I.IDImpiego = IM.IDImpiego
WHERE IM.TipoImpiego = 'Responsabile IT';

--m--
SELECT AVG(Eta) AS EtaMedia FROM Impiegati;