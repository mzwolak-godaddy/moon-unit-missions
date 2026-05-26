CREATE TABLE dim_bill_vw (
    bill_id string COMMENT '@PrimaryKey Unique identifier for a customer bill (receipt). Part of composite PK with original_customer_id, merged_customer_id, rep_version_id.',
    event_id string COMMENT 'Unique identifier for the event bus event that created or last modified this bill record.',
    original_shopper_id	string COMMENT 'Shopper ID at original bill creation.',
    original_customer_id string COMMENT 'Customer ID at original bill creation, before any account merges. Composite PK component.',
    merged_shopper_id string COMMENT 'Current post-merge shopper ID on the bill.',
    merged_customer_id string COMMENT 'Current post-merge customer ID on the bill. Composite PK component.',
    rep_version_id int COMMENT 'Care representative version identifier on the bill. Composite PK component.',
    bill_modified_mst_date date COMMENT 'Date the bill was last modified, in Mountain Standard Time (MST).',
    current_record_flag boolean COMMENT 'SCD2 partition flag for the current active bill version. TRUE = active (effective end = 9999-12-31); FALSE = superseded historical record. Partition column.',
    etl_insert_utc_ts timestamp COMMENT 'UTC timestamp when this row was first inserted by the Extract, Transform, Load (ETL) process.',
    etl_update_utc_ts timestamp  COMMENT 'UTC timestamp when this row was last updated by the Extract, Transform, Load (ETL) process.'
);
