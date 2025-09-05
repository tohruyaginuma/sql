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

## 🔑 Access the Database

Connect to PostgreSQL with:

```bash
docker exec -it local-postgres psql -U postgres -d shop
```

- `-U postgres` → username
- `-d app_db` → database name

You should see the prompt:

```
app_db=#
```

This means you are inside PostgreSQL's interactive shell.

---

## 📝 Example SQL Commands

```sql
-- Create a table
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  age INT
);

-- Insert some rows
INSERT INTO users (name, age) VALUES ('Alice', 25), ('Bob', 30);

-- Query data
SELECT * FROM users;
```

Example output:

```
 id |  name  | age
----+--------+-----
  1 | Alice  |  25
  2 | Bob    |  30
```

---

## ❌ Exit

Type:

```sql
\q
```

---

## 🛑 Stop / Remove the Container

- Stop the container:

```bash
docker compose down
```

- Stop and remove the database data as well:

```bash
docker compose down -v
```

---

Enjoy practicing SQL with PostgreSQL 🚀
