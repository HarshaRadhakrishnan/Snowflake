--// Create new stage
CREATE OR REPLACE STAGE MANAGE_DB.external_stages.aws_stage_errorex
    url='s3://bucketsnowflakes4';
--// List files in stage
LIST @MANAGE_DB.external_stages.aws_stage_errorex;

// Create example table
CREATE OR REPLACE TABLE MY_PRACTICE_DB.MY_SCHEMA1.ORDERS_TABLE (
   ORDER_ID VARCHAR(30),
   AMOUNT INT,
   PROFIT INT,
   QUANTITY INT,
   CATEGORY VARCHAR(30),
   SUBCATEGORY VARCHAR(30));

// Demonstrating error message
CREATE OR REPLACE FILE FORMAT MY_PRACTICE_DB.MY_SCHEMA1.csv_format_orders
TYPE = CSV
FIELD_DELIMITER = ','
SKIP_HEADER = 1
NULL_IF = ('NULL','');


COPY INTO MY_PRACTICE_DB.MY_SCHEMA1.ORDERS_TABLE
FROM @MANAGE_DB.external_stages.aws_stage_errorex
FILE_FORMAT = (TYPE = CSV FIELD_DELIMITER=',' SKIP_HEADER=1)
FILES = ('OrderDetails_error.csv')
ON_ERROR = 'CONTINUE';

-- Validating results
SELECT * FROM MY_PRACTICE_DB.MY_SCHEMA1.ORDERS_TABLE;
SELECT COUNT(*) FROM MY_PRACTICE_DB.MY_SCHEMA1.ORDERS_TABLE;

---Error handling using the ON_ERROR option = ABORT_STATEMENT (default)
COPY INTO MY_PRACTICE_DB.MY_SCHEMA1.ORDERS_TABLE
    FROM @MANAGE_DB.external_stages.aws_stage_errorex
    file_format= (type = csv field_delimiter=',' skip_header=1)
    files = ('OrderDetails_error.csv','OrderDetails_error2.csv')
    ON_ERROR = 'ABORT_STATEMENT';

---Error handling using the ON_ERROR option = SKIP_FILE
COPY INTO MY_PRACTICE_DB.MY_SCHEMA1.ORDERS_TABLE
    FROM @MANAGE_DB.external_stages.aws_stage_errorex
    file_format= (type = csv field_delimiter=',' skip_header=1)
    files = ('OrderDetails_error.csv','OrderDetails_error2.csv')
    ON_ERROR = 'SKIP_FILE';