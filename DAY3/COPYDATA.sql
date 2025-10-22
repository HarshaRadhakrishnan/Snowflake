----------COPY INTO
-- Create a stage for Azure Blob Storage
CREATE OR REPLACE STAGE azure_stage
  url='azure://stghexa.blob.core.windows.net/order-details'
  credentials=(AZURE_SAS_TOKEN='?sv=2024-11-04&ss=bfqt&srt=sco&sp=rwdlacupyx&se=2025-10-15T14:10:15Z&st=2025-10-15T05:55:15Z&spr=https&sig=79S9GBKPtQdfv5yE%2FmK9%2BC6SQ7nozDA8O0nxS9IOqig%3D');

-- Create a table
CREATE OR REPLACE TABLE order_details (
  ORDER_ID STRING,
  AMOUNT VARCHAR(10),
  REGION STRING
);
SELECT * FROM ORDER_DETAILS;

SELECT * FROM ORDER_DETAILS_TABLE;
-- Load 
COPY INTO order_details
FROM @azure_stage/order_details.csv
FILE_FORMAT = (TYPE = 'CSV' FIELD_DELIMITER=',' SKIP_HEADER=1);

select * from order_details;

----------Snowpipe

CREATE OR REPLACE PIPE azure_orders_pipe
AS
COPY INTO order_details
FROM @azure_stage
FILE_FORMAT = (TYPE = 'CSV' FIELD_DELIMITER=',' SKIP_HEADER=1);


SELECT * FROM REGION_SALES_TABLE;





