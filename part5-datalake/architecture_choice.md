## Architecture Recommendation
For a fast-growing food delivery startup handling GPS logs, text reviews, payment transactions, and menu images, the most suitable storage architecture is a Data Lakehouse.


The startup’s data is highly diverse with structured payment transactions, semi-structured GPS logs, unstructured customer reviews, and image files. A traditional Data Warehouse is optimized mainly for structured data and would struggle with images and raw text. A Data Lakehouse combines the flexibility of a Data Lake (for storing raw, unstructured data like images and logs) with the schema and governance capabilities of a warehouse, making it ideal for this mixed workload.

Food delivery platforms rely heavily on analytics and ML use cases such as delivery time prediction, sentiment analysis of reviews, fraud detection, and demand forecasting. A Data Lakehouse allows data scientists to directly access raw data for ML while also enabling BI teams to run fast SQL analytics on curated datasets—without duplicating data across systems.

A Data Lakehouse offers the best balance of flexibility, performance, scalability, and governance—making it the most future-proof choice for a data-driven food delivery startup.
