# Restore backup

Démarrer la base de données, puis :

```bash
cat monica.sql | docker-compose exec -T db mysql -u homestead -psecret monica
```
