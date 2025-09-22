# PostgreSQL Docker Compose Usage Guide

This guide explains how to set up and use PostgreSQL locally with Docker Compose for practicing SQL.

---

## 🚀 Start the Container

Run the following command in the directory containing `docker-compose.yml`:

```bash
docker compose up -d
```

This starts PostgreSQL in the background.

---

## 🔑 Access the Container

Connect to PostgreSQL with:

```bash
docker exec -it local-postgres bash
```

---

## 🔑 Access the Database

Connect to PostgreSQL with:

```bash
docker exec -it local-postgres psql -U postgres -d shop
```
