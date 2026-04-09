## PlatinumRx Assignment

### Excel (Spreadsheet Analysis)

I used Excel to perform data preparation, transformation, and analysis on the ticket dataset.

* Created two sheets: **ticket** and **feedbacks**, and used **XLOOKUP** to populate `ticket_created_at` in the feedbacks sheet using `cms_id` as the key.
* Built helper columns:

  * **Same Day** → compared only dates using `INT(created_at)` and `INT(closed_at)`
  * **Same Hour** → compared both date and hour using `HOUR()` function
* Used **Pivot Tables** to calculate outlet-wise counts of tickets created and closed on the same day and same hour.
* Performed data cleaning by handling missing values and removing `(blank)` entries.

 **Spreadsheet Link:**
https://1drv.ms/x/c/5D79C41B0B788193/IQBrsDFIUEoYTpSPskGCXYFTAfQ27Wq5KJEzW7wVqdLf6iM?e=MDAdo0

---

###  SQL (Database Analysis)

I implemented SQL queries for both Hotel and Clinic management systems.

* Created database schemas using **CREATE TABLE** and inserted sample data using **INSERT statements**.
* Solved analytical queries using:

  * **JOINs** to combine multiple tables
  * **GROUP BY** and **SUM()** for aggregations
  * **HAVING** clause for filtering aggregated results
* Used **window functions (DENSE_RANK / ROW_NUMBER)** for advanced queries such as:

  * Finding most/least ordered items
  * Identifying second highest or second least values
* Performed time-based analysis using **YEAR()** and **MONTH()** functions.

---

###  Python (Programming Logic)

I solved basic programming problems using Python.

* Converted minutes into a human-readable format using:

  * Integer division (`//`) for hours
  * Modulus (`%`) for remaining minutes
* Removed duplicate characters from a string using a loop-based approach while maintaining the original order of characters.

---

###  Summary

This assignment demonstrates the ability to work across multiple tools:

* **Excel** for data manipulation and visualization
* **SQL** for structured data querying and analysis
* **Python** for logical problem-solving

The overall approach focuses on correctness, clarity, and efficient use of fundamental concepts.
