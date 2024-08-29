#we need to create a SQL query that converts the 
#productType from a numerical value to a descriptive word
#and filters the medicines based on specific tax criteria. 
#inserting data, and querying the data as per the requirements

#1.First, create the database and table Medicine with the provided structure.
CREATE DATABASE PharmacyDB;
USE PharmacyDB;
#Insert the provided rows of data into the Medicine table.
CREATE TABLE Medicine (
   medicineID         INTEGER PRIMARY KEY,
   companyName        VARCHAR(101),
   productName        VARCHAR(174),
   description        VARCHAR(161),
   substanceName      VARCHAR(255),
   productType        INTEGER,
   taxCriteria        VARCHAR(3),
   hospitalExclusive  VARCHAR(1),
   governmentDiscount VARCHAR(1),
   taxImunity         VARCHAR(1),
   maxPrice           NUMERIC(9,2)
);
INSERT INTO Medicine(medicineID, companyName, productName, description, substanceName, productType, taxCriteria, hospitalExclusive, governmentDiscount, taxImunity, maxPrice) VALUES
(1, 'MARJAN INDUSTRIA E COMERCIO LTDA', 'OSTENAN', '10 MG COMP REV CX COM 30', 'ALENDRONATO DE SODIO TRI-HIDRATADO', 4, 'N', 'N', 'N', 'N', 76.44),
(2, 'MARJAN INDUSTRIA E COMERCIO LTDA', 'OSTENAN', '10 MG COMP REV CX COM 15', 'ALENDRONATO DE SODIO TRI-HIDRATADO', 4, 'N', 'N', 'N', 'N', 38.39),
(3, 'LIBRA COMERCIO DE PRODUTOS FARMACEUTICOS LTDA', 'TEICOPLANINA', '400 MG PO LIOFILIZADO SOL INJ CX C/ 1 FR/AMP X 3 M', 'NC/NI', 1, 'I', 'N', 'N', 'N', 296.38),
(4, 'MARJAN INDUSTRIA E COMERCIO LTDA', 'AMBROTEN', 'XPE ADU FR COM 100ML', 'ambroxol', 4, 'N', 'N', 'N', 'N', 12.88),
(5, 'LIBRA COMERCIO DE PRODUTOS FARMACEUTICOS LTDA', 'OXALIPLATINA', '50 MG PO LIOFILIZADO FR/AMP X 500 MG', 'NC/NI', 1, 'I', 'N', 'N', 'N', 1186.81),
(9, 'LIBRA COMERCIO DE PRODUTOS FARMACEUTICOS LTDA', 'MEGASTROL', '160 MG COMP CX C/ 3 BL C/ 10 COMP', 'NC/NI', 4, 'I', 'N', 'N', 'N', 3.07),
(10, 'LIBRA COMERCIO DE PRODUTOS FARMACEUTICOS LTDA', 'METOTREXATO', '25 MG/ML SOL INJ CX C/ 1 FR/AMP 20 ML', 'NC/NI', 4, 'I', 'N', 'N', 'N', 154.65),
(11, 'LIBRA COMERCIO DE PRODUTOS FARMACEUTICOS LTDA', 'TEICOPLANINA', '200 MG PO LIOFILIZADO SOL INJ CX C/ 1 FR/AMP X 3 M', 'NC/NI', 1, 'I', 'N', 'N', 'N', 148.46),
(12, 'LIBRA COMERCIO DE PRODUTOS FARMACEUTICOS LTDA', 'OXALIPLATINA', '100 MG PO LIOFILIZADO FR/AMP X 1000 MG', 'NC/NI', 1, 'I', 'N', 'N', 'N', 2373.63),
(13, 'LIBRA COMERCIO DE PRODUTOS FARMACEUTICOS LTDA', 'SULBACTAM SODICO + AMPICILINA SODICA', '1 G + 2 G CT FR AMP VD INC', 'NC/NI', 4, 'II', 'N', 'N', 'N', 29.59),
(14, 'LIBRA COMERCIO DE PRODUTOS FARMACEUTICOS LTDA', 'PACLITAXEL', '6 MG/ML SOL INJ CT FR/AMP X 50 ML', 'NC/NI', 1, 'I', 'N', 'N', 'N', 4122.12),
(15, 'LIBRA COMERCIO DE PRODUTOS FARMACEUTICOS LTDA', 'PACLITAXEL', '6 MG/ML SOL INJ CX C/ 1 FR/AMP X 17 ML', 'NC/NI', 1, 'I', 'N', 'N', 'N', 1388.75),
(16, 'LIBRA COMERCIO DE PRODUTOS FARMACEUTICOS LTDA', 'PACLITAXEL', '6 MG/ML SOL INJ CX C/ 1 FR/AMP X 5 ML', 'NC/NI', 4, 'I', 'N', 'N', 'N', 417.13),
(19, 'MARJAN INDUSTRIA E COMERCIO LTDA', 'GLIMESEC', '02MG COMP REV CX COM 30', 'glimepirida', 4, 'N', 'N', 'N', 'N', 26.95),
(20, 'LIBRA COMERCIO DE PRODUTOS FARMACEUTICOS LTDA', 'METOTREXATO', '500 MG PO LIOFILIZADO CX C/ 01 FR/AMP', 'NC/NI', 4, 'I', 'N', 'N', 'N', 154.63),
(22, 'SANOFI MEDLEY FARMACEUTICA LTDA.', 'GRAMCILINA', '500 MG CAP CX C/ FR C/ 8', 'ampicilina sodica', 4, 'I', 'N', 'N', 'N', 5.57),
(23, 'LUPER INDUSTRIA FARMACEUTICA LTDA', 'ALCAFLOR', 'C/100 DRAGEAS', 'NC/NI', 9, 'N', 'N', 'N', 'N', 17.9),
(24, 'SANOFI MEDLEY FARMACEUTICA LTDA.', 'AMPICIL', '500 MG INJ CX C/25 FA EMB MULT', 'ampicilina sodica', 4, 'I', 'N', 'N', 'N', 84.12),
(25, 'SANOFI MEDLEY FARMACEUTICA LTDA.', 'FACYL 500', '500MG COMP REV CX C/100', 'tinidazol', 4, 'N', 'N', 'N', 'N', 33.33),
(26, 'SANOFI MEDLEY FARMACEUTICA LTDA.', 'AMPLOTAL', '1000 MG CX C/FA + DIL', 'ampicilina sodica|ampicilina benzatina', 4, 'II', 'N', 'N', 'N', 7.93),
(27, 'LUPER INDUSTRIA FARMACEUTICA LTDA', 'AMOXIBEL', '250 MG SUSPENSAO 150 ML', 'NC/NI', 4, 'I', 'N', 'N', 'N', 19.32),
(28, 'LUNDBECK BRASIL LTDA', 'LEXAPRO', '10 MG/ML SOL OR CT FR VD AMB CGT X 15 ML', 'oxalato de escitalopram', 5, 'I', 'N', 'N', 'N', 64.27),
(29, 'SANOFI MEDLEY FARMACEUTICA LTDA.', 'GRAMCILINA', '1G INJ CX C/ 1 FA + DIL 3 ML', 'ampicilina sodica', 4, 'I', 'N', 'N', 'N', 3.44),
(30, 'MARJAN INDUSTRIA E COMERCIO LTDA', 'RADAN', '300MG COMP REV CX COM 08', 'ranitidina', 4, 'N', 'N', 'N', 'N', 20.25),
(31, 'MARJAN INDUSTRIA E COMERCIO LTDA', 'RADAN', 'LIQ FR COM 100ML', 'ranitidina', 4, 'N', 'N', 'N', 'N', 18.03),
(32, 'SANOFI MEDLEY FARMACEUTICA LTDA.', 'FERROTRAT B12', 'FR C/ 200 ML', 'sulfato de manganes|sulfato cuprico|lisina|glicerofosfato de sodio|cloridrato de carnitina|citrato ferrico amoniacal|cianocobalamina', 6, 'N', 'N', 'N', 'N', 13.91),
(33, 'LABORATORIO ODALY SOARES LTDA', 'AG.OXIG', '1000ML.LIQ.FR.12 UN', 'NC/NI', NULL, 'NA', 'N', 'N', 'N', 1.33),
(34, 'LABORATORIO ODALY SOARES LTDA', 'AG.OXIG', '100ML.LIQ.FR.12 UN', 'NC/NI', NULL, 'NA', 'N', 'N', 'N', 0.73),
(37, 'LABORATORIO NEO QUIMICA COMERCIO E INDUSTRIA LTDA', 'VISAZUL', '0.5 MG/ML + 1.0 MG/ML + 0.025 MG/ML SOL OFT CT FR PLAS TRANS GOT X 20 ML', 'sulfato de berberina|fenolsulfonato de zinco|cloridrato de nafazolina', 4, 'N', 'N', 'N', 'N', 6.16),
(38, 'LABORATORIO NEO QUIMICA COMERCIO E INDUSTRIA LTDA', 'NEOQUIM', '200MG COMP REV CX C/ 10', 'NC/NI', 1, 'NA', 'N', 'N', 'N', 5.99),
(39, 'LABORATORIO NEO QUIMICA COMERCIO E INDUSTRIA LTDA', 'NEOQUIM', '200MG COMP REV CX C/ 30', 'NC/NI', 1, 'NA', 'N', 'N', 'N', 14.99);
#Query to Convert Product Type to Words and Filter Data
#To display the productType as words and filter the medicines based on tax criteria, 
#This query will select medicines based on the specified conditions and convert the productType to a descriptive word.

#1)Convert Numerical Product Types to Words:
#We need to translate the numerical productType values into words. 
#For example, 1 should be converted to Generic, 2 to Patent, and so on.

#2)Filter Medicines Based on Tax Criteria:
#Medicines need to be filtered based on their taxCriteria and productType.
#For tax category I: Show medicines where the productType is 1 (Generic), 2 (Patent), or 3 (Reference).
#For tax category II: Show medicines where the productType is 4 (Similar), 5 (New), or 6 (Specific)

SELECT 
    medicineID,
    companyName,
    productName,
    description,
    substanceName,
    CASE 
        WHEN productType = 1 THEN 'Generic'
        WHEN productType = 2 THEN 'Patent'
        WHEN productType = 3 THEN 'Reference'
        WHEN productType = 4 THEN 'Similar'
        WHEN productType = 5 THEN 'New'
        WHEN productType = 6 THEN 'Specific'
        WHEN productType = 7 THEN 'Biological'
        WHEN productType = 8 THEN 'Dinamized'
        ELSE 'Unknown'
    END AS productType,
    taxCriteria,
    hospitalExclusive,
    governmentDiscount,
    taxImunity,
    maxPrice
FROM 
    Medicine
WHERE 
    (taxCriteria = 'I' AND productType IN (1, 2, 3)) 
    OR 
    (taxCriteria = 'II' AND productType IN (4, 5, 6));
    
    #Explanation
#CREATE DATABASE & TABLE: We create a new database PharmacyDB and a table Medicine with the structure defined.
#INSERT INTO Medicine: Insert the provided rows into the Medicine table.
#Translates the productType numeric values into descriptive words.
#Filters medicines based on taxCriteria and productType:
#If taxCriteria is 'I', include medicines with productType of 1, 2, or 3.
#If taxCriteria is 'II', include medicines with productType of 4, 5, or 6.
#This approach ensures that the medicines are displayed with readable product types and filtered according to the specified tax criteria.