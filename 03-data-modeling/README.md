# 03 — Logistics Data Model

## Problem

A flat shipment file mixes events, customers, carriers, destinations and dates. This makes relationships ambiguous and increases the risk of double counting.

## Method

The analytical model uses a shipment fact table surrounded by conformed dimensions.

```text
                    DimDate
                       |
DimCustomer --- FactShipment --- DimCarrier
                       |
                DimDestination
```

## Design decisions

- Grain: one row per shipment in `FactShipment`.
- Measures such as cost and pallets belong in the fact table.
- Descriptive attributes belong in dimensions.
- One-to-many relationships filter from dimensions to the fact.
- Keys and row counts are tested before measures are created.

## Decision supported

Provide a consistent semantic foundation for service, time, volume and cost analysis.

## Public evidence

The next release will include a clean schema diagram and a small synthetic dataset.

