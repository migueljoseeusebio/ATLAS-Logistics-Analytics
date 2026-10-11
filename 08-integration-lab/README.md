# 08 — Systems Integration Lab

## Problem

An ERP sends shipment information to a TMS. Structural, reference or business-rule errors can prevent records from reaching analytics and can distort service KPIs.

## Reference flow

```text
ERP
 |
 | JSON / XML / CSV
 v
Integration API
 |
 | validation and HTTP response
 v
TMS
 |
 v
Database → Analytics / Power BI
```

## Simulated interface

| Operation | Method | Endpoint | Purpose |
| --- | --- | --- | --- |
| Create shipment | `POST` | `/api/v1/shipments` | Send a shipment from ERP to TMS |
| Get shipment | `GET` | `/api/v1/shipments/{shipment_id}` | Retrieve shipment status |

## Evidence included

- Valid, invalid and deliberately malformed JSON requests
- The same shipment represented in XML and CSV
- Simulated `201`, `400` and `422` responses
- Examples of syntax, type, reference and business-rule errors

## Validation approach

Reconcile requests sent, accepted and rejected. Correct the cause without changing the intended transaction, then evaluate the impact of excluded records on OTD, OTIF, lead time and cost per shipment.

All organisations, identifiers and transactions in this lab are fictional.

