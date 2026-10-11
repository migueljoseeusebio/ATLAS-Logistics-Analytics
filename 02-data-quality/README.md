# 02 — Power Query and Data Quality

## Problem

Raw transport data can contain missing fields, duplicates, incorrect types and invalid business values. Loading it directly into a dashboard makes every downstream metric less trustworthy.

## Method

Power Query is used to define repeatable import, typing, cleaning and transformation steps. Quality gates separate valid records from exceptions that require correction or explanation.

## Quality controls

- Required fields and null rates
- Duplicate shipment identifiers
- Valid date sequences
- Non-negative cost and quantity values
- Reference-data matches
- Row-count reconciliation before and after transformations

## Decision supported

Decide whether a dataset can proceed to modelling and quantify the records that need remediation.

## Public evidence

A transformation diagram, quality summary and anonymised sample will be added after workbook review.

