-- Create a stage for Azure Blob Storage
CREATE OR REPLACE STAGE azure_stage
  url='azure://stghexa.blob.core.windows.net/sales-data'
  credentials=(AZURE_SAS_TOKEN='?sv=2024-11-04&ss=bfqt&srt=sco&sp=rwdlacupyx&se=2025-10-15T12:12:28Z&st=2025-10-15T03:57:28Z&spr=https&sig=qaBQcgGdEsAMl%2FTG46K3eJco6mSftJZ5xxhqRqA10CM%3D');

-- Create a table
CREATE OR REPLACE TABLE sales_data (
  ID STRING,
  CUSTOMER STRING,
  REGION STRING,
  AMOUNT NUMBER(10,2)
);

-- Load data
COPY INTO sales_data
FROM @azure_stage/Sales_Data.csv
FILE_FORMAT = (TYPE = 'CSV' FIELD_DELIMITER=',' SKIP_HEADER=1);

--create pipe
CREATE OR REPLACE PIPE sales_pipe
AS
COPY INTO SALES_DATA
FROM @azure_stage
FILE_FORMAT = (TYPE = 'CSV' FIELD_DELIMITER=',' SKIP_HEADER=1);

SHOW PIPES;

SELECT * FROM sales_data;
SELECT * FROM MY_SCHEMA1.REGION_SALES;
