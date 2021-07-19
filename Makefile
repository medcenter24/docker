DOCTOR_GUI_DIR = doctor
DIRECTOR_GUI_DIR = director
MC_CORE_DIR = app

build:
	docker-compose -f ./Docker/docker-compose.yaml up -d mc-build
	docker-compose -f ./Docker/docker-compose.yaml up -d mc-postgres
	docker exec -it mc-build composer update --prefer-source
	docker exec -it mc-build chown 1000:1000 -R /var/www/html/
	docker exec -it mc-build chmod 0677 -R /var/www/html
	docker exec -it mc-build /usr/local/bin/php mcCore/artisan setup:seed /var/www/html/seed.json
	docker exec -it mc-build chown 1000:1000 -R /var/www/html/appSettings
	docker exec -it mc-build chmod ugo+rw -R /var/www/html/appSettings
	docker-compose -f ./Docker/docker-compose.yaml down

run:
	docker-compose -f ./Docker/docker-compose.yaml up -d mc-phpfpm
	docker-compose -f ./Docker/docker-compose.yaml up -d mc-backoffice-nginx
	docker-compose -f ./Docker/docker-compose.yaml up -d mc-api-nginx
	docker-compose -f ./Docker/docker-compose.yaml up -d mc-postgres

stop:
	docker-compose -f ./Docker/docker-compose.yaml down
