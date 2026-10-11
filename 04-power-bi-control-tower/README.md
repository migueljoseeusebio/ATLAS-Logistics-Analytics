# 04 — Power BI Logistics Control Tower

## Central question

> How is the operation performing, and where should the team act first?

## Analytical scope

- Shipment volume and completion
- OTD and OTIF
- Delayed shipments
- Average lead time
- Cost per shipment
- Carrier performance

## Method

The dashboard uses a star schema and explicit DAX measures so that filters, denominators and incomplete deliveries are handled consistently.

## Validation

- Reconcile headline measures with source totals.
- Test results under carrier, date and destination filters.
- Check zero-denominator and blank cases.
- Compare selected measures with independent SQL or spreadsheet calculations.

## Decision supported

Prioritise carriers, routes or service failures for operational investigation.

## Public evidence

The `.pbix` file remains out of the initial release pending review of embedded data, connections and metadata. Dashboard screenshots and measure definitions will be published first.

