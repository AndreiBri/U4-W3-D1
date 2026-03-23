-- 1. Estrai tutti i clienti con nome Mario
SELECT *
FROM clienti
WHERE nome = 'Mario';


-- 2. Estrarre il nome e il cognome dei clienti nati nel 1982
SELECT nome, cognome
FROM clienti
WHERE anno_di_nascita = 1982;


-- 3. Estrarre il numero delle fatture con IVA al 20%
SELECT COUNT(*) AS numero_fatture_iva_20
FROM fatture
WHERE iva = 20.00;


-- 4. Estrarre i prodotti attivati nel 2017 che sono in produzione oppure in commercio
SELECT *
FROM prodotti
WHERE EXTRACT(YEAR FROM data_attivazione) = 2017
  AND (in_produzione = TRUE OR in_commercio = TRUE);


-- -- 5. Estrarre le fatture con importo inferiore a 1000 e i dati dei clienti collegati
-- SELECT
--     f.numero_fattura,
--     f.tipologia,
--     f.importo,
--     f.iva,
--     f.data_fattura,
--     c.numero_cliente,
--     c.nome,
--     c.cognome,
--     c.anno_di_nascita,
--     c.regione_residenza
-- FROM fatture f
-- JOIN clienti c ON f.id_cliente = c.numero_cliente
-- WHERE f.importo < 1000;

SELECT *
FROM fatture f
JOIN clienti c ON f.id_cliente = c.numero_cliente
WHERE f.importo < 1000;


-- 6. Elenco delle fatture (numero, importo, iva, data) con il nome del fornitore
SELECT
    f.numero_fattura,
    f.importo,
    f.iva,
    f.data_fattura,
    fo.denominazione AS nome_fornitore
FROM fatture f
JOIN fornitori fo ON f.numero_fornitore = fo.numero_fornitore;


-- 7. Considerando solo le fatture con IVA al 20%,
--    conteggio fatture per ogni anno
SELECT
    EXTRACT(YEAR FROM data_fattura) AS anno,
    COUNT(*)                        AS numero_fatture
FROM fatture
WHERE iva = 20.00
GROUP BY anno
ORDER BY anno;


-- 8. Numero di fatture e somma degli importi divisi per anno di fatturazione
SELECT
    EXTRACT(YEAR FROM data_fattura) AS anno,
    COUNT(*)                        AS numero_fatture,
    SUM(importo)                    AS totale_importi
FROM fatture
GROUP BY anno
ORDER BY anno;
