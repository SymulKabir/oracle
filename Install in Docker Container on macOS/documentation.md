### 🧩 Use Oracle Database in Docker Container on macOS

#### Pull the image (example — Free image):

```bash
docker pull gvenzl/oracle-free:latest
```
----

#### Create a persistent data folder to store Oracle database data:

```bash
mkdir -p ~/oracle/oradata
chmod a+rw ~/oracle/oradata
```
---

#### Start the container:
```bash
docker run -d --name oracle-db \
  -e ORACLE_PASSWORD=MyStrongPassword123 \
  -p 1521:1521 -p 5500:5500 \
  gvenzl/oracle-free:latest

```
**🧠 Explanation:**
- `ORACLE_PASSWORD` (or `ORACLE_PWD` in some images) sets the SYS/SYSTEM password.
- -e ORACLE_PASSWORD=MyStrongPassword123 → sets the admin passwords (SYS, SYSTEM, PDBADMIN)
- -p 1521:1521 → exposes Oracle’s main database port
- -p 5500:5500 → exposes the Enterprise Manager web console
---

#### Watch the logs until the DB is ready:
```bash
docker logs -f oracle-db
# wait for the message: "DATABASE IS READY TO USE!"
```
- When you see that log line the DB is up and ready.

#### Enter inside the container and connect with oracle database

```bash
docker exec -it oracle-db /bin/bash
sqlplus system/YourStrongPassword123@//localhost:1521/FREEPDB1
```

#### How to reset SYS user password:
Enter your oracle docker container, then:
```bash
sqlplus / as sysdba
ALTER USER SYS IDENTIFIED BY MyNewPass123;
```
---
