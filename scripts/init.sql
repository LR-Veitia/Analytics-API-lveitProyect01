-- Inicialización de TimescaleDB
CREATE EXTENSION IF NOT EXISTS timescaledb;

-- Crear esquemas
CREATE SCHEMA IF NOT EXISTS analytics;
CREATE SCHEMA IF NOT EXISTS public;

-- Crear tabla de eventos de analytics
CREATE TABLE IF NOT EXISTS analytics.page_views (
    time TIMESTAMPTZ NOT NULL,
    session_id TEXT,
    user_id TEXT,
    url TEXT NOT NULL,
    referer TEXT,
    user_agent TEXT,
    ip_address INET,
    country TEXT,
    city TEXT,
    device_type TEXT,
    browser TEXT,
    os TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Convertir en hypertable
SELECT create_hypertable('analytics.page_views', 'time', if_not_exists => TRUE);

-- Crear índices para mejorar performance
CREATE INDEX IF NOT EXISTS idx_page_views_url ON analytics.page_views (url);
CREATE INDEX IF NOT EXISTS idx_page_views_session ON analytics.page_views (session_id);
CREATE INDEX IF NOT EXISTS idx_page_views_user ON analytics.page_views (user_id);
CREATE INDEX IF NOT EXISTS idx_page_views_country ON analytics.page_views (country);

-- Configurar retention policy (opcional - mantener datos por 1 año)
-- SELECT add_retention_policy('analytics.page_views', INTERVAL '1 year');

-- Crear continuous aggregate para estadísticas por hora
CREATE MATERIALIZED VIEW IF NOT EXISTS analytics.hourly_page_views
WITH (timescaledb.continuous) AS
SELECT 
    time_bucket('1 hour', time) AS bucket,
    url,
    COUNT(*) AS page_views,
    COUNT(DISTINCT session_id) AS unique_sessions,
    COUNT(DISTINCT user_id) AS unique_users
FROM analytics.page_views
GROUP BY bucket, url;

-- Refresh policy para el continuous aggregate
SELECT add_continuous_aggregate_policy('analytics.hourly_page_views',
    start_offset => INTERVAL '1 day',
    end_offset => INTERVAL '1 hour',
    schedule_interval => INTERVAL '1 hour');

-- Crear tabla de métricas de aplicación
CREATE TABLE IF NOT EXISTS analytics.app_metrics (
    time TIMESTAMPTZ NOT NULL,
    metric_name TEXT NOT NULL,
    metric_value DOUBLE PRECISION,
    tags JSONB,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Convertir en hypertable
SELECT create_hypertable('analytics.app_metrics', 'time', if_not_exists => TRUE);

-- Índices para métricas
CREATE INDEX IF NOT EXISTS idx_app_metrics_name ON analytics.app_metrics (metric_name);
CREATE INDEX IF NOT EXISTS idx_app_metrics_tags ON analytics.app_metrics USING GIN (tags);

-- Datos de ejemplo para testing
INSERT INTO analytics.page_views (time, session_id, user_id, url, country, device_type) VALUES
    (NOW() - INTERVAL '1 hour', 'session1', 'user1', '/home', 'US', 'desktop'),
    (NOW() - INTERVAL '2 hours', 'session2', 'user2', '/about', 'UK', 'mobile'),
    (NOW() - INTERVAL '3 hours', 'session3', 'user3', '/products', 'CA', 'tablet');

-- Datos de ejemplo para métricas
INSERT INTO analytics.app_metrics (time, metric_name, metric_value, tags) VALUES
    (NOW() - INTERVAL '1 hour', 'cpu_usage', 75.5, '{"server": "web-01", "env": "prod"}'),
    (NOW() - INTERVAL '2 hours', 'memory_usage', 82.3, '{"server": "web-01", "env": "prod"}'),
    (NOW() - INTERVAL '3 hours', 'response_time', 145.2, '{"endpoint": "/api/users", "method": "GET"}');

-- Verificar que todo está funcionando
SELECT 'TimescaleDB inicializado correctamente' as status;