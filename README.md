# Quickstart

* [dbt installation](https://docs.getdbt.com/docs/dbt-cloud/on-premises/installation/)
* [postgres/psql installation](https://www.google.com/search?channel=cus2&client=firefox-b-1-d&q=windows+linux+postgres)

`dbt_project.yml` is configured to work with a local postgres database


In Terminal:
```shell
psql -c "CREATE DATABASE dbt_tutorial"
psql -c "CREATE SCHEMA dbt_tutorial.jaffle_shop"
```

Create the raw tables and copy data from the .csv files in datasets/
```shell
psql -d dbt_tutorial -a -f db_setup/setup.sql
```

# DBT
Try these:
* `dbt run`
* `dbt test`

Try out some queries:
```sql
SELECT * FROM analytics.customers;
```
