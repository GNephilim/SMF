#!/bin/bash

ACTION="${1:-start}"

echo "╔════════════════════════════════════════╗"
echo "║   SMF Docker Development Environment  ║"
echo "╚════════════════════════════════════════╝"

case "$ACTION" in
    start)
        echo "Starting SMF Docker services..."
        docker-compose -f .docker/docker-compose.yml up -d
        echo "✓ Services started"
        ;;
    stop)
        echo "Stopping SMF Docker services..."
        docker-compose -f .docker/docker-compose.yml down
        echo "✓ Services stopped"
        ;;
    restart)
        echo "Restarting SMF Docker services..."
        docker-compose -f .docker/docker-compose.yml restart
        echo "✓ Services restarted"
        ;;
    build)
        echo "Building Docker images..."
        docker-compose -f .docker/docker-compose.yml up -d --build
        echo "✓ Build completed"
        ;;
    logs)
        docker-compose -f .docker/docker-compose.yml logs -f
        ;;
    shell)
        docker-compose -f .docker/docker-compose.yml exec php sh
        ;;
    composer)
        echo "Installing composer dependencies..."
        docker-compose -f .docker/docker-compose.yml run --rm composer install -dev
        echo "✓ Composer dependencies installed"
        ;;
    *)
        echo "Unknown action: $ACTION"
        echo "Available: start, stop, restart, build, logs, shell, composer"
        exit 1
        ;;
esac
