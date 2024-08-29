#'Ally Scripts' pharmacy company wants to find out the quantity of medicine prescribed in each of its prescriptions
#(ally pharmacyID - 3287) - Taked in pharmacy fldr
#Write a query that finds the sum of the quantity of all the medicines in a prescription and if the total quantity of medicine is 
#less than 20 tag it as “low quantity”. If the quantity of medicine is from 20 to 49 (both numbers including) tag it as
# “medium quantity“ and if the quantity is more than equal to 50 then tag it as “high quantity”.
#Show the prescription Id, the Total Quantity of all the medicines in that prescription, and the Quantity tag for all the prescriptions 
#issued by 'Ally Scripts'.
#3 rows from the resultant table may be as follows:
#prescriptionID	totalQuantity	Tag
#1147561399		43			Medium Quantity
#1222719376		71			High Quantity
#1408276190		48			Medium Quantity 


create database problem22;
CREATE TABLE prescriptions (
    prescriptionID BIGINT PRIMARY KEY,
    quantity INT
);
INSERT INTO prescriptions (prescriptionID, quantity) VALUES
(5392744734, 17),
(1747035717, 12),
(3186944335, 8),
(2660184745, 3),
(3060763958, 7),
(9970714937, 13),
(4246000902, 2),
(5309502649, 3),
(6645555285, 17),
(8509999048, 7),
(2198292866, 16),
(4474352358, 6),
(2579013842, 12),
(7435544711, 3),
(6643262432, 15),
(1142281664, 6),
(6861416690, 11),
(8604751579, 18),
(3958689351, 7),
(4119856056, 11),
(2577017253, 1),
(2350898318, 14),
(8522123324, 18),
(2321062163, 18),
(3390402397, 17),
(4135344913, 2),
(8146705600, 4),
(9154590511, 4),
(7353293364, 16),
(7270209658, 14),
(7274996157, 18),
(5743852786, 4),
(4884461649, 4),
(5788065225, 5),
(7005786677, 17),
(4571445011, 5),
(7188546572, 3),
(6814759039, 20),
(1650322652, 19),
(8103899289, 13),
(5711458980, 2),
(8590814922, 2),
(5990188602, 1),
(9611931130, 11),
(1791137362, 2),
(4157096117, 3),
(1672810020, 4),
(3754476305, 13),
(5617305703, 2),
(8308600666, 9),
(4037154711, 18),
(7724568710, 8),
(6885379081, 1);
INSERT INTO prescriptions (prescriptionID, quantity) VALUES
(3001976961, 4),
(3229249731, 16),
(5050002993, 14),
(4413656410, 2),
(5121064280, 14),
(3915913765, 8),
(9177077037, 13),
(9527473471, 18),
(5095903976, 6),
(7733620519, 6),
(4839295144, 11),
(2595538379, 7),
(5922668656, 17),
(5413486689, 15),
(9261119024, 19),
(8245898006, 12),
(8972543328, 15),
(4770391165, 18),
(2780840604, 5),
(4850796539, 13),
(8194051859, 20),
(2439214841, 9),
(4886082818, 18),
(2550111847, 5),
(5053857376, 5),
(1998485557, 20),
(4817400525, 5),
(5456277419, 4),
(3748660071, 2),
(9860018984, 5),
(3801675443, 6),
(4220019916, 10),
(8497102986, 15),
(5207216077, 18),
(5052673919, 6),
(2027601169, 16),
(5900111588, 10),
(8498039548, 11),
(6828534167, 9),
(2524051438, 2),
(6643262432, 4),
(2175646750, 9),
(1644147610, 19),
(9780537363, 8),
(8642985248, 3),
(4355256419, 20),
(2154886843, 16),
(6022322322, 3),
(5374472720, 5),
(1812614813, 19),
(9730748289, 19),
(3049661637, 1),
(4236826194, 15),
(9158184272, 6),
(5828327755, 18),
(5322916753, 9),
(6661607963, 9),
(6448517265, 18),
(5719955124, 13),
(5297388473, 9),
(5696777787, 3),
(1014232182, 10),
(8035839115, 12),
(8072324719, 20),
(8444247475, 5);

-- Batch 3
INSERT INTO prescriptions (prescriptionID, quantity) VALUES
(3838383695, 19),
(5322264770, 8),
(9562923481, 13),
(7125161811, 11),
(7845513299, 6),
(4292917388, 12),
(5038409473, 19),
(9932991234, 18),
(4298872431, 9),
(3085994410, 15),
(7488497936, 9),
(8626866741, 8),
(5649033597, 16),
(5762803865, 10),
(3303794194, 20),
(5772976146, 8),
(5196555382, 11),
(8153387008, 13),
(8994157773, 1),
(6886584742, 18),
(4505929841, 14),
(3956935868, 15),
(2380872915, 5),
(3659220102, 9),
(2691864737, 16),
(7202037004, 11),
(2653901823, 4),
(8249071954, 2),
(9916702086, 5),
(6519121873, 18),
(9012478110, 12),
(6348574681, 8),
(7919818752, 15),
(9185757547, 14),
(4319274474, 2),
(6079975223, 13),
(9892186124, 7),
(1925374975, 6),
(6135002494, 11),
(3699987662, 17),
(3339711118, 16),
(5322082235, 6),
(9632479203, 17),
(5431017861, 6),
(8138499885, 17),
(6983770406, 14),
(3856432385, 10),
(7264675771, 13),
(1600023924, 19),
(8639216790, 4),
(5257829356, 2),
(9471117376, 10),
(1526048723, 3),
(3487326435, 13),
(3543573454, 16),
(3085994410, 9),
(8324762365, 9),
(1222719376, 18),
(4628678003, 8),
(3323788957, 6),
(9533343442, 8),
(7264071020, 20),
(8110007375, 5),
(4130053986, 4),
(2172430304, 9),
(8958007647, 2),
(5031366477, 10),
(9623154632, 15),
(3027574118, 12),
(3208165448, 2),
(4651483018, 1),
(3282669596, 17),
(9170776259, 2),
(6947021164, 5),
(6873543697, 2);

-- Batch 4
INSERT INTO prescriptions (prescriptionID, quantity) VALUES
(1392437925, 16),
(1588387657, 19),
(2353927385, 8),
(2740244410, 9),
(9025497225, 2),
(4348965612, 1),
(1422824366, 2),
(1199974459, 10),
(6319769003, 18),
(7669121360, 11),
(9905101499, 5),
(3321244233, 4),
(6591729868, 1),
(8378507231, 8),
(6681989792, 20),
(2531244855, 10),
(1680207599, 17),
(8630423435, 15),
(7210425367, 11),
(1345971738, 4),
(9734596169, 6),
(2550018912, 4),
(4908239901, 2),
(4633013696, 13),
(3437823228, 8),
(1694325757, 12),
(7235911534, 10),
(2450715715, 20),
(5753981879, 11),
(7064488062, 15),
(6946968321, 5),
(7153027047, 14),
(1641028167, 9),
(1647689575, 11),
(4387529733, 6),
(4557676907, 5),
(6330621341, 13),
(7082163649, 15),
(2861006659, 1),
(2624258640, 1),
(3219997293, 9),
(4418599911, 7),
(9659756568, 11),
(6911165723, 2),
(6887989019, 11),
(9684379882, 14),
(3861833025, 16),
(7736083842, 11),
(8649822410, 5),
(2491966431, 7),
(7517451756, 20),
(5740860794, 6),
(6096225970, 3),
(9902229384, 20),
(4899427795, 3),
(9615674665, 18),
(7903198907, 6),
(1813578548, 4),
(1359694825, 16),
(1710349476, 18),
(1965745496, 17),
(7134730624, 10),
(7523719985, 10),
(7839829800, 18),
(7565620289, 20),
(5339970383, 20),
(3957132462, 6),
(7554815148, 5),
(1515904478, 17),
(3201977002, 3),
(2067790195, 7),
(5551216710, 1),
(1118191547, 2),
(9916702086, 15),
(8252031536, 15),
(9870943493, 5),
(6892028465, 11),
(2556998520, 10),
(7973537300, 14),
(8089144544, 1),
(9214157141, 20),
(9865654380, 17),
(4559342333, 13),
(4674364996, 3),
(3817021756, 4),
(6043609569, 15),
(7374275818, 5),
(9048976584, 10),
(9940028446, 14),
(1427197589, 14),
(1174405837, 19),
(5871320609, 12),
(2216443493, 16);

#5)Filtered the Specific Pharmacy: selected only prescriptions issued by 'Ally Scripts'
#1)finding out the quantity of medicine prescribed in each prescription and tagging it accordingly, 
#2) use the SQL SUM function combined with a CASE statement for conditional tagging.
#3)Aggregate the Quantities: First, sum up the quantities for each prescriptionID to get the total quantity for each prescription.
#4)Categorize the Quantity: Use a CASE statement to classify the total quantity into the tags "low quantity", "medium quantity", and "high quantity".

SELECT
    prescriptionID,
    SUM(quantity) AS totalQuantity,
    CASE
        WHEN SUM(quantity) < 20 THEN 'Low Quantity'
        WHEN SUM(quantity) BETWEEN 20 AND 49 THEN 'Medium Quantity'
        ELSE 'High Quantity'
    END AS QuantityTag
FROM
    prescriptions
GROUP BY
    prescriptionID;
