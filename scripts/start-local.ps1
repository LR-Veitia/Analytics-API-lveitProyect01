# Script para iniciar FastAPI localmente en puerto 8001
Write-Host "🚀 Iniciando Analytics API en modo desarrollo local..." -ForegroundColor Green

# Verificar que el entorno virtual esté activo
if (-not $env:VIRTUAL_ENV) {
    Write-Host "⚠️  El entorno virtual no está activo. Activándolo..." -ForegroundColor Yellow
    & ".\venv\Scripts\Activate.ps1"
}

# Verificar que TimescaleDB esté funcionando
Write-Host "🔍 Verificando TimescaleDB..." -ForegroundColor Cyan
$dbStatus = docker exec analytics_timescaledb pg_isready -U postgres 2>$null
if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ TimescaleDB está funcionando correctamente" -ForegroundColor Green
} else {
    Write-Host "❌ TimescaleDB no está funcionando. Iniciándolo..." -ForegroundColor Red
    docker-compose -f docker-compose.simple.yml up timescaledb -d
    Start-Sleep -Seconds 5
}

# Iniciar FastAPI
Write-Host "🌐 Iniciando FastAPI en puerto 8001..." -ForegroundColor Yellow
Write-Host ""
Write-Host "📊 URLs disponibles:" -ForegroundColor Cyan
Write-Host "   🌐 API:          http://127.0.0.1:8001" -ForegroundColor White
Write-Host "   📖 Docs:        http://127.0.0.1:8001/docs" -ForegroundColor White
Write-Host "   🔍 ReDoc:       http://127.0.0.1:8001/redoc" -ForegroundColor White
Write-Host ""
Write-Host "🛑 Presiona Ctrl+C para detener el servidor" -ForegroundColor Red
Write-Host ""

# Iniciar uvicorn con configuración desde .env
uvicorn main:app --host 127.0.0.1 --port 8001 --reload