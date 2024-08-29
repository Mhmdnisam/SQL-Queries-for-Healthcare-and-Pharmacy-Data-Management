#Mack, From HealthDirect Pharmacy, wants to get a list of all the affordable and costly, hospital-exclusive medicines in the database. 
#Where affordable medicines are the medicines that have a maximum price of less than 50% of the avg maximum price of all the medicines in the database,
#afordable medicines = max price of lesthan 50% avg maxm price of all medicines
#and costly medicines are the medicines that have a maximum price of more than double the avg maximum price of all the medicines in the database. 
#costly medicines = max price of morethan double avg maxm price of all medicines
#Mack wants clear text next to each medicine name to be displayed that identifies the medicine as affordable or costly. 
#The medicines that do not fall under either of the two categories need not be displayed.
#Write a SQL query for Mack for this requirement.

create database problem4;
use problem4;
CREATE TABLE Pharmacy (
    pharmacyID INT PRIMARY KEY,
    pharmacyName VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    addressID INT NOT NULL
);
INSERT INTO Pharmacy (pharmacyID, pharmacyName, phone, addressID)
VALUES (2301, 'HealthDirect', '7655039543', 531383);
 
 CREATE TABLE medicines (
    medicineID INT PRIMARY KEY,
    companyName VARCHAR(255),
    productName VARCHAR(255),
    description TEXT,
    substanceName TEXT,
    productType INT,
    taxCriteria CHAR(1),
    hospitalExclusive CHAR(1),
    governmentDiscount CHAR(1),
    taxImunity CHAR(1),
    maxPrice DECIMAL(10, 2)
);

ALTER TABLE medicines
MODIFY COLUMN taxCriteria VARCHAR(10);
SELECT taxCriteria, LENGTH(taxCriteria) 
FROM medicines 
WHERE LENGTH(taxCriteria) > 1;
INSERT INTO medicines (medicineID, companyName, productName, description, substanceName, productType, taxCriteria, hospitalExclusive, governmentDiscount, taxImunity, maxPrice) VALUES
(36140, 'ariston industrias quimicas e farmaceuticas ltda', 'CEFTAZIDON', '1000 MG PO INJ CX 100 FA VD INC (EMB HOSP)', 'ceftazidima pentahidratada', 4, 'I', 'S', 'N', 'N', 3501.90),
(47980, 'CRISTALIA PRODUTOS QUIMICOS FARMACEUTICOS LTDA.', 'QUERA LP', '1.50MG COM LIB PROL CT BL AL AL X 30', 'dicloridrato de pramipexol', 4, 'I', 'N', 'N', 'N', 175.07),
(8776, 'ZYDUS NIKKHO FARMACEUTICA LTDA', 'ZOLDAC', '2 MG COM CT STRIP AL/AL X 30', 'alprazolam', 4, 'I', 'N', 'N', 'N', 21.73),
(49600, 'BIOSINTETICA FARMACEUTICA LTDA', 'CETOPROFENO', '100MG COM REV LIB RETARD CT BL AL PLAS TRANS X 20', 'cetoprofeno', 1, 'I', 'N', 'N', 'N', 26.75),
(21985, 'TORRENT DO BRASIL LTDA', 'ECATOR', '5.0 MG CAP GEL DURA CT BL AL/AL X 30', 'ramipril', 4, 'I', 'N', 'N', 'N', 68.07),
(50443, 'CELLERA FARMACEUTICA S.A.', 'levofloxacino hemihidratado', '500 MG COM REV CT BL AL PLAS TRANS X 10', 'levofloxacino hemi-hidratado|LEVOFLOXACINO HEMIIDRATADO', 1, 'I', 'N', 'N', 'N', 92.03),
(10826, 'Hypera S.A.', 'MALEATO DE DEXCLORFENIRAMINA + SULFATO DE PSEUDOEFEDRINA + GUAIFENESINA', '0.4 MG/ML + 4 MG/ML + 20 MG/ML SOL OR CT FR PLAS AMB X 120 ML', 'sulfato de pseudoefedrina|maleato de dexclorfeniramina|guaifenesina', 1, 'N', 'N', 'N', 'N', 12.45),
(30000, 'PRATI DONADUZZI & CIA LTDA', 'DIPROPIONATO DE BETAMETASONA + ACIDO SALICILICO', '0.5 MG/G + 30 MG/G POM DERM CT BG PLAS OPC X 30 G', 'acido salicilico|dipropionato de betametasona', 1, 'N', 'N', 'N', 'N', 9.00),
(24347, 'MANTECORP INDUSTRIA QUIMICA E FARMACEUTICA S.A.', 'CELESTONE', '4 MG/ML SOL INJ CT CAMA AMP VD INC X 1 ML', 'betametasona', 5, 'I', 'N', 'N', 'N', 5.59),
(53274, 'Ache Laboratorios Farmaceuticos S.A', 'omeprazol', '20 MG CAP GEL DURA MICROG CT FR PLAS OPC X 28', 'OMEPRAZOL MICROGRANULADOS', 1, 'I', 'N', 'N', 'N', 48.32),
(16105, 'VITAMEDIC INDUSTRIA FARMACEUTICA LTDA', 'ERITROVIT', '250MG/5ML CX C/ 01 VD 50ML SUSP', 'estolato de eritromicina', NULL, 'I', 'N', 'N', 'N', 20.79),
(31439, 'MERCK S/A', 'GLIOTEN', '2.5 MG COM REV EST CART BL AL/AL X 30', 'maleato de enalapril', 4, 'I', 'N', 'N', 'N', 12.14),
(51069, 'TORRENT DO BRASIL LTDA', 'TOARIP', '15 MG COM CT BL AL/AL X 10', 'aripiprazol', 4, 'I', 'N', 'N', 'N', 283.09),
(46495, 'NATIVITA IND. COM. LTDA.', 'PERMENATI', '10 MG/ML LOC CT 160 FR PLAS OPC X 60 ML (EMB HOSP)', 'permetrina', 4, 'N', 'S', 'N', 'N', 1921.50),
(36213, 'LABORATORIO TEUTO BRASILEIRO S/A', 'LIPTHAL', '10 MG COM REV CT BL AL/AL X 60', 'atorvastatina calcica', 4, 'I', 'N', 'S', 'N', 127.95),
(18072, 'GUERBET PRODUTOS RADIOLOGICOS LTDA', 'HENETIX', '350 MG/ML SOL INJ CT FA VD INC X 100 ML', 'iobitridol', 4, 'I', 'S', 'N', 'N', 355.74),
(4613, 'EUROFARMA LABORATORIOS S.A.', 'VASATIV', '100 MG COM CT BL AL PLAS INC X 15', 'cilostazol', 4, 'I', 'N', 'N', 'N', 11.04),
(27874, 'LABORATORIOS PFIZER LTDA', 'MYLANTA DE BOLSO', '550 MG + 110 MG CARTUCHO COM 4 COMPRIMIDOS MASTIGAVEIS MENTA GELADA', 'hidroxido de magnesio|carbonato de calcio', 5, 'N', 'N', 'N', 'N', 1.57),
(29962, 'EMS S/A', 'CLOR. AMBROXOL', 'XPE INF FR C/ 120ML', 'cloridrato de ambroxol', 1, 'N', 'N', 'N', 'N', 6.23),
(37755, 'SANOFI-AVENTIS FARMACEUTICA LTDA', 'NOVALGINA', '500 MG/ML SOL OR CT BG PLAS OPC GOT X 10 ML', 'DIPIRONA MONOIDRATADA', 5, 'N', 'N', 'N', 'N', 8.17),
(15892, 'GERMED FARMACEUTICA LTDA', 'ALPRAZOLAM', '0.5 MG COM CT BL AL PLAS INC X 30', 'alprazolam', 1, 'I', 'N', 'N', 'N', 15.76),
(27231, 'MEDQUIMICA INDUSTRIA FARMACEUTICA LTDA.', 'IODOFLUX', 'VD. C/ 100ML', 'iodeto de potassio', NULL, 'N', 'N', 'N', 'N', 8.13),
(5597, 'PRATI DONADUZZI & CIA LTDA', 'AMOXICILINA', '500 MG CAP GEL DURA CT BL AL PLAS INC X 12', 'amoxicilina', 1, 'I', 'N', 'N', 'N', 20.68),
(50182, 'DAIICHI SANKYO BRASIL FARMACEUTICA LTDA', 'Lixiana', '60 MG COM REV CT BL AL AL X 14', 'edoxabana', 5, 'N', 'N', 'N', 'N', 117.32),
(30746, 'EMS S/A', 'SULFA+TRI', 'SUSP 50ML-LG', 'trimetoprima|sulfametoxazol', 1, 'II', 'N', 'N', 'N', 2.98),
(8680, 'HERBARIUM LABORATORIO BOTANICO LTDA', 'XAROPE DE GUACO', '120 ML', 'NC/NI', 9, 'N', 'N', 'N', 'N', 7.81),
(21731, 'ROYTON QUIMICA FARMACEUTICA LTDA', 'CIPROXAN', '500 MG COM REV CT BL AL PLAS INC X 6', 'ciprofloxacino', 4, 'I', 'N', 'N', 'S', 15.95),
(17630, 'HALEX ISTAR INDUSTRIA FARMACEUTICA SA', 'CEFAZOLINA SODICA', '1 G PO INJ CT 10 FA VD INC + 10 BOLS PP TRANS SIST FECH X 100 ML + CONECTOR (EMB HOSP)', 'cefazolina sodica', 1, 'I', 'S', 'N', 'N', 479.90),
(40644, 'GEOLAB INDUSTRIA FARMACEUTICA S/A', 'BIMAGAN', '0.3 MG/ML SOL OFT CX 50 FR GOT PLAS OPC X 3 ML', 'bimatoprosta', 4, 'I', 'N', 'S', 'N', 4047.04),
(9436, 'ACCORD FARMACEUTICA LTDA', 'HYTAS', '100 MG/ ML SOL INJ FA VD INC X 10 ML', 'metotrexato', 4, 'I', 'S', 'N', 'N', 264.04),
(50167, 'BIOLAB SANUS FARMACEUTICA LTDA', 'DOSS', '50000 UI CAP MOLE CT BL AL PLAS TRANS X 12', 'colecalciferol', 6, 'N', 'N', 'N', 'N', 587.29),
(52765, 'MULTILAB INDUSTRIA E COMERCIO DE PRODUTOS FARMACEUTICOS LTDA', 'CEFALEXINA MONOIDRATADA', '500 MG COM REV CT BL AL PLAS LEIT X 40', 'cefalexina monoidratada', 1, 'I', 'N', 'N', 'N', 81.84),
(33726, 'LABORATORIO GLOBO LTDA', 'GLICAMIDA', '5MG COMP BL CX C/30', 'glibenclamida', 4, 'I', 'N', 'N', 'N', 4.41),
(21935, 'ROYTON QUIMICA FARMACEUTICA LTDA', 'ANTIFEBRIN', '100 MG COM CT ENV KRAFT X 200', 'acido acetilsalicilico', 4, 'N', 'N', 'N', 'N', 17.42),
(29229, 'BIOSINTETICA FARMACEUTICA LTDA', 'PANTOPEPT', '20 MG/ML + 20 MG/ML SOL OR CT FR VD AMB X 30 ML', 'pepsina', 4, 'II', 'N', 'N', 'N', 4.28),
(5598, 'PRATI DONADUZZI & CIA LTDA', 'AZITROMICINA', '500 MG COM REV CT BL AL PLAS INC X 80 (EMB HOSP)', 'azitromicina di-hidratada|azitromicina', 1, 'I', 'S', 'N', 'N', 301.45),
(38303, 'ariston industrias quimicas e farmaceuticas ltda', 'CEFALOTINA SODICA', '1000 MG PO INJ CT 50 FA VD INC', 'cefalotina sodica', 1, 'I', 'S', 'N', 'N', 179.59),
(435, 'NEOLATINA COMERCIO E INDUSTRIA FARMACEUTICA S.A', 'DICLONACO', '50 MG COM REV CT 25 BL AL PLAS INC X 20 (EMB. HOSP.)', 'diclofenaco sodico|diclofenaco', 4, 'I', 'N', 'N', 'N', 152.58),
(12944, 'LABORATIL FARMACEUTICA LTDA', 'FLEXDOR', '35 MG + 300 MG + 50 MG COM CT 10 STR AL X 10', 'citrato de orfenadrina|cafeina|DIPIRONA MONOIDRATADA', 4, 'N', 'N', 'N', 'N', 60.18),
(11448, 'CRISTALIA PRODUTOS QUIMICOS FARMACEUTICOS LTDA.', 'FENOCRIS', '100 MG COM CX BL AL PLAS INC X 200 (EMB HOSP)', 'fenobarbital', 4, 'I', 'S', 'N', 'N', 45.75),
(12113, 'BEKER PRODUTOS FARMACO HOSPITALARES LTDA', 'CLORETO DE SODIO BEKER', '9 MG/ML SOL INJ CX 50 BOLS PVC TRANS FLEX SIST FECH X 250 ML', 'cloreto de sodio', 6, 'III', 'S', 'N', 'N', 247.65),
(41000, 'EQUIPLEX INDUSTRIA FARMACEUTICA LTDA', 'SOLUCAO DE CLORETO DE POTASSIO', '150 MG/ML SOL INJ IV CX 200 AMP PE X 10 ML', 'cloreto de potassio', 4, 'III', 'S', 'N', 'N', 71.23),
(45953, 'CRISTALIA PRODUTOS QUIMICOS FARMACEUTICOS LTDA.', 'MOFECELL', '500 MG COM REV CT BL AL PLAS TRANS X 30', 'micofenolato de mofetila', 4, 'I', 'N', 'S', 'S', 433.95),
(39982, 'WYETH INDUSTRIA FARMACEUTICA LTDA', 'DUOQUEL', '100 MG COM REV CT BL AL PVC OPC X 14', 'hemifumarato de quetiapina', 4, 'I', 'N', 'N', 'N', 115.60);

#To find the affordable and costly hospital-exclusive medicines based on the criteria provided
#To calculates the average maximum price of all medicines, 
#Then classifies medicines as either affordable or costly based on the conditions given.

#Explanation:
#AvgPrice CTE: Calculates the average maximum price of all medicines.
#CategorizedMedicines CTE:
#Classifies each medicine as 'Affordable' or 'Costly' based on its maxPrice relative to the average maximum price.
#Filters out medicines that are not hospital-exclusive.
#Final SELECT: Retrieves the medicines classified as either 'Affordable' or 'Costly' and displays their details.

WITH AvgPrice AS (
    SELECT AVG(maxPrice) AS avgMaxPrice
    FROM medicines
),
CategorizedMedicines AS (
    SELECT
        m.medicineID,
        m.companyName,
        m.productName,
        m.description,
        m.substanceName,
        m.productType,
        m.taxCriteria,
        m.hospitalExclusive,
        m.governmentDiscount,
        m.taxImunity,
        m.maxPrice,
        CASE
            WHEN m.maxPrice < 0.5 * (SELECT avgMaxPrice FROM AvgPrice) THEN 'Affordable'
            WHEN m.maxPrice > 2 * (SELECT avgMaxPrice FROM AvgPrice) THEN 'Costly'
            ELSE NULL
        END AS priceCategory
    FROM medicines m
    WHERE m.hospitalExclusive = 'S'
)
SELECT
    cm.medicineID,
    cm.companyName,
    cm.productName,
    cm.description,
    cm.substanceName,
    cm.productType,
    cm.taxCriteria,
    cm.hospitalExclusive,
    cm.governmentDiscount,
    cm.taxImunity,
    cm.maxPrice,
    cm.priceCategory
FROM CategorizedMedicines cm
WHERE cm.priceCategory IS NOT NULL;


