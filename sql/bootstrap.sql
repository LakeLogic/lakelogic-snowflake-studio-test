-- One-time bootstrap (run in a Snowsight worksheet as a role that can create databases,
-- warehouses and integrations). Creates the database, warehouse and Git repository, then runs
-- sql/setup.sql from the repository. EDIT the ORIGIN below to this project's repository.
CREATE DATABASE IF NOT EXISTS LLDEMO_DEV;
CREATE WAREHOUSE IF NOT EXISTS LAKELOGIC_WH
  WAREHOUSE_SIZE = XSMALL AUTO_SUSPEND = 60 AUTO_RESUME = TRUE INITIALLY_SUSPENDED = TRUE;
USE DATABASE LLDEMO_DEV;
CREATE SCHEMA IF NOT EXISTS PIPELINE;
USE SCHEMA PIPELINE;
CREATE OR REPLACE API INTEGRATION GIT_API_RIDEFLOW_TRIP_REVENUE_ANALYTICS_COPY
  API_PROVIDER = git_https_api
  API_ALLOWED_PREFIXES = ('https://github.com/<owner>')
  ENABLED = TRUE;
CREATE OR REPLACE GIT REPOSITORY LLDEMO_REPO
  API_INTEGRATION = GIT_API_RIDEFLOW_TRIP_REVENUE_ANALYTICS_COPY
  ORIGIN = 'https://github.com/<owner>/<repo>';
ALTER GIT REPOSITORY LLDEMO_REPO FETCH;
EXECUTE IMMEDIATE FROM @LLDEMO_REPO/branches/main/sql/setup.sql
  USING (DB => 'LLDEMO_DEV', WH => 'LAKELOGIC_WH', POOL => 'LLDEMO_POOL',
         REPO => 'LLDEMO_REPO', BRANCH => 'main');
