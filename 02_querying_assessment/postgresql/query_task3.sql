-- Task 3: Staff Performance Review
-- At the end of the month, the owner wants to reward the hardest-working cashiers.
-- To decide fairly, they want to see how many orders each staff member has processed,
-- with the busiest staff member appearing at the top of the list.
--
-- Hint: Write a query to find the total number of orders processed by each staff member.
-- The result should show the staff member's full name (concatenated) and their total order count,
-- ordered by the count in descending order.

SELECT
    CONCAT(Staff.first_name, ' ', Staff.last_name) AS staff_name,
    COUNT(*) AS total_orders
FROM Orders
JOIN Staff
ON Orders.staff_id = Staff.staff_id
GROUP BY Staff.staff_id, Staff.first_name, Staff.last_name
ORDER BY total_orders DESC;

-- Bonus: The dataset is identical in the MongoDB database, meaning the same business insight can be retrieved.
-- Write the equivalent query for MongoDB. See query_task3_bonus.mongodb.js

-- ---------------------------------------------------------------
-- Your thinking process (required)
-- ---------------------------------------------------------------
-- Before writing your query, explain in your own words how you
-- interpreted the task, what data you need, which table(s) are
-- involved, and what SQL concepts you plan to use.
-- Write in English or Thai. Do not skip this step.
--
-- Your thinking:
--

/* อยากได้จำนวนออเดอทั้งหมดของพนักงานขายแต่ละคน โดยที่แสดงทั้งชื่อ นามสกุล และจำนวนที่ขายได้
เรียงลำดับจากเยอะสุดไปน้อย
เริ่มจากโจทย์อยากได้ขชื่อสกุลใช้ concat เพื่อรวมชื่อกับสกุลให้เป็นคอลั่มของ staff_name และให้เรียง orderจากมากไปน้อย
ต่อมาข้อมูลอยุ่คนละตาราง order กับ staff  เลยต้องเลือกตาราง from order
และให้เชื่อม join ตาราง staff  on ตรงส่วนข้อมูลของ orders staff_id ให้เชิ้อมกับ ตาราง staff ส่วนของ staff_id
จากนั้นให้จัดรวมกลุ่มข้อมุลจาก staff_id first_name last_name 
และให้เรียงจากมากไปน้อยโดยมันจะป็นการอ้างอิงจากข้อมูลของตาราง order 
ในแต่ละรายการขายจะมัี staff_id เพื่อสุดท้ายเอามารวมเป้น total order
*/