# Commit #2 - Estado actual del proyecto: Analytics API con FastAPI y PostgreSQL

Este README corresponde al **commit #2** del proyecto.

## Descripción

API de analítica construida con **FastAPI** y **PostgreSQL** orientada a series temporales.

## Estado actual

- Estructura básica del proyecto creada
- Archivo `.env` configurado para desarrollo local
- Dockerfile multi-stage listo para desarrollo y producción
- Dependencias Python gestionadas con `requirements.txt`
- Configuración para conexión a PostgreSQL y Redis en entorno local
- Comando de arranque con Uvicorn para desarrollo y producción

## ¿Qué puede hacerse ya?

- Construir la imagen Docker y levantar el contenedor en modo desarrollo o producción
- Configurar variables de entorno para la base de datos y otros servicios
- Arrancar el servidor FastAPI (el archivo `main.py` debe estar presente)
- Acceder a la documentación interactiva de FastAPI en `/docs` (si el endpoint existe en `main.py`)
- Conectar con una base de datos PostgreSQL local (si está disponible)

## ¿Qué no puede hacerse aún?

- No hay endpoints implementados (más allá de posibles ejemplos en `main.py`)
- No hay lógica de autenticación ni manejo avanzado de usuarios
- No hay integración completa con Redis ni migraciones de base de datos
- No hay tests automatizados ni scripts de migración

## Instalación y uso

1. Clona el repositorio:
    ```sh
    git clone https://github.com/LR-Veitia/Analytics-API-lveitProyect01.git
    cd Analytics-API-lveitProyect01
    ```

2. Configura el archivo `.env` con tus credenciales locales.

3. Construye y ejecuta el contenedor Docker:
    ```sh
    docker build -t analytics-api-dev --target development .
    docker run --env-file .env -p 8000:8000 analytics-api-dev
    ```

4. Accede a la API (si está implementada) en:
    - [http://localhost:8000/docs](http://localhost:8000/docs)

## Estructura del proyecto

```
├── app/                # (pendiente de implementación)
├── main.py             # Punto de entrada FastAPI
├── requirements.txt    # Dependencias Python
├── Dockerfile          # Imagen multi-stage
├── .env                # Variables de entorno
└── README.md           # Este archivo
```

## Próximos pasos

- Implementar endpoints de la API
- Agregar autenticación y manejo de usuarios
- Integrar Redis y migraciones de base de datos
- Crear tests automatizados

---

*Este README refleja el estado actual del proyecto en el commit #2. Actualizado conforme avances en el desarrollo.*