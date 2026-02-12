.PHONY: up down build install migrate seed artisan shell logs restart

# Start all containers
up:
	docker-compose up -d

# Stop all containers
down:
	docker-compose down

# Build/rebuild containers
build:
	docker-compose up -d --build

# Install October CMS via Composer
install:
	docker-compose exec app composer create-project october/october . --no-interaction

# Run database migrations
migrate:
	docker-compose exec app php artisan october:migrate

# Create admin user
admin:
	docker-compose exec app php artisan october:passwd admin admin

# Run artisan commands (usage: make artisan cmd="your:command")
artisan:
	docker-compose exec app php artisan $(cmd)

# Open a shell in the app container
shell:
	docker-compose exec app bash

# View logs
logs:
	docker-compose logs -f

# Restart all containers
restart:
	docker-compose restart

# Full setup: build, install, migrate
setup: build
	@echo "Waiting for containers to be ready..."
	@sleep 10
	$(MAKE) install
	$(MAKE) migrate
	@echo ""
	@echo "October CMS is ready!"
	@echo "  Site:    http://localhost:8080"
	@echo "  Backend: http://localhost:8080/backend"
	@echo ""
	@echo "Run 'make admin' to set admin password to 'admin'"
