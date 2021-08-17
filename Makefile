build:
	docker-compose -f ./Docker/docker-compose.yaml up -d mc-build
	docker-compose -f ./Docker/docker-compose.yaml up -d mc-postgres
	docker exec -it mc-postgres chmod ugo+xrw -R /docker-entrypoint-initdb.d/
	docker exec -it mc-postgres /docker-entrypoint-initdb.d/01-init.sh
	docker exec -it mc-build composer update --prefer-source
	docker exec -it mc-build yarn --cwd /var/www/html/mcCore
	docker exec -it mc-build yarn --cwd /var/www/html/mcCore run dev
	docker exec -it mc-build chown 1000:1000 -R /var/www/html
	docker exec -e APP_CONFIG_PATH=/var/www/html/appSettings/config/generis.conf.php -it mc-build /usr/local/bin/php mcCore/artisan setup:seed /var/www/html/seed.json
	docker exec -it mc-build chown 1000:1000 -R /var/www/html/appSettings
	docker exec -it mc-build chmod ugo+xrw -R /var/www/html/appSettings
	docker exec -it mc-build chown 1000:1000 -R /var/www/html/settings
	docker exec -it mc-build chmod ugo+xrw -R /var/www/html/settings
	docker-compose -f ./Docker/docker-compose.yaml down

run:
	docker-compose -f ./Docker/docker-compose.yaml up -d mc-build
	docker-compose -f ./Docker/docker-compose.yaml up -d mc-phpfpm
	docker-compose -f ./Docker/docker-compose.yaml up -d mc-backoffice-nginx
	docker-compose -f ./Docker/docker-compose.yaml up -d mc-api-nginx
	docker-compose -f ./Docker/docker-compose.yaml up -d mc-postgres
	docker-compose -f ./Docker/docker-compose.yaml up -d mc-director-watch
	docker-compose -f ./Docker/docker-compose.yaml up -d mc-director-watch-nginx

stop:
	docker-compose -f ./Docker/docker-compose.yaml down
