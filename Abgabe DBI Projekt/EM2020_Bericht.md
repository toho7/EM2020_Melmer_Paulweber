# Abschlussprojekt DBI - EM2020  

## Aufgabenstellung

1. ER-Diagramm 
2. SQL Statements zur Datenbank Erstellung 
3. SQL Statements für zentrale Interaktion mit Datenbank 
4. Abfragen mit docker

## ER-Diagramm

Ist zu finden auf dem verlinkten Repository

## SQL-Statements zur Datenbank Erstellung

### Erstellen der Datenbank

```sql
CREATE DATABASE IF NOT EXISTS `em2020_melmer_paulweber` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `em2020_melmer_paulweber`;
```

| Befehle                                            | Erläuterung                                                                                   |
| :------------------------------------------------- | :---------------------------------------------------------------------------------------------|
| `CREATE DATABASE IF NOT EXISTS`                    | Erstellt eine neue Datenbank wenn sie nicht schon existiert                                   |
| `DEFAULT CHARACTER SET`                            | Verwendet den Unicode-Zeichensatz 'utf8mb4' für die Datenbank                                 |
| `COLLATE`                                          | Verwendet zum Sortieren den Zeichensatz 'utf8mb4', 1-4 bytes pro Zeichen                      |
| `USE`                                              | Verwendet die angegebene Datenbank in SQL-Server                                              |

### Erstellen einer Tabelle

```sql
DROP TABLE IF EXISTS `gruppe`;
CREATE TABLE `gruppe` (
  `gruppen_Name` varchar(1) NOT NULL,
  `mannschaft1ID` int(11) NOT NULL,
  `mannschaft2ID` int(11) NOT NULL,
  `mannschaft3ID` int(11) NOT NULL,
  `mannschaft4ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

| Befehle                                            | Erläuterung                                                                                   |
| :------------------------------------------------- | :---------------------------------------------------------------------------------------------|
| `DROP TABLE IF EXISTS`                             | Löscht die Tabelle falls sie schon existiert                                                  |
| `CREATE TABLE (...)`                               | Erstellt die Tabelle und füllt sie mit den mitgegebenen Spalten                               |
| `varchar(1) NOT NULL`                              | Eine Zeichenkette mit der maximalen Länge von 1. Die Spalte darf nicht leer sein              |
| `int(11) NOT NULL`                                 | Ein Medium-Integer mit der maximalen Anzeigebreite 11. Die Spalte darf nicht leer sein        |
| `ENGINE=InnoDB`                                    | ENGINE gibt die Speicher-Engine an, die mit der Tabelle verknüpft werden soll.                |
| `DEFAULT CHARSET=utf8mb4`                          | Gibt den Tabellenzeichensatz an                                                               |

### Daten in die Tabelle einfügen

```sql
INSERT INTO `gruppe` (`gruppen_Name`, `mannschaft1ID`, `mannschaft2ID`, `mannschaft3ID`, `mannschaft4ID`) VALUES
('A', 1, 2, 3, 4),
('B', 5, 6, 7, 8),
('C', 9, 10, 11, 12),
('D', 13, 14, 15, 16),
('E', 17, 18, 19, 20),
('F', 21, 22, 23, 24);
```

| Befehle                                            | Erläuterung                                                                                   |
| :------------------------------------------------- | :---------------------------------------------------------------------------------------------|
| `INSERT INTO table_name`                           | Fügt der Tabelle neue Datensätze hinzu                                                        |
| `VALUES`                                           | Sind die Werte für Spalten der Tabelle.                                                       |

## SQL Statements für zentrale Interaktion mit Datenbank

### Liefert Punkte von Italien

```sql
SELECT mannschaft.land AS Mannschaft, sum(spiele.punkte) AS Gesamtpunkte
FROM mannschaft, spiele 
WHERE spiele.mannschaftID = 1 
AND mannschaft.mannschaftID = 1;
```

| Befehle                                            | Erläuterung                                                                                   |
| :------------------------------------------------- | :---------------------------------------------------------------------------------------------|
| `SELECT mannschaft.land AS Mannschaft,`            | Wählt Daten aus der Datenbank aus ( land aus mannschaft als 'Mannschaft')                     |
| `sum(spiele.punkte) AS Gesamtpunkte`               | Gibt die Gesamtsumme der Spalte der numerischen Spalte zurück ( als 'Gesamtsumme')            |
| `FROM mannschaft, spiele`                          | aus der Tabelle 'mannschaft' und 'spiele'                                                     |
| `WHERE spiele.mannschaftID = 1`                    | filtert die Abfrage aus der Übereinstimmung der angegebenen Bedingung                         |
| `AND mannschaft.mannschaftID = 1;`                 | und dieser Bedingung ( 'mannschaftID' aus den Tabellen 'spiele' und 'mannschaft'              |

### Liefert Land, die geschossenen Tore und Gesamtpunkte (in absteigender Reihenfolge) der ausgewählten Mannschaften (Beispiel Gruppe A) als View

```sql
CREATE OR REPLACE VIEW gruppeA AS SELECT mannschaft.land, 
sum(spiele.tore) AS Goals, sum(spiele.punkte) AS Points FROM mannschaft, 
spiele WHERE spiele.mannschaftID = 1 AND mannschaft.mannschaftID = 1 
UNION SELECT mannschaft.land, sum(spiele.tore), sum(spiele.punkte) FROM mannschaft, 
spiele WHERE spiele.mannschaftID = 2 AND mannschaft.mannschaftID = 2 
UNION SELECT mannschaft.land, sum(spiele.tore), sum(spiele.punkte) FROM mannschaft, 
spiele WHERE spiele.mannschaftID = 3 AND mannschaft.mannschaftID = 3 
UNION SELECT mannschaft.land, sum(spiele.tore), sum(spiele.punkte) FROM mannschaft, 
spiele WHERE spiele.mannschaftID = 4 AND mannschaft.mannschaftID = 4 
ORDER BY Points DESC, Goals DESC;
```

| Befehle                                            | Erläuterung                                                                                   |
| :------------------------------------------------- | :---------------------------------------------------------------------------------------------|
| `CREATE OR REPLACE VIEW gruppeA`                   | Erstellt / Ersetzt eine virtuelle Tabelle, basierend auf der Ergebnissmenge der SQL-Anweisung |
| `AS SELECT mannschaft.land`                        | Gibt dieser virtuelle Tabelle einen temporären Namen                                          |
| `sum(spiele.tore) AS Goals`                        | Gibt die Gesamtsumme der Spalte der numerischen Spalte zurück mit dem temporären Namen        |
| `sum(spiele.punkte) AS Points FROM mannschaft,`    | Gibt die Gesamtsumme der Spalte der numerischen Spalte zurück mit dem temporären Namen        |
| `spiele WHERE spiele.mannschaftID = 1`             | aus 'mannschaft' und 'spiele' wo die ID der Mannschaft aus spiele                             |
| `AND mannschaft.mannschaftID = 1`                  | und die ID der Mannschaft aus mannschaft gleich 1 ist                                         |
| `ORDER BY Points DESC, Goals DESC`                 | ordnet diese Abfrage nacheinander nach Punkte und Tore in absteigender Reihenfolge            |

### Liefert FifaWeltrangliste mit Land

```sql
SELECT mannschaft.land AS Mannschaft, mannschaft.fifaWeltrangliste AS FifaWeltrangliste 
FROM mannschaft 
ORDER BY mannschaft.fifaWeltrangliste;
```

| Befehle                                            | Erläuterung                                                                                   |
| :------------------------------------------------- | :---------------------------------------------------------------------------------------------|
| `SELECT mannschaft.land AS Mannschaft,`            | Wählt Daten aus der Datenbank aus ( land aus mannschaft als 'Mannschaft')                     |
| `mannschaft.fifaWeltrangliste AS FifaWeltrangliste`| ( fifaWeltrangliste aus mannschaft als 'FIFAWeltrangliste' )                                  |
| `FROM mannschaft`                                  | aus der Tabelle 'mannschaft'                                                                  |
| `ORDER BY mannschaft.fifaWeltrangliste`            | ordnet diese Abfrage nach der fifaWeltrangliste                                               |

### Liefert Mannschaften aus Top 10 der FifaWeltrangliste die bei der EM teilnehmen

```sql
SELECT mannschaft.fifaWeltrangliste AS FifaWeltrangliste, mannschaft.land AS Mannschaft 
FROM mannschaft 
WHERE mannschaft.fifaWeltrangliste <= 10 
ORDER BY mannschaft.fifaWeltrangliste;
```

| Befehle                                            | Erläuterung                                                                                   |
| :------------------------------------------------  | :---------------------------------------------------------------------------------------------|
| `SELECT mannschaft.fifaWeltrangliste AS FifaWe..,` | Wählt Daten aus der Datenbank aus ( fifaWeltrangliste aus mannschaft als 'FIFAWeltrangliste' )|
| `mannschaft.land AS Mannschaft,`                   | ( land aus mannschaft als 'Mannschaft')                                                       |
| `FROM mannschaft`                                  | aus der Tabelle 'mannschaft'                                                                  |
| `WHERE mannschaft.fifaWeltrangliste <= 10`         | filtert die Abfrage aus der angegebenen Bedingung ( kleiner gleich 10 )                       |
| `ORDER BY mannschaft.fifaWeltrangliste`            | und ordnet diese Abfrage nach der fifaWeltrangliste                                           |

### Liefert Länder, die an der EM teilnehmen und Austragungsland von Spielen sind

```sql
SELECT mannschaft.land AS Mannschaft 
FROM mannschaft 
JOIN spielort 
ON mannschaft.land = spielort.land;
```

| Befehle                                            | Erläuterung                                                                                   |
| :------------------------------------------------- | :---------------------------------------------------------------------------------------------|
| `SELECT mannschaft.land AS Mannschaft,`            | Wählt Daten aus der Datenbank aus ( land aus mannschaft als 'Mannschaft')                     |
| `FROM mannschaft`                                  | aus der Tabelle 'mannschaft'                                                                  |
| `JOIN spielort`                                    | kombiniert diese mit der Tabelle 'spielort'                                                   |
| `ON mannschaft.land = spielort.land`               | basierend auf der Übereinstimmung der Spalte land beider Tabellen                             |

### Liefert Mannschaft mit bester Weltranglistenplatzierung aus jeder Gruppe

```sql
SELECT mannschaft.land AS Mannschaft, gruppe.gruppen_Name AS Gruppe, mannschaft.fifaWeltrangliste AS FIFAWeltrangliste 
FROM mannschaft 
JOIN gruppe 
ON gruppe.mannschaft1ID = mannschaft.mannschaftID 
ORDER BY gruppe.gruppen_Name ASC;
```

| Befehle                                            | Erläuterung                                                                                   |
| :------------------------------------------------- | :---------------------------------------------------------------------------------------------|
| `SELECT mannschaft.land AS Mannschaft,`            | Wählt Daten aus der Datenbank aus ( land aus mannschaft als 'Mannschaft')                     |
| `gruppe.gruppen_Name AS Gruppe,`                   | ( gruppen_name aus gruppe als 'Gruppe' )                                                      |
| `mannschaft.fifaWeltrangliste AS FIFAWeltrangliste`| ( fifaWeltrangliste aus mannschaft als 'FIFAWeltrangliste' )                                  |
| `FROM mannschaft`                                  | aus der Tabelle 'mannschaft'                                                                  |
| `JOIN gruppe`                                      | kombiniert diese mit der Tabelle 'gruppe'                                                     |
| `ON gruppe.mannschaft1ID = mannschaft.mannschaftID`| basierend auf der Übereinstimmung der Spalte mannschaftID beider Tabellen                     |
| `ORDER BY gruppe.gruppen_Name ASC;`                | ordnet diese Abfrage nach 'gruppen_name' in aufsteigender Reihenfolge                         |

## Ausführen SQL-Befehle mit Docker über Container

- beim Ausführen eines sql-Befehls über den laufenden Container, muss man sich im selben Ordner befinden wie der Befehl;

## Datenbank mit Docker

### Erstellen der Datenbank, importieren der Daten

```dockerfile
docker exec -i CONTAINER_NAME ODER ID mysql -t -uroot -p123 < database.sql
```

### Liefert die Punkte von Italien

```dockerfile
docker exec -i CONTAINER_NAME ODER ID mysql -t -uroot -p123 < LiefertPunkteVonItalien.sql
```

### Liefert Fifa-Weltrangliste mit Land

```dockerfile
docker exec -i CONTAINER_NAME ODER ID mysql -t -uroot -p123 < FifaWeltranglistMitLand.sql
```

### Liefert Mannschaft mit bester Fifa-Weltranglistenplatzierung aus jeder Gruppe der EM

```dockerfile
docker exec -i CONTAINER_NAME ODER ID mysql -t -uroot -p123 < MannschaftMitBesterFifaPlatzierung.sql
```

### Liefert Länder, die an der EM teilnehmen und Austragungsland von Spielen sind

```dockerfile
docker exec -i CONTAINER_NAME ODER ID mysql -t -uroot -p123 < TeilnehmerUndAustragungsland.sql
```

### Liefert Mannschaften aus Top 10 der FifaWeltrangliste die bei der EM teilnehmen

```dockerfile
docker exec -i CONTAINER_NAME ODER ID mysql -t -uroot -p123 < Top10FifaAusEM.sql
```

### Liefert Land, die geschossenen Tore und Gesamtpunkte (in absteigender Reihenfolge) der ausgewählten Mannschaften als View und gibt diese auf der Konsole aus

```dockerfile
docker exec -i CONTAINER_NAME ODER ID mysql -t -uroot -p123 < LiefertViews_LandToreGesamtpunkte.sql
```

| Befehle                                            | Erläuterung                                                                                   |
| :------------------------------------------------- | :---------------------------------------------------------------------------------------------|
| `docker exec`                                      | Führt einen neuen Befehl in einem laufenden Container aus                                     |
| `i`                                                | STDIN offen auch wenn nicht verbunden                                                         |
| `CONTAINER_NAME ODER ID mysql`                     | Name des Containers oder dessen ID für mysql                                                  |
| `CONTAINER_NAME ODER ID mysql`                     | Name des Containers oder dessen ID für mysql                                                  |
| `-t`                                               | Zuweisung Pseudo-TTY                                                                          |
| `-uroot`                                           | Username root                                                                                 |
| `< AUSZUFUEHRENDE_DATEI.sql`                       | Führt diese Datei auf dem laufenden Container aus                                             |

## Verwendete Technologien

- phpMyAdmin 5.1.1
- mysql 8.0
- Datenbank Server-Version: 10.4.14-MariaDB
- Visual Studio Code 1.52.1
- Ubuntu 20.04.1 LTS
- Docker, Version 19.03.13

## Literatur

***Verwendete Quellen:***  
w3schools -> https://www.w3schools.com/sql/default.asp   
w3schools -> https://www.w3schools.com/mysql/default.asp    
MySQL Tutorial -> https://www.mysqltutorial.org/  

## Links

Bericht und Code auch zu finden auf:  
https://github.com/toho7/EM2020_Melmer_Paulweber.git