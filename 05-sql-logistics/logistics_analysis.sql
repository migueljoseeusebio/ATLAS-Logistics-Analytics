-- ATLAS 2.0 — Gate 4 | SQL
-- Base de dados: atlas_2_0
-- PostgreSQL 15
-- Data: 2026-10-09
-- Objetivo: modelo logístico e KPIs por transportadora
-- PRÉ-REQUISITOS
-- As tabelas dim_date, dim_destination, dim_customer,
-- dim_carrier e fact_shipment devem existir na base atlas_2_0.
--
-- Ordem de importação dos CSV:
-- 1. dim_date
-- 2. dim_destination
-- 3. dim_customer
-- 4. dim_carrier
-- 5. fact_shipment
--
-- Importação: CSV, UTF8, Header ativo, delimitador vírgula.
CREATE OR REPLACE VIEW vw_carrier_performance AS
SELECT
    c.carrier_name,

    COUNT(*) AS total_shipments,

    SUM(f.pallets) AS total_pallets,

    SUM(f.cost_eur) AS total_cost_eur,

    ROUND(
        SUM(f.cost_eur)::numeric / NULLIF(COUNT(*), 0),
        2
    ) AS cost_per_shipment,

    COUNT(*) FILTER (
        WHERE f.actual_delivery_date IS NOT NULL
    ) AS completed_deliveries,

    COUNT(*) FILTER (
        WHERE f.actual_delivery_date <= f.expected_delivery_date
    ) AS on_time_deliveries,

    COUNT(*) FILTER (
        WHERE f.actual_delivery_date > f.expected_delivery_date
    ) AS late_deliveries,

    ROUND(
        100.0 *
        COUNT(*) FILTER (
            WHERE f.actual_delivery_date <= f.expected_delivery_date
        )
        /
        NULLIF(
            COUNT(*) FILTER (
                WHERE f.actual_delivery_date IS NOT NULL
            ),
            0
        ),
        2
    ) AS otd_percent,

    ROUND(
        AVG(f.actual_delivery_date - f.shipment_date)::numeric,
        2
    ) AS avg_lead_time_days

FROM fact_shipment AS f
INNER JOIN dim_carrier AS c
    ON f.carrier_id = c.carrier_id
GROUP BY c.carrier_name;

SELECT *
FROM vw_carrier_performance
ORDER BY
    otd_percent DESC NULLS LAST,
    carrier_name;

-- VALIDAÇÃO DAS CONTAGENS

SELECT 'dim_date' AS table_name, COUNT(*) AS row_count
FROM dim_date

UNION ALL

SELECT 'dim_destination', COUNT(*)
FROM dim_destination

UNION ALL

SELECT 'dim_customer', COUNT(*)
FROM dim_customer

UNION ALL

SELECT 'dim_carrier', COUNT(*)
FROM dim_carrier

UNION ALL

SELECT 'fact_shipment', COUNT(*)
FROM fact_shipment;

-- AUDITORIA DE QUALIDADE

SELECT
    COUNT(*) AS total_registos,

    COUNT(*) - COUNT(DISTINCT shipment_id)
        AS shipments_duplicados,

    COUNT(*) FILTER (
        WHERE cost_eur < 0
    ) AS custos_negativos,

    COUNT(*) FILTER (
        WHERE pallets < 0
    ) AS paletes_negativas,

    COUNT(*) FILTER (
        WHERE actual_delivery_date < shipment_date
    ) AS datas_invalidas

FROM fact_shipment;
