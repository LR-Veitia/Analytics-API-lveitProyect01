# Script para parar todo el proyecto
Write-Host "🛑 Deteniendo Analytics API Project..." -ForegroundColor Red

# Parar todos los servicios
docker-compose down

Write-Host "✅ Proyecto detenido." -ForegroundColor Green
Write-Host ""
Write-Host "💡 Para reiniciar el proyecto, ejecuta: .\scripts\start.ps1" -ForegroundColor Yellow