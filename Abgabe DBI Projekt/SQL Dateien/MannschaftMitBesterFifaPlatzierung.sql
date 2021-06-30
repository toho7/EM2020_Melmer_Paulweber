use em2020_melmer_paulweber;

-- Liefert Mannschaft mit bester Fifa-Weltranglistenplatzierung aus jeder Gruppe der EM

SELECT mannschaft.land AS Mannschaft, gruppe.gruppen_Name AS Gruppe, mannschaft.fifaWeltrangliste AS FIFAWeltrangliste 
FROM mannschaft 
JOIN gruppe 
ON gruppe.mannschaft1ID = mannschaft.mannschaftID 
ORDER BY gruppe.gruppen_Name ASC;