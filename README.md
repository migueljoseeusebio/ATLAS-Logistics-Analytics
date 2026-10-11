# ATLAS Logistics Analytics

Portfolio project connecting logistics operations, data quality, analytics and systems integration.

## Purpose

ATLAS turns a simulated shipment operation into an end-to-end analytical workflow. The project demonstrates how operational questions move through data preparation, modelling, KPI design, analysis and executive communication.

> Problem → Data → Method → Validation → Insight → Decision

The emphasis is not only on producing technical outputs. Each stage documents how the result was checked, what its limitations are and which operational decision it can support.

## Business scenario

A logistics team needs reliable visibility over shipment volume, delivery performance, lead time, cost and carrier performance. Data originates in operational systems and may contain missing values, duplicates, invalid dates or inconsistent reference data.

ATLAS develops a controlled path from those raw records to decision-ready information.

## Portfolio map

| Stage | Business question | Tools and concepts | Evidence |
| --- | --- | --- | --- |
| [01 — Excel Logistics](./01-excel-logistics/) | Are the operational calculations correct? | Excel, lookups, conditional aggregation, pivot tables | Validation workbook summary |
| [02 — Data Quality](./02-data-quality/) | Can the source data be trusted? | Power Query, profiling, nulls, duplicates, quality rules | Quality-gate design |
| [03 — Data Modeling](./03-data-modeling/) | Is the data structured for reliable analysis? | Star schema, fact and dimension tables, grain, relationships | Model specification |
| [04 — Power BI Control Tower](./04-power-bi-control-tower/) | Where is logistics performance off target? | Power BI, DAX, KPIs, filter context | Dashboard case study |
| [05 — SQL Logistics](./05-sql-logistics/) | How do carriers compare on service and cost? | PostgreSQL, joins, CTE-ready logic, filtered aggregates, validation queries | Executable SQL analysis |
| [06 — KPI Dictionary](./06-kpi-dictionary/) | What does each metric mean and when should it be used? | OTIF, OTD, lead time, cost, capacity, SLA | KPI governance framework |
| [07 — Executive Brief](./07-executive-brief/) | What should leadership act on? | Data storytelling, visual hierarchy, recommendations | Three-minute executive narrative |
| [08 — Integration Lab](./08-integration-lab/) | How can interface errors affect analytics? | API concepts, JSON, XML, CSV, HTTP status codes, reconciliation | Simulated ERP-to-TMS examples |

## Architecture

```text
ERP / source files
        |
        v
Power Query and quality gates
        |
        v
Logistics star schema
        |
        +--------------------+
        |                    |
        v                    v
 PostgreSQL analysis    Power BI model
        |                    |
        +---------+----------+
                  v
        KPIs, insight and decisions
```

## Core metrics

- On-Time Delivery (OTD)
- On-Time In-Full (OTIF)
- Lead Time
- Cost per Shipment
- Fill Rate
- Capacity Utilization
- Dwell Time
- SLA Compliance
- Incident Rate and MTTR

Every metric is treated as a governed definition: formula, required data, interpretation, limitations and supported decision.

## Validation approach

ATLAS uses explicit controls instead of assuming that a technically valid output is a correct one:

1. Reconcile source and output row counts.
2. Test uniqueness and required fields.
3. Identify impossible values and date sequences.
4. Check calculation denominators and treatment of incomplete deliveries.
5. Compare results across tools where practical.
6. Record assumptions, limitations and corrections.

## Responsible use of AI

AI supported formulation, implementation and documentation. Human validation remained mandatory:

1. Define the operational problem.
2. Ask for a proposed solution.
3. Understand the generated logic.
4. Validate it against data and business rules.
5. Correct errors and document the evidence.

No real company or customer data is used in the public portfolio. Names, identifiers and transactions are fictional.

## Repository status

The text-based SQL and systems-integration examples are ready for review. Workbook, Power BI and presentation evidence will be added only after metadata removal and visual quality assurance.

## Author

Miguel José Eusébio

[GitHub profile](https://github.com/migueljoseeusebio)

