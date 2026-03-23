## Storage Systems
For this hospital architecture, I would use a hybrid design with more than one storage system because the four goals involve very different data patterns. For predicting patient readmission risk, the main storage should be a data lakehouse. It is suitable because historical treatment data can include structured records such as diagnoses, medications, admissions, and discharge summaries, along with semi-structured clinical notes. A lakehouse supports both scalable storage and analytics, making it a strong base for training AI and machine learning models over large historical datasets.

For doctors asking patient-history questions in plain English, I would use the same lakehouse as the trusted source of patient records, combined with a vector database for semantic retrieval. The lakehouse stores the original patient history, while the vector database stores embeddings of clinical notes, discharge summaries, and prior events so that natural-language queries can be matched intelligently. This combination helps the system answer questions such as whether a patient had a previous cardiac event, while still grounding the answer in stored medical records.

For monthly management reporting, I would use a data warehouse or curated BI mart fed from the lakehouse and hospital source systems. Reporting needs clean, structured, highly reliable tables for bed occupancy, cost analysis, and department-wise summaries. A warehouse layer is better here because it is optimized for fast SQL reporting, dashboarding, and repeatable aggregated queries.

For real-time ICU vitals, I would use a time-series database. Vitals data arrives continuously and in high volume, so it needs a storage system optimized for timestamped records, fast ingestion, and short-latency retrieval. Recent vitals can stay in the time-series store for live monitoring and alerts, while selected data is also pushed into the lakehouse for long-term analysis and model improvement.

## OLTP vs OLAP Boundary

In this design, the OLTP side includes the operational hospital systems and live device feeds. This covers electronic health record transactions, admission and discharge events, billing updates, and incoming ICU vital signals. These systems are focused on writing current records accurately and quickly, supporting day-to-day care and hospital operations.

The OLAP side begins once data is copied, streamed, or transformed into analytical storage such as the lakehouse, warehouse, and vector index. At that point, the purpose changes from running hospital operations to supporting analysis, reporting, AI training, and retrieval-based question answering. In simple terms, OLTP ends at operational capture, and OLAP begins at analytical ingestion.

## Trade-offs

One major trade-off in this design is increased architectural complexity. Using a lakehouse, warehouse, vector database, and time-series database provides strong performance and flexibility, but it also creates more pipelines, more governance work, and more opportunities for synchronisation issues between systems.

I would mitigate this by making the lakehouse the central system of record for analytics, while other stores serve specialised functions only. The warehouse would contain curated reporting tables, the vector database would hold only searchable embeddings, and the time-series database would focus on recent vitals. Strong metadata management, automated pipelines, schema validation, and scheduled reconciliation checks would reduce inconsistency. This keeps the architecture practical while still meeting all four hospital goals well.