# 05 — SQL Logistics Lab

## Problem

Compare carrier service and cost while keeping the calculation auditable.

## Method

The PostgreSQL script creates a carrier-performance view and calculates:

- total shipments and pallets;
- total cost and cost per shipment;
- completed, on-time and late deliveries;
- OTD percentage;
- average lead time.

It also contains reconciliation and data-quality queries for duplicates, negative values and impossible dates.

## Important analytical choice

OTD uses completed deliveries as its denominator. This avoids treating open shipments as late or on time before an actual delivery date exists.

## Run

The script expects `dim_date`, `dim_destination`, `dim_customer`, `dim_carrier` and `fact_shipment` in PostgreSQL 15.

```bash
psql -d atlas_2_0 -f logistics_analysis.sql
```

## Decision supported

Identify carriers that require service improvement or cost-performance review.

