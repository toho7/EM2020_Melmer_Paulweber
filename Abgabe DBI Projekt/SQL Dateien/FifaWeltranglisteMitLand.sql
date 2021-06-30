use em2020_melmer_paulweber;

-- Liefert Fifa-Weltrangliste mit Land 

SELECT mannschaft.land AS Mannschaft, mannschaft.fifaWeltrangliste AS FifaWeltrangliste 
FROM mannschaft 
ORDER BY mannschaft.fifaWeltrangliste;