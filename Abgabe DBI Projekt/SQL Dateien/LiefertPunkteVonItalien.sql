use em2020_melmer_paulweber;

-- Liefert die Punkte der Mannschaft Italien

SELECT mannschaft.land AS Mannschaft, sum(spiele.punkte) AS Gesamtpunkte 
FROM mannschaft, spiele 
WHERE spiele.mannschaftID = 1 
AND mannschaft.mannschaftID = 1;