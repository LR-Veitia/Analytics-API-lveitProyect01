# Script para iniciar todo el proyecto
Write-Host "🚀 Iniciando Analytics API Project..." -ForegroundColor Green

# Verificar que Docker está ejecutándose
$dockerRunning = docker info 2>$null
if (-not $dockerRunning) {
    Write-Host "❌ Docker no está ejecutándose. Inicia Docker Desktop primero." -ForegroundColor Red
    exit 1
}

# Construir imágenes si no existen
Write-Host "🔨 Construyendo imágenes Docker..." -ForegroundColor Yellow
docker-compose build

# Iniciar servicios
Write-Host "▶️  Iniciando servicios..." -ForegroundColor Yellow
docker-compose up -d

# Esperar a que los servicios estén listos
Write-Host "⏳ Esperando a que los servicios estén listos..." -ForegroundColor Yellow
Start-Sleep -Seconds 10

# Verificar estado de los servicios
Write-Host "📊 Estado de los servicios:" -ForegroundColor Cyan
docker-compose ps

Write-Host ""
Write-Host "✅ Proyecto iniciado! Servicios disponibles:" -ForegroundColor Green
Write-Host "   🌐 FastAPI:       http://localhost:8000" -ForegroundColor White
Write-Host "   📊 Docs API:      http://localhost:8000/docs" -ForegroundColor White
Write-Host "   🔍 Adminer:       http://localhost:8080" -ForegroundColor White
Write-Host "   📈 Grafana:       http://localhost:3000" -ForegroundColor White
Write-Host "   📓 Jupyter:       http://localhost:8888" -ForegroundColor White
Write-Host ""
Write-Host "🗄️  Credenciales de base de datos:" -ForegroundColor Yellow
Write-Host "   Host: localhost:5432" -ForegroundColor White
Write-Host "   Database: analytics_db" -ForegroundColor White
Write-Host "   User: postgres" -ForegroundColor White
Write-Host "   Password: postgres_password" -ForegroundColor White