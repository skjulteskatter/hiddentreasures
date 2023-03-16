reset:
	psql -h localhost -p 5400 -U app postgres < ./special/00-reset.sql
	goose postgres "user=app dbname=app port=5400 host=localhost sslmode=disable" up
	psql -h localhost -p 5400 -U app app < ./special/01-admin-user.sql
