# PickMeUp - Backend API (Laravel)

This repository contains the Laravel backend API for the PickMeUp application.

## Prerequisites

Before you begin, ensure you have the following installed:
- PHP 8.0 or higher
- Composer
- MySQL 5.7 or higher
- Node.js and NPM
- Laravel CLI

## Installation

1. Clone the repository:
```bash
git clone https://github.com/Jundy25/backend_pickmeup_trial.git
cd backend_pickmeup_trial
```

2. Install PHP dependencies:
```bash
composer install
```

3. Copy the `.env.example` file to create your own `.env` file:
```bash
cp .env.example .env
```

4. Generate an application key:
```bash
php artisan key:generate
```

5. Configure your database connection in the `.env` file:
```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=pickmeup
DB_USERNAME=root
DB_PASSWORD=
```

6. Run migrations and seed the database:
```bash
php artisan migrate --seed
```

7. Start the development server:
```bash
php artisan serve
```

The API will be accessible at `http://localhost:8000`.

## API Credentials

### Default Admin User
- Email: `admin@pickmeup.com`
- Password: `password`

### API Authentication
The API uses Laravel Sanctum for authentication. To authenticate requests, include the following header:
```
Authorization: Bearer {your_api_token}
```

## Environment Variables

Ensure the following environment variables are set in your `.env` file:

```
APP_NAME=PickMeUp
APP_ENV=local
APP_KEY=base64:your-generated-key
APP_DEBUG=true
APP_URL=http://localhost:8000

LOG_CHANNEL=stack
LOG_LEVEL=debug

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=pickmeup
DB_USERNAME=root
DB_PASSWORD=

BROADCAST_DRIVER=log
CACHE_DRIVER=file
QUEUE_CONNECTION=sync
SESSION_DRIVER=file
SESSION_LIFETIME=120

MAIL_MAILER=smtp
MAIL_HOST=smtp.mailtrap.io
MAIL_PORT=2525
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null
MAIL_FROM_ADDRESS=null
MAIL_FROM_NAME="${APP_NAME}"

AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_DEFAULT_REGION=us-east-1
AWS_BUCKET=

PUSHER_APP_ID=
PUSHER_APP_KEY=
PUSHER_APP_SECRET=
PUSHER_APP_CLUSTER=mt1
```

## Additional Services

If your application uses additional services such as Redis, Elasticsearch, or any third-party APIs, make sure to install and configure them accordingly.

## Troubleshooting

If you encounter any issues during installation or running the application, check the Laravel log files located in `storage/logs/laravel.log`.

## API Documentation

API endpoints documentation is available at `http://localhost:8000/api/documentation` after starting the server.
