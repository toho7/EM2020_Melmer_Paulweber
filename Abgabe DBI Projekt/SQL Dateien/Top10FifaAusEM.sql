use em2020_melmer_paulweber;

-- Liefert Mannschaften aus Top 10 der FifaWeltrangliste die bei der EM teilnehmen

SELECT mannschaft.fifaWeltrangliste AS FifaWeltrangliste, mannschaft.land AS Mannschaft 
FROM mannschaft 
WHERE mannschaft.fifaWeltrangliste <= 10 
ORDER BY mannschaft.fifaWeltrangliste