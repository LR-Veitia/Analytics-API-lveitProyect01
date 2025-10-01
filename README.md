
# Commit #4 - Estado actual del proyecto: Analytics API con FastAPI, PostgreSQL y Jupyter

Este README corresponde al **commit #4** del proyecto.

## Descripción

API de analítica construida con **FastAPI** y **PostgreSQL**, orientada a series temporales, ahora con **Jupyter Notebook** integrado para pruebas y experimentación rápida.

## Estado actual

* Todo lo que estaba en el **commit #3**.
* **Jupyter Notebook** agregado y funcionando dentro del entorno Docker.
* Primer notebook de prueba incluido (`notebooks/prueba.ipynb`).
* **Routing básico** implementado en `main.py` (ejemplo de endpoint funcional).
* Docker Compose actualizado para levantar también Jupyter Notebook.
* `.dockerignore` y configuración de `.env` mantenidos para optimizar el build y gestión de variables.

## ¿Qué puede hacerse ya?

* Levantar todos los servicios (API, TimescaleDB, Redis, Jupyter) con un solo comando:

```sh
docker compose up
```

* Acceder a la API en desarrollo y ver la documentación interactiva en `/docs`.
* Abrir Jupyter Notebook desde el contenedor y ejecutar notebooks de prueba:

```sh
http://localhost:8888
```

* Conectar con la base de datos PostgreSQL local y realizar queries desde notebooks o endpoints.
* Probar el routing básico ya implementado en la API.

## ¿Qué no puede hacerse aún?

* No hay endpoints complejos implementados (solo ejemplos y routing básico).
* No hay lógica avanzada de autenticación ni manejo de usuarios.
* Redis y migraciones de base de datos todavía no integrados completamente.
* Tests automatizados pendientes.

## Instalación y uso

1. Clona el repositorio:

```sh
git clone https://github.com/LR-Veitia/Analytics-API-lveitProyect01.git
cd Analytics-API-lveitProyect01
```

2. Configura el archivo `.env` con tus credenciales locales.

3. Levanta el entorno completo con Docker Compose:

```sh
docker compose up
```

4. Accede a la API:

* Documentación interactiva: [http://localhost:8001/docs](http://localhost:8001/docs)

5. Accede a Jupyter Notebook:

* [http://localhost:8888](http://localhost:8888)

## Estructura del proyecto

```
├── app/                # Código de la API (pendiente de implementación completa)
├── notebooks/          # Primer notebook de prueba
│   └── prueba.ipynb
├── main.py             # Punto de entrada FastAPI con routing básico
├── requirements.txt    # Dependencias Python
├── Dockerfile          # Imagen multi-stage
├── compose.yaml        # Orquestación de servicios con Docker Compose (incluye Jupyter)
├── .env                # Variables de entorno
├── .dockerignore       # Exclusión de archivos para el build de Docker
└── README.md           # Este archivo
```

## Próximos pasos
* Implementar endpoints completos de la API.
* Agregar autenticación y manejo de usuarios.
* Integrar Redis y migraciones de base de datos.
* Crear tests automatizados.
* Ampliar notebooks para análisis y experimentación.


