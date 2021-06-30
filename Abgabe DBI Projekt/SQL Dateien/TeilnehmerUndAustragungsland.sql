use em2020_melmer_paulweber;

-- Liefert Länder, die an der EM teilnehmen und Austragungsland von Spielen sind

SELECT mannschaft.land AS Mannschaft 
FROM mannschaft 
JOIN spielort 
ON mannschaft.land = spielort.land;