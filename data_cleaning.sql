CREATE OR REPLACE TABLE landing_data.stg_pricehistory AS

WITH import_pricehistory AS (
  SELECT
   SAFE.PARSE_DATE('%d/%m/%Y', date) AS date
  ,item_code AS item_code
  ,item_description
  ,doc_no
  ,TRIM(area) AS Area
  ,TRIM(company) AS company
  ,CASE
    WHEN TRIM(sub_total) LIKE '(%)' THEN 
    SAFE_CAST('-' || REGEXP_REPLACE(sub_total, r'[(),]', '') AS FLOAT64)
    ELSE 
    SAFE_CAST(REPLACE(sub_total, ',', '') AS FLOAT64)
      END AS cleaned_subtotal
  ,CAST(REPLACE(qty, ',', '') AS FLOAT64) AS cleaned_quantity
  FROM 
  raw_data.bronze_transaction
  WHERE item_code IS NOT NULL
)

,mapped_pricehistory AS (
  SELECT
    date
   ,item_code
   ,item_description
   ,doc_no
   ,cleaned_quantity
   ,cleaned_subtotal
   ,CASE 
      WHEN UPPER(Area) = 'SELANGOR' THEN 'Unspecified (Selangor)'
      WHEN UPPER(Area) = 'JOHOR' THEN 'Unspecified (Johor)'
      WHEN UPPER(Area) = 'PENANG' THEN 'Unspecified (Penang)'
      WHEN UPPER(Area) = 'PERAK' THEN 'Unspecified (Perak)'
      WHEN UPPER(Area) = 'PAHANG' THEN 'Unspecified (Pahang)'
      WHEN UPPER(Area) = 'MELAKA' THEN 'Unspecified (Melaka)'
      WHEN UPPER(Area) IN ('NEGERISEM', 'NEGERI SEMBILAN') THEN 'Unspecified (Negeri Sembilan)'
      WHEN UPPER(Area) = 'KEDAH' THEN 'Unspecified (Kedah)'
      WHEN UPPER(Area) = 'KELANTAN' THEN 'Unspecified (Kelantan)'
      WHEN UPPER(Area) = 'TERENGGANU' THEN 'Unspecified (Terengganu)'
      WHEN UPPER(Area) = 'SABAH' THEN 'Unspecified (Sabah)'
      WHEN UPPER(Area) = 'SARAWAK' THEN 'Unspecified (Sarawak)'
      WHEN Area = '----' AND (UPPER(company) LIKE '%SHOPEE%' OR UPPER(company) LIKE '%YORU%') THEN 'Shopee'
      WHEN Area = '----' THEN 'Unknown'
      WHEN Area IS NULL THEN 'Unknown'      
      ELSE Area 
    END AS district
   ,CASE
      WHEN UPPER(Area) IN ('PUCHONG', 'PANDAN JAY', 'PJ', 'SEMENYIH', 'SEPANG', 'KAJANG', 'KLANG', 'BDR BARU B'
      ,'AMPANG', 'SHAH ALAM', 'SUBANG JAY', 'JENJAROM', 'SERI KEMBA', 'BALAKONG', 'BATU CAVES', 'PANDAN IND', 'GOMBAK'
      ,'RAWANG', 'BANTING', 'SG. BULOH', 'CYBERJAYA', 'DAMANSARA', 'SERENDAH', 'HULU LANGA', 'K.LANGAT', 'SELANGOR') 
      THEN 'Selangor'
      WHEN UPPER(Area) IN ('KL', 'CHERAS', 'SRI HARTAM', 'KEPONG', "MON'T KIAR", 'KUCHAI LAM', 'KELANG LAM', 
      'WANGSA MAJ', 'BANGSAR', 'BUKIT JALI', 'SOLARIS DU', 'JALAN IPOH', 'S.PETALING', 'SEGAMBUT', 'SENTUL') 
      THEN 'Kuala Lumpur'
      WHEN UPPER(Area) IN ('JOHOR BAHR', 'ULU TIRAM', 'SKUDAI', 'SEGAMAT', 'MUAR', 'PASIR GUDA', 'BATU PAHAT', 'SENAI'
      , 'JOHOR') THEN 'Johor'
      WHEN UPPER(Area) IN ('SEREMBAN', 'MANTIN', 'NILAI', 'NEGERISEM') THEN 'Negeri Sembilan'
      WHEN UPPER(Area) IN ('IPOH', 'PARIT BUNT', 'TELUK INTA', 'SERI MANJU', 'HUTAN MELI', 'PERAK') THEN 'Perak'
      WHEN UPPER(Area) IN ('PRAI', 'BKT MERTAJ', 'BUTTERWORT', 'B MAUNG', 'PENANG') THEN 'Penang'
      WHEN UPPER(Area) IN ('A.SETAR', 'S.PETANI') THEN 'Kedah'
      WHEN UPPER(Area) IN ('ALOR GAJAH', 'MASJID TAN', 'MELAKA') THEN 'Melaka'
      WHEN UPPER(Area) IN ('RAUB', 'GENTING', 'PAHANG') THEN 'Pahang'
      WHEN UPPER(Area) IN ('KEMAMAN', 'TERENGGANU') THEN 'Terengganu'
      WHEN UPPER(Area) IN ('TAWAU', 'KOTA KINAB', 'SANDAKAN', 'SABAH') THEN 'Sabah'
      WHEN UPPER(Area) IN ('BINTULU', 'SIBU', 'KUCHING', 'MIRI', 'SARAWAK') THEN 'Sarawak'
      WHEN UPPER(Area) = 'PUTRAJAYA' THEN 'Putrajaya'
      WHEN UPPER(Area) = 'LABUAN' THEN 'Labuan'
      WHEN UPPER(Area) = 'KANGAR' THEN 'Perlis'
      WHEN UPPER(Area) = 'KELANTAN' THEN 'Kelantan'
      WHEN Area = '----' AND (UPPER(company) LIKE '%SHOPEE%' OR UPPER(company) LIKE '%YORU%') THEN 'Shopee'
      WHEN Area = '----' THEN 'Unknown'
      WHEN UPPER(Area) IN ('AZREEL', 'WAN') OR Area IS NULL THEN 'Unknown'
      ELSE 'Unknown'
      END AS state
      FROM import_pricehistory
)

,cleaned_pricehistory AS (
  SELECT
    date
   ,item_code
   ,item_description
   ,doc_no
   ,district
   ,state
   ,CAST(SUM(cleaned_quantity) AS INT64) AS quantity    
   ,SUM(cleaned_subtotal) AS subtotal
  FROM mapped_pricehistory
  GROUP BY
    date
   ,item_code
   ,item_description
   ,doc_no
   ,district
   ,state
);

CREATE OR REPLACE TABLE data_warehouse.gold_pricehistory AS

WITH import_sliver AS(
  SELECT
  ldsp.date,
  ldsp.item_code,
  cg.item_description as item_name,
  cg.main_category,
  cg.sub_category,
  ldsp.doc_no,
  ldsp.district,
  ldsp.state,
  ldsp.quantity,
  ldsp.subtotal
  FROM
  landing_data.stg_pricehistory ldsp
  LEFT JOIN
  raw_data.categorized_products cg
  ON 
  ldsp.item_code = cg.item_code
  AND
  ldsp.item_description = cg.item_description
)

SELECT * 
FROM import_sliver

SELECT * FROM cleaned_pricehistory;
