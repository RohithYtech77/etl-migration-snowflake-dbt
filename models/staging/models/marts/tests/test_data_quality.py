import great_expectations as ge
import pandas as pd

def run_data_quality_checks(df: pd.DataFrame):
    """Run Great Expectations checks on incoming data."""
    gdf = ge.from_pandas(df)

    # Check no nulls in key columns
    assert gdf.expect_column_values_to_not_be_null("order_id")["success"]
    assert gdf.expect_column_values_to_not_be_null("customer_id")["success"]

    # Check amount is always positive
    assert gdf.expect_column_values_to_be_between(
        "total_amount", min_value=0
    )["success"]

    # Check status is valid
    assert gdf.expect_column_values_to_be_in_set(
        "status", ["COMPLETED", "PENDING", "CANCELLED"]
    )["success"]

    print("All data quality checks passed.")

if __name__ == "__main__":
    sample = pd.read_csv("data/sample_orders.csv")
    run_data_quality_checks(sample)
