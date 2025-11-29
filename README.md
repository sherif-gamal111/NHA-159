# NHA‑159 — Real‑Time Traffic Data Engineering Project 🚦

## 🚀 Project Overview  
This project ingests, processes, and transforms UK traffic data into a clean, analytics‑ready data warehouse following a **Bronze → Silver → Gold** multi‑layered architecture. The resulting data model supports downstream reporting and visualization using tools like Power BI — making insights from raw traffic data accessible to analysts and decision‑makers.  

Key strengths & deliverables:  
- Full end-to-end data pipeline: raw ingestion, cleaning, schema design, and loading.  
- Star schema modeling for efficient querying and reporting.  
- Clean, surrogate‑keyed data with enforced referential integrity and data type validation.  
- A reproducible workflow that’s easy to understand and extend.  

---

## 📁 Repository Structure  
```
NHA-159/
│
├── Data Warehouse/ — SQL schema and data warehouse artifacts
├── Data Sets/ — Raw and intermediate datasets (raw, cleaned CSVs, etc.)
├── Data Analysis/ — Notebooks & scripts for data profiling, cleaning, transformation
├── Scripts.zip — Backup of cleaning or ETL scripts
├── Assets.zip — Architecture diagrams, data model visuals, star‑schema diagram, etc.
└── README.md — This file
```
---

## 🛠️ Tools & Technologies  

| Tool / Technology | Purpose |
|------------------|---------|
| **Python**        | Data cleaning, transformation, and preprocessing of raw traffic data |
| **T‑SQL / SQL Server** | Storage, schema creation, and modeling of processed data |
| **Power BI**      | Reporting and visualization of cleaned, aggregated traffic data |
| **Git & GitHub** | Version control, collaboration, and documentation management |

---

## 🔄 Project Workflow  

1. **Raw data ingestion** → collect raw traffic data files under `Data Sets/`.  
2. **Data cleaning & normalization** → use Python scripts/notebooks under `Data Analysis/` to clean, dedupe, enforce data types, and prepare for loading.  
3. **Schema design & data loading** → use the SQL scripts in `Data Warehouse/` to create star‑schema tables and load cleaned data.  
4. **Reporting / Visualization** → connect the warehouse data to Power BI dashboards for analysis and insights.  

---

## 📊 Data Model (Silver / Gold Layer)  

**Core tables and dimensions**:

- `Traffic` — Fact table with traffic events (keyed by `Traffic_id`)  
- `Road` — Road metadata (keyed by `Road_id`)  
- `Region` — Region metadata (keyed by `Region_id`)  
- `LocalAuthority` — Local authority metadata (keyed by `Local_authority_id`)  
- `Location` — Geographic coordinates and location metadata (keyed by `Location_id`)  
- `Date` — Date dimension for time‑based analysis (keyed by `Date_id`)  

Relationships:  
- `Traffic.Road_id → Road.Road_id`  
- `Traffic.Region_id → Region.Region_id`  
- `Traffic.Local_authority_id → LocalAuthority.Local_authority_id`  
- `Traffic.Location_id → Location.Location_id`  
- `Traffic.Date_id → Date.Date_id`  

This design enables efficient querying, time‑series analysis, and integration with BI tools.

---

## ✅ Data Cleaning Highlights  

- Duplicate records removed  
- Added surrogate primary keys for dimension & fact tables  
- Validated & standardized data types (dates, numeric, strings)  
- Enforced referential integrity for all foreign‑key relationships  
- Prepared clean CSVs ready for schema loading  

---

## 📊 Visual Assets  

You’ll find diagrams, workflow visuals, and star‑schema illustrations in `Assets.zip`. These provide an intuitive view of data flow, architecture, and entity relationships for better understanding and documentation.  

---

## 🧠 Key Learnings & Takeaways  

- How to build a multi‑layer data pipeline (Bronze → Silver → Gold) from raw data ingestion to analytics‑ready warehouse.  
- Effective data cleaning and normalization techniques when dealing with real-world noisy traffic datasets.  
- Star schema modeling and dimensional design for building BI‑ready data structures.  
- End-to-end integration: ingestion → cleaning → modeling → visualization.  

---

## 👥 Contributors  

| Name | Role / Responsibility |
|------|-----------------------|
| Osama Hegazy           | SQL & Data Cleaning  |  
| Mohamed Nasr Aldin     | Data Cleaning         |  
| Sherif Gamal           | SQL Modeling          |  
| Ahmed Salama           | Power BI Reporting    |  
| Zakaria Yehia          | Power BI Reporting    |  
| Sara Hisham            | Power BI Reporting    |  
| Yousef Ahmed           | Power BI Reporting    |  

---

## 🔮 Next Steps / Future Improvements  

- Integrate workflow orchestration (e.g. add Apache Airflow or Azure Data Factory) to automate the pipeline.  
- Enable incremental data refresh for continuous data updates.  
- Add monitoring, logging, and alerting to track pipeline health & data quality over time.  
- Potentially migrate to a cloud-based data warehouse or improve scalability.  

---

## 📄 License & Usage  

This project is open for educational and demonstration purposes. Feel free to explore, fork, and adapt — but please attribute the original authors.

---

## 🔗 Contact  

For questions, collaboration requests, or suggestions — open an issue or reach out via GitHub.  

---
