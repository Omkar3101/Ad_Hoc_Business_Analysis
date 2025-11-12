# **Ad-Hoc Business Analysis for AtliQ Hardware**

---

### **Table of Contents**
1.  [**Project Overview**](#project-overview)
2.  [**Business Problem**](#business-problem)
3.  [**Tools & Technologies Used**](#tools--technologies-used)
4.  [**Key Technical Concepts Demonstrated**](#key-technical-concepts-demonstrated)
5.  [**Ad-Hoc Analysis & Solutions**](#ad-hoc-analysis--solutions)
6.  [**Key Learnings**](#key-learnings)
7.  [**Acknowledgements**](#acknowledgements)

---

### **Project Overview**

This project simulates a real-world data analytics scenario at **AtliQ Hardware**, a fictional manufacturer of computer peripherals. The primary goal is to demonstrate how a data analyst responds to urgent, ad-hoc business questions from a senior stakeholder (Product Owner) using SQL.

The analysis moves beyond simple queries to showcase the development of efficient, reusable, and automated solutions like **Stored Procedures** and **Views**, turning raw data from a MySQL database into a strategic asset for the company.

---

### **Business Problem**

After rapid growth, AtliQ Hardware migrated its chaotic sales data from Excel to a robust MySQL database. The company is now focused on becoming data-informed. The data analytics team is tasked with answering a series of urgent, ad-hoc business questions to support strategic planning, performance reviews, and operational improvements.

> **Objective:** Respond to ad-hoc requests from the Product Owner with immediate, data-driven answers using SQL, and build automated, reusable solutions for recurring analytical needs.

---

### **Tools & Technologies Used**

*   **Database:** MySQL
*   **Querying Language:** SQL
*   **Documentation & Presentation:** Notion, Excel (for visualization)

---

### **Key Technical Concepts Demonstrated**

This project showcases a range of fundamental and advanced SQL skills:

*   **Complex Joins:** Combining multiple tables (e.g., sales, product, customer) to create comprehensive datasets.
*   **Stored Procedures:** Creating reusable query templates to automate repetitive reporting tasks for different parameters (e.g., customer name, fiscal year).
*   **Views:** Building virtual tables to simplify complex queries, improve security, and ensure a single source of truth for metrics like Net Sales.
*   **Common Table Expressions (CTEs):** Breaking down complex calculations into logical, readable steps, particularly for calculating percentage contributions.
*   **Window Functions (DENSE_RANK):** Performing advanced ranking to identify top N products *within* each product division.
*   **Custom SQL Functions:** Creating functions like `get_fiscal_year` and `get_fiscal_quarter` to handle custom business logic.
*   **Data Aggregation & Filtering:** Using `GROUP BY`, `WHERE` clauses, and aggregate functions to summarize data and answer specific business questions.

---

### **Ad-Hoc Analysis & Solutions**

The following is a summary of the ad-hoc requests from the stakeholder and the SQL-based solutions provided.

**1. Request: Product-wise Sales Report for a Key Customer (Croma India)**
   *   **Solution:** Wrote a SQL query with `JOINs` and `WHERE` clauses to filter and aggregate sales data.
   *   **Automation:** Converted the query into a **Stored Procedure** (`get_monthly_gross_sales_for_customer`) that can generate the same report for any customer instantly.

**2. Request: Classify Markets as 'Gold' or 'Silver'**
   *   **Solution:** Developed a **Stored Procedure** (`get_market_badge`) that takes a market and fiscal year as input and uses an `IF` statement to classify the market based on total sold quantity (> 5 million units = Gold).

**3. Request: Top N Customers, Products, and Markets by Net Sales**
   *   **Solution:**
        1.  Created a SQL **View** (`net_sales`) to act as a secure and simplified virtual table for all net sales calculations.
        2.  Built three separate **Stored Procedures** on top of the view to instantly fetch the top N performers for any given fiscal year.

**4. Request: Top 10 Customers by % Contribution to Net Sales**
   *   **Solution:** Utilized a **CTE** to first calculate the total net sales, then used that total in the main query to calculate the percentage contribution for each customer. The results were exported to Excel for visualization.

**5. Request: Breakdown of Net Sales by Customer within Each Region**
   *   **Solution:** Used a **CTE** and `GROUP BY` on both region and customer name to provide a granular breakdown of revenue drivers in key markets.

**6. Request: Top 3 Products in Each Division by Quantity Sold**
   *   **Solution:** Created a powerful **Stored Procedure** using the `DENSE_RANK()` window function, partitioned by division, to rank products within their respective categories and filter for the top performers.

**7. Request: Forecast Accuracy Report for All Customers**
   *   **Solution:**
        1.  First, created a new table (`fact_act_est`) by combining sales and forecast data using `JOINs` and `UNIONs` to ensure a complete dataset.
        2.  Developed a **Stored Procedure** that calculates and reports on total sold vs. forecasted quantity, net error, and overall forecast accuracy percentage for each customer.

---

### **Key Learnings**

This project was a practical exercise in moving beyond basic querying to building a robust, automated, and efficient analytical framework. Key takeaways include:

*   The importance of translating vague business questions into specific, answerable data queries.
*   The power of **Stored Procedures** and **Views** in saving time, reducing errors, and ensuring consistency in reporting.
*   The application of advanced SQL functions like **CTEs** and **Window Functions** to solve complex business problems that simple queries cannot.
*   How a data analyst can act as a strategic partner to the business by providing not just data, but fast, reliable, and actionable insights.

---

### **Acknowledgements**

*   This project was inspired by the curriculum of the **Codebasics Data Analytics Bootcamp**.
*   Special thanks to mentors **Dhaval Patel** and **Hemanand Vadivel** for their invaluable guidance.

### **Connect with Me**

If you found this project insightful or want to discuss data, technology, and new opportunities, feel free to connect with me on my professional platforms:

- 💼 **LinkedIn:** [**Omkar Sharma**](https://www.linkedin.com/in/omkar3101)
- 📂 **Portfolio:** [**My Portfolio**](https://rhinestone-dibble-6c6.notion.site/Omkar-Sharma-2a56733b537c800db9ebe11314a946b5)
- 💻 **GitHub:** [**@Omkar3101**](https://github.com/Omkar3101)
