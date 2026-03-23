## Architecture Recommendation

I would recommend a Data Lakehouse for this food delivery startup.

A lakehouse is the best fit because the company is collecting many different types of data: structured payment transactions, semi-structured GPS logs, unstructured customer text reviews, and image files for restaurant menus. A traditional Data Warehouse is excellent for clean, structured reporting data, but it is not flexible enough for handling large volumes of raw text, logs, and images efficiently. A Data Lake can store all these formats cheaply, but it often lacks strong governance, reliable performance for analytics, and easy support for business reporting.

The first reason to choose a lakehouse is multi-format support with analytics capability. It can store raw files like reviews and menu images while also supporting SQL-based analysis on transactions and delivery trends. Second, it provides better scalability and lower storage cost than a warehouse, which is important for a fast-growing startup where GPS logs and images will grow very quickly. Third, it offers stronger data management than a plain data lake, including schema enforcement, ACID-style reliability, and cleaner integration for dashboards, machine learning, and data science workflows.

A lakehouse also helps the startup use the same platform for both business intelligence and advanced analytics, such as sentiment analysis on reviews, route optimization from GPS data, fraud detection in payments, and image-based menu processing. This makes it the most practical and future-ready architecture.