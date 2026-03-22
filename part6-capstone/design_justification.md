## Storage Systems
To meet the hospital network’s four goals, a hybrid data architecture is used, combining multiple storage systems optimized for different workloads.
For predicting patient readmission risk, historical treatment data is stored in a Data Lakehouse (cloud object storage with ACID tables). This allows raw clinical data, lab results, and discharge summaries to be stored cheaply while also supporting structured queries and feature extraction for machine learning models.
To support plain-English queries by doctors, patient notes and clinical summaries are embedded and stored in a Vector Database. This enables semantic search and retrieval-augmented generation (RAG), allowing questions like “Has this patient had a cardiac event before?” to be answered using similarity search rather than exact SQL queries.
For monthly management reporting such as bed occupancy and department-wise costs, a Data Warehouse is used. Curated, cleaned, and aggregated data from the lakehouse is loaded here to support fast OLAP queries and BI dashboards with consistent metrics.
For real-time ICU vitals, a streaming data store backed by a time-series database is used. This system ingests high-frequency sensor data with low latency, supports real-time monitoring, and periodically archives data into the lakehouse for long-term analysis.

## OLTP vs OLAP Boundary
The OLTP boundary exists at the operational hospital systems: Electronic Health Records (EHR), ICU monitoring devices, and admission systems. These systems prioritize low-latency writes, data integrity, and real-time availability for clinicians.
The OLAP boundary begins once data is streamed or batch-loaded into the analytical platforms. The Data Lakehouse and Data Warehouse form the analytical layer, where data is optimized for large-scale reads, aggregations, historical analysis, and machine learning workloads. Transformations, feature engineering, and reporting occur only after data crosses this boundary, ensuring operational systems are not impacted by analytical queries.

## Trade-offs
A key trade-off in this design is increased system complexity. Using multiple storage systems (lakehouse, warehouse, vector database, and streaming store) introduces operational overhead, higher learning curves, and integration challenges.
This trade-off is mitigated by using managed cloud services and strong data orchestration. Centralized metadata management, standardized data contracts, and automated pipelines reduce maintenance effort. The benefit is a highly scalable, future-proof architecture that supports AI, analytics, and real-time monitoring without compromising performance or reliability.

