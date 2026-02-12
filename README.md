# October CMS - Docker Setup

A Dockerized [October CMS](https://octobercms.com) (v3.x) project running on PHP 8.1, Nginx, and MySQL 8.0.

## Tech Stack

- **October CMS 3.x** (Laravel 9)
- **PHP 8.1** (FPM)
- **Nginx** (Alpine)
- **MySQL 8.0**
- **Docker Compose**

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Quick Start

1. **Clone the repository:**

   ```bash
   git clone https://github.com/kailashkds/demo-octobercms
   cd octomberCms
   ```

2. **Configure environment (optional):**

   Copy and edit the `.env` file to customize database credentials:

   ```bash
   cp .env.example .env
   ```

   Default values:
   | Variable               | Default       |
   |------------------------|---------------|
   | `DB_DATABASE`          | `octobercms`  |
   | `DB_USERNAME`          | `octobercms`  |
   | `DB_PASSWORD`          | `secret`      |
   | `MYSQL_ROOT_PASSWORD`  | `rootsecret`  |

3. **Run the full setup:**

   ```bash
   make setup
   ```

   This will build the containers, install October CMS via Composer, and run database migrations.

4. **Set the admin password:**

   ```bash
   make admin
   ```

   This sets the admin user password to `admin`.

5. **Access the site:**

   - **Frontend:** http://localhost:8080
   - **Backend:** http://localhost:8080/backend

## Make Commands

| Command                          | Description                              |
|----------------------------------|------------------------------------------|
| `make setup`                     | Full setup (build, install, migrate)     |
| `make up`                        | Start all containers                     |
| `make down`                      | Stop all containers                      |
| `make build`                     | Build/rebuild containers                 |
| `make install`                   | Install October CMS via Composer         |
| `make migrate`                   | Run database migrations                  |
| `make admin`                     | Set admin password to `admin`            |
| `make artisan cmd="your:command"`| Run an artisan command                   |
| `make shell`                     | Open a shell in the app container        |
| `make logs`                      | Tail container logs                      |
| `make restart`                   | Restart all containers                   |

## Project Structure

```
├── docker/
│   ├── nginx/default.conf    # Nginx configuration
│   └── php/Dockerfile        # PHP 8.1-FPM image
├── src/                      # October CMS application
│   ├── modules/              # Core modules
│   ├── plugins/              # Plugins
│   ├── themes/               # Themes
│   ├── config/               # Configuration files
│   ├── storage/              # Logs, cache, uploads
│   └── ...
├── docker-compose.yml
├── Makefile
└── .env
```

## License

October CMS is proprietary software. See [octobercms.com](https://octobercms.com) for licensing details.
