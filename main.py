from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from dotenv import load_dotenv
import os

# Cargar variables de entorno
load_dotenv()

app = FastAPI(
    title="Analytics API",
    description="API para análisis de datos web con TimescaleDB",
    version="1.0.0"
)

# Configurar CORS
cors_origins = os.getenv("BACKEND_CORS_ORIGINS", '["*"]')
if isinstance(cors_origins, str):
    import json
    try:
        cors_origins = json.loads(cors_origins)
    except:
        cors_origins = ["*"]

app.add_middleware(
    CORSMiddleware,
    allow_origins=cors_origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
def read_root():
    return {
        "message": "Analytics API está funcionando!",
        "status": "healthy",
        "version": "1.0.0"
    }

@app.get("/health")
def health_check():
    return {
        "status": "healthy",
        "database": "connected" if os.getenv("DATABASE_URL") else "not_configured",
        "redis": "connected" if os.getenv("REDIS_URL") else "not_configured"
    }

@app.get("/info")
def get_info():
    return {
        "database_url": os.getenv("DATABASE_URL", "Not configured"),
        "redis_url": os.getenv("REDIS_URL", "Not configured"),
        "environment": os.getenv("ENVIRONMENT", "development"),
        "debug": os.getenv("DEBUG", "false")
    }