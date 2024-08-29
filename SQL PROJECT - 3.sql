#In the Inventory of a pharmacy 'Spot Rx' the quantity of medicine is considered ‘HIGH QUANTITY’
# when the quantity exceeds 7500 and ‘LOW QUANTITY’ when the quantity falls short of 1000. The discount is considered
# “HIGH” if the discount rate on a product is 30% or higher, and the discount is considered “NONE” when the discount rate on a product is 0%.
# 'Spot Rx' needs to find all the Low quantity products with high discounts and all the high-quantity products with no discount
# so they can adjust the discount rate according to the demand. 
#Write a query for the pharmacy listing all the necessary details relevant to the given requirement.
#Hint: Inventory is reflected in the Keep table.
(#To address the query, need to retrieve data from the PharmacyInventory table for the pharmacy 'Spot Rx')

create database problem3;
CREATE TABLE Pharmacy (
    pharmacyID INT PRIMARY KEY,
    pharmacyName VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    addressID INT NOT NULL
);
INSERT INTO Pharmacy (pharmacyID, pharmacyName, phone, addressID)
VALUES (1145, 'Spot Rx', '2698484690', 700135);

CREATE TABLE PharmacyInventory (
    pharmacyID INT,
    medicineID INT,
    quantity INT,
    discount INT
);
INSERT INTO PharmacyInventory (pharmacyID, medicineID, quantity, discount) VALUES
(1145, 29032, 5133, 20),
(1145, 26596, 9110, 30),
(1145, 50294, 9066, 10),
(1145, 15262, 1616, 0),
(1145, 15245, 4084, 0),
(1145, 37803, 4824, 0),
(1145, 48736, 3175, 30),
(1145, 25132, 321, 30),
(1145, 42541, 6266, 0),
(1145, 866, 8059, 30),
(1145, 15687, 680, 30),
(1145, 52348, 8587, 10),
(1145, 30655, 9148, 30),
(1145, 17358, 8038, 30),
(1145, 6346, 1800, 30),
(1145, 28536, 7687, 10),
(1145, 51375, 6123, 0),
(1145, 50737, 7387, 0),
(1145, 30166, 5990, 20),
(1145, 38925, 6477, 20),
(1145, 39637, 5645, 10),
(1145, 11557, 9111, 10),
(1145, 14131, 6133, 30),
(1145, 23511, 8134, 20),
(1145, 28398, 7386, 10),
(1145, 9071, 8409, 30),
(1145, 23748, 4308, 0),
(1145, 42847, 2004, 20),
(1145, 44542, 4264, 10),
(1145, 8796, 5794, 10),
(1145, 49993, 6973, 0),
(1145, 51276, 4192, 0),
(1145, 50398, 6189, 30),
(1145, 43913, 1465, 20),
(1145, 50442, 8289, 30),
(1145, 42865, 8800, 10),
(1145, 49563, 2132, 10),
(1145, 15404, 6796, 10),
(1145, 2791, 8924, 0),
(1145, 15575, 6346, 30),
(1145, 9578, 2057, 30),
(1145, 16715, 4402, 20),
(1145, 39230, 1779, 30),
(1145, 10415, 5217, 0),
(1145, 3654, 3540, 20),
(1145, 1562, 4338, 30),
(1145, 18133, 3902, 10),
(1145, 26274, 2734, 20),
(1145, 27703, 2950, 30),
(1145, 15910, 2748, 20),
(1145, 12484, 4522, 30),
(1145, 36558, 5753, 10),
(1145, 574, 7080, 30),
(1145, 38394, 9123, 30),
(1145, 45515, 8461, 10),
(1145, 33995, 5670, 0),
(1145, 3846, 4370, 0),
(1145, 32075, 4665, 30),
(1145, 17049, 2332, 0),
(1145, 32313, 9495, 0),
(1145, 28916, 4753, 20),
(1145, 3498, 6078, 20),
(1145, 39152, 8934, 10),
(1145, 23020, 5984, 10),
(1145, 28232, 3982, 30),
(1145, 23232, 4734, 20),
(1145, 50031, 8094, 0),
(1145, 34402, 5634, 0),
(1145, 14866, 5587, 20),
(1145, 19451, 9148, 10),
(1145, 24404, 5624, 0),
(1145, 17379, 4180, 10);

#and classify the medicines based on the quantity and discount criteria specified. Specifically,  need to find:
#Low quantity products with high discounts: These are products where the quantity is less than 1000 and the discount is 30% or higher.
#High quantity products with no discount: These are products where the quantity exceeds 7500 and the discount is 0%.
#(above 75000 - high quantity so discount = zero "0"
#below 1000 - low quantity and discount - 30%)

SELECT
    p.pharmacyID,
    p.pharmacyName,
    i.medicineID,
    i.quantity,
    i.discount
FROM
    Pharmacy p
JOIN
    PharmacyInventory i
    ON p.pharmacyID = i.pharmacyID
WHERE
    p.pharmacyName = 'Spot Rx'
    AND (
        (i.quantity < 1000 AND i.discount >= 30)  -- Low quantity with high discount
        OR
        (i.quantity > 7500 AND i.discount = 0)    -- High quantity with no discount
    );

#Explanation:
#Join Condition: The JOIN clause links the Pharmacy and PharmacyInventory tables using the pharmacyID column.
#Filtering by Pharmacy: We use WHERE p.pharmacyName = 'Spot Rx' to ensure we're only looking at data for the pharmacy 'Spot Rx'.
#Conditional Filtering:
#(i.quantity < 1000 AND i.discount >= 30) finds medicines with low quantity and high discount.
#(i.quantity > 7500 AND i.discount = 0) finds medicines with high quantity and no discount.






