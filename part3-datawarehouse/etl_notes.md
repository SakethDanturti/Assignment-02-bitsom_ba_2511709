## ETL Decisions

### Decision 1 — Standardized inconsistent category names

Problem: The raw retail data contained inconsistent category labels for similar products, such as Grocery and Groceries. If loaded as it is, this would split the same business category into multiple groups and produce inaccurate reports when calculating category-wise sales.

Resolution: I standardized category values before loading the warehouse by mapping inconsistent labels to one common value. For example, both Grocery and Groceries should be converted into a single standard category, such as Groceries. This ensured that product category analysis in dim_product and fact-based reporting remained accurate and consistent.

### Decision 2 — Created surrogate keys for dimensions

Problem: The raw transaction data likely used descriptive values such as dates, store names, and product names directly. Using these raw values in the fact table would create duplication, increase storage, and make joins slower and less reliable, especially if names were entered with slight variations.

Resolution: I introduced surrogate keys for each dimension: date_key for dim_date, store_key for dim_store, and product_key for dim_product. The fact table stores only these keys instead of repeating long text values. This made the schema cleaner, improved consistency, and followed proper star schema design principles.

### Decision 3 — Calculated and cleaned sales measures

Problem: Raw transaction data may contain separate fields such as quantity sold and unit price, but not always a ready-to-use revenue measure for analytics. In addition, numeric fields can contain formatting or precision inconsistencies that affect reporting.

Resolution: I cleaned numeric values by storing units_sold as an integer and unit_price as a decimal. Then I derived the total_sales measure as units_sold × unit_price before loading into fact_sales. This ensured that the warehouse had a reliable numeric measure for revenue analysis and made queries such as monthly sales and top-performing stores much easier.