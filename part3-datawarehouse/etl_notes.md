## ETL Decisions

### Decision 1 - Filling missing store city information

Problem: Some rows had NULL or blank values in the store_city column, even though store_name was present. Missing city data would reduce the quality of store-level insights and make the store dimension incomplete.

Resolution: Missing store_city values were filled by mapping each store_name to its correct city based on patterns in the dataset. For example  Delhi South mapped to  Delhi. This produced a consistent dim_store table for reporting.

### Decision 2 - Normalizing category values

Problem: The category column contained inconsistent naming and capitalization, such as Electronics, electronics, Grocery, and Groceries. If loaded without cleaning, this would create the same business category into multiple entries, resulting in inaccurate reporting.

Resolution: All category values were standardized before loading. Variations of electronics were unified as Electronics, grocery-related entries were standardized to Groceries, and clothing categories were formatted consistently in title case. This ensured reliable aggregation and accurate analysis at the category level in the data warehouse.

### Decision 3 — Standardizing inconsistent date formats

Problem: Given data had dates in various formats, such as YYYY-MM-DD, DD-MM-YYYY, and DD/MM/YYYY. These inconsistencies could lead to loading errors and unreliable time-based analysis.

Resolution: All dates were standardized to the YYYY-MM-DD format before loading. A dedicated dim_date table was then created from the cleaned dates, including attributes like day, month, quarter, and year to enable consistent and accurate analytical reporting.
