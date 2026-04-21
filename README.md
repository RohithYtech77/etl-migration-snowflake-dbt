# Legacy ETL Migration — Snowflake + dbt + Great Expectations

Modernized legacy ETL workflows by migrating them to a
cloud-native stack using Snowflake, dbt, and automated data quality checks.

## Tech Stack
- Python, SQL, dbt Core
- Snowflake — data warehouse
- Great Expectations — data quality validation
- Apache Airflow — orchestration
- GitLab CI/CD — automated testing

## Pipeline Flow
1. Legacy ETL jobs identified and mapped to new architecture
2. dbt models built for Staging, Intermediate, and Mart layers
3. Great Expectations validates data quality at each layer
4. Airflow DAGs handle scheduling and failure management
5. CI/CD runs dbt tests automatically on every commit

## Key Highlights
- Migrated 200+ legacy ETL workflows with zero downtime
- 30% improvement in processing efficiency
- Automated data quality checks before every load
- Full data lineage with dbt documentation
