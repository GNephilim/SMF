# SMF Docker Setup

Docker configuration for Simple Machines Forum development.

## Quick Start

**Windows:**
```powershell
.\.docker\dev.ps1 start
.\.docker\dev.ps1 composer
```

**Linux/Mac:**
```bash
./.docker/dev.sh start
./.docker/dev.sh composer
```

Then visit: http://localhost

## Database
- Host: `db`
- User: `smf_user`
- Password: `smf_password`
- Database: `smf_db`

## Services
- Nginx: http://localhost (port 80)
- PHPMyAdmin: http://localhost:8080
- MySQL: localhost:3306

## Commands

```bash
# Start/Stop
./.docker/dev.sh start          # Linux/Mac
.\.docker\dev.ps1 start         # Windows

# Install dependencies
./.docker/dev.sh composer
.\.docker\dev.ps1 composer

# View logs
./.docker/dev.sh logs
.\.docker\dev.ps1 logs

# Access shell
./.docker/dev.sh shell
.\.docker\dev.ps1 shell

# Stop services
./.docker/dev.sh stop
.\.docker\dev.ps1 stop
```

See SMF documentation for more: https://wiki.simplemachines.org/smf/Installing
