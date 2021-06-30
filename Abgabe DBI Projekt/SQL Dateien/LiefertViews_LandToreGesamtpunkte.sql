use em2020_melmer_paulweber;

-- Liefert Land, die geschossenen Tore und Gesamtpunkte (in absteigender Reihenfolge) 
-- der ausgewählten Mannschaften als View

-- Gruppe A

CREATE OR REPLACE VIEW gruppeA AS SELECT mannschaft.land AS Gruppe_A, 
sum(spiele.tore) AS Goals, sum(spiele.punkte) AS Points FROM mannschaft, 
spiele WHERE spiele.mannschaftID = 1 AND mannschaft.mannschaftID = 1 
UNION SELECT mannschaft.land, sum(spiele.tore), sum(spiele.punkte) FROM mannschaft, 
spiele WHERE spiele.mannschaftID = 2 AND mannschaft.mannschaftID = 2 
UNION SELECT mannschaft.land, sum(spiele.tore), sum(spiele.punkte) FROM mannschaft, 
spiele WHERE spiele.mannschaftID = 3 AND mannschaft.mannschaftID = 3 
UNION SELECT mannschaft.land, sum(spiele.tore), sum(spiele.punkte) FROM mannschaft, 
spiele WHERE spiele.mannschaftID = 4 AND mannschaft.mannschaftID = 4 
ORDER BY Points DESC, Goals DESC;

-- Gruppe B

CREATE OR REPLACE VIEW gruppeB AS SELECT mannschaft.land AS Gruppe_B, 
sum(spiele.tore) AS Goals, sum(spiele.punkte) AS Points FROM mannschaft, 
spiele WHERE spiele.mannschaftID = 5 AND mannschaft.mannschaftID = 5 
UNION SELECT mannschaft.land, sum(spiele.tore), sum(spiele.punkte) FROM mannschaft, 
spiele WHERE spiele.mannschaftID = 6 AND mannschaft.mannschaftID = 6 
UNION SELECT mannschaft.land, sum(spiele.tore), sum(spiele.punkte) FROM mannschaft, 
spiele WHERE spiele.mannschaftID = 7 AND mannschaft.mannschaftID = 7 
UNION SELECT mannschaft.land, sum(spiele.tore), sum(spiele.punkte) FROM mannschaft, 
spiele WHERE spiele.mannschaftID = 8 AND mannschaft.mannschaftID = 8 
ORDER BY Points DESC, Goals DESC;

-- Gruppe C

CREATE OR REPLACE VIEW gruppeC AS SELECT mannschaft.land AS Gruppe_C, 
sum(spiele.tore) AS Goals, sum(spiele.punkte) AS Points FROM mannschaft, 
spiele WHERE spiele.mannschaftID = 9 AND mannschaft.mannschaftID = 9 
UNION SELECT mannschaft.land, sum(spiele.tore), sum(spiele.punkte) FROM mannschaft, 
spiele WHERE spiele.mannschaftID = 10 AND mannschaft.mannschaftID = 10 
UNION SELECT mannschaft.land, sum(spiele.tore), sum(spiele.punkte) FROM mannschaft, 
spiele WHERE spiele.mannschaftID = 11 AND mannschaft.mannschaftID = 11 
UNION SELECT mannschaft.land, sum(spiele.tore), sum(spiele.punkte) FROM mannschaft, 
spiele WHERE spiele.mannschaftID = 12 AND mannschaft.mannschaftID = 12 
ORDER BY Points DESC, Goals DESC;

-- Gruppe D

CREATE OR REPLACE VIEW gruppeD AS SELECT mannschaft.land AS Gruppe_D, 
sum(spiele.tore) AS Goals, sum(spiele.punkte) AS Points FROM mannschaft, 
spiele WHERE spiele.mannschaftID = 13 AND mannschaft.mannschaftID = 13 
UNION SELECT mannschaft.land, sum(spiele.tore), sum(spiele.punkte) FROM mannschaft, 
spiele WHERE spiele.mannschaftID = 14 AND mannschaft.mannschaftID = 14 
UNION SELECT mannschaft.land, sum(spiele.tore), sum(spiele.punkte) FROM mannschaft, 
spiele WHERE spiele.mannschaftID = 15 AND mannschaft.mannschaftID = 15 
UNION SELECT mannschaft.land, sum(spiele.tore), sum(spiele.punkte) FROM mannschaft, 
spiele WHERE spiele.mannschaftID = 16 AND mannschaft.mannschaftID = 16 
ORDER BY Points DESC, Goals DESC;

-- Gruppe E

CREATE OR REPLACE VIEW gruppeE AS SELECT mannschaft.land AS Gruppe_E, 
sum(spiele.tore) AS Goals, sum(spiele.punkte) AS Points FROM mannschaft, 
spiele WHERE spiele.mannschaftID = 17 AND mannschaft.mannschaftID = 17 
UNION SELECT mannschaft.land, sum(spiele.tore), sum(spiele.punkte) FROM mannschaft, 
spiele WHERE spiele.mannschaftID = 18 AND mannschaft.mannschaftID = 18 
UNION SELECT mannschaft.land, sum(spiele.tore), sum(spiele.punkte) FROM mannschaft, 
spiele WHERE spiele.mannschaftID = 19 AND mannschaft.mannschaftID = 19 
UNION SELECT mannschaft.land, sum(spiele.tore), sum(spiele.punkte) FROM mannschaft, 
spiele WHERE spiele.mannschaftID = 20 AND mannschaft.mannschaftID = 20 
ORDER BY Points DESC, Goals DESC;

-- Gruppe F

CREATE OR REPLACE VIEW gruppeF AS SELECT mannschaft.land AS Gruppe_F, 
sum(spiele.tore) AS Goals, sum(spiele.punkte) AS Points FROM mannschaft, 
spiele WHERE spiele.mannschaftID = 21 AND mannschaft.mannschaftID = 21 
UNION SELECT mannschaft.land, sum(spiele.tore), sum(spiele.punkte) FROM mannschaft, 
spiele WHERE spiele.mannschaftID = 22 AND mannschaft.mannschaftID = 22 
UNION SELECT mannschaft.land, sum(spiele.tore), sum(spiele.punkte) FROM mannschaft, 
spiele WHERE spiele.mannschaftID = 23 AND mannschaft.mannschaftID = 23 
UNION SELECT mannschaft.land, sum(spiele.tore), sum(spiele.punkte) FROM mannschaft, 
spiele WHERE spiele.mannschaftID = 24 AND mannschaft.mannschaftID = 24 
ORDER BY Points DESC, Goals DESC;

SELECT * FROM gruppeA;
SELECT * FROM gruppeB;
SELECT * FROM gruppeC;
SELECT * FROM gruppeD;
SELECT * FROM gruppeE;
SELECT * FROM gruppeF;