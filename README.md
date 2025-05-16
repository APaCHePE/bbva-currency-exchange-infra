# BBVA Currency Exchange - Guía de Levantamiento Local

Este proyecto orquesta los componentes del sistema Currency Exchange:

- **Base de Datos PostgreSQL 15**
- **Backend Java (R2DBC + Spring Boot)**
- **Frontend Vue 3 + Vite**

## 📦 Requisitos Previos

- Docker
- Docker Compose

## 🚀 Estructura del Proyecto

```
/bbva
  ├── bbva-currency-exchange-api        # Backend Java
  ├── bbva-currency-exchange-front      # Frontend Vue 3
  └── bbva-currency-exchange-infra      # Infraestructura (este folder)
```

## ⚠️ Puertos Utilizados

| Servicio  | Puerto Local |
|----------|--------------|
| Base de Datos PostgreSQL | 5432 |
| Backend Java            | 4040 |
| Frontend Vue            | 8080 |

Asegúrate que estos puertos estén **libres antes de continuar**.

## 🛠️ Levantamiento del Sistema

1. Abre una terminal y navega a la carpeta `bbva-currency-exchange-infra`.

2. Ejecuta el siguiente comando para construir y levantar todo:

```bash
docker-compose up --build
```

Este comando levantará:

- **PostgreSQL** en `localhost:5432` (usuario y clave: `postgres`)
- **Backend Java** en `http://localhost:4040`
- **Frontend Vue** en `http://localhost:8080`

> ✅ La base de datos se inicializará automáticamente con tablas y datos de ejemplo.

## 🔄 Reiniciar desde Cero (si la base ya existe)

Si necesitas volver a levantar todo desde cero (recrear la base con datos):

```bash
docker-compose down -v
docker-compose up --build
```

## 🧪 Validaciones

1. Accede al **Frontend**:
   - [http://localhost:8080](http://localhost:8080)

2. Accede al **Backend** (por ejemplo, usando Postman o CURL):
   - `http://localhost:4040`

3. Valida la **Base de Datos**:
   - Cliente PostgreSQL como DBeaver o PgAdmin
   - Host: `localhost`
   - Puerto: `5432`
   - Usuario: `postgres`
   - Clave: `postgres`
   - Base de datos: `exchange_db`

## 📝 Observaciones

- El Frontend está configurado para consumir el Backend en `http://localhost:4040`.
- Puedes modificar esta URL en el archivo `docker-compose.yml` si fuera necesario.