CREATE OR REPLACE FILE FORMAT OUR_FIRST_DB.PUBLIC.pipe_format
  TYPE = CSV FIELD_DELIMITER = ',' SKIP_HEADER = 1;

  CREATE OR REPLACE STAGE OUR_FIRST_DB.PUBLIC.azure_stage
  URL='azure://stghexa.blob.core.windows.net/customers/customers.csv'
  STORAGE_INTEGRATION = my_azure_integration
  FILE_FORMAT = OUR_FIRST_DB.PUBLIC.pipe_format;
