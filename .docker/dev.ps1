#!/usr/bin/env pwsh

param(
    [Parameter(Mandatory=$false)]
    [ValidateSet("start", "stop", "restart", "build", "logs", "shell", "composer")]
    [string]$Action = "start"
)

Write-Host "╔════════════════════════════════════════╗"
Write-Host "║   SMF Docker Development Environment  ║"
Write-Host "╚════════════════════════════════════════╝" -ForegroundColor Cyan

function Start-Services {
    Write-Host "Starting SMF Docker services..." -ForegroundColor Green
    docker-compose -f .docker/docker-compose.yml up -d
    Write-Host "✓ Services started" -ForegroundColor Green
}

function Stop-Services {
    Write-Host "Stopping SMF Docker services..." -ForegroundColor Yellow
    docker-compose -f .docker/docker-compose.yml down
    Write-Host "✓ Services stopped" -ForegroundColor Green
}

function Restart-Services {
    Write-Host "Restarting SMF Docker services..." -ForegroundColor Yellow
    docker-compose -f .docker/docker-compose.yml restart
    Write-Host "✓ Services restarted" -ForegroundColor Green
}

function Build-Services {
    Write-Host "Building Docker images..." -ForegroundColor Yellow
    docker-compose -f .docker/docker-compose.yml up -d --build
    Write-Host "✓ Build completed" -ForegroundColor Green
}

function Show-Logs {
    docker-compose -f .docker/docker-compose.yml logs -f
}

function Access-Shell {
    docker-compose -f .docker/docker-compose.yml exec php sh
}

function Run-Composer {
    Write-Host "Installing composer dependencies..." -ForegroundColor Yellow
    docker-compose -f .docker/docker-compose.yml run --rm composer install -dev
    Write-Host "✓ Composer dependencies installed" -ForegroundColor Green
}

switch ($Action) {
    "start" { Start-Services }
    "stop" { Stop-Services }
    "restart" { Restart-Services }
    "build" { Build-Services }
    "logs" { Show-Logs }
    "shell" { Access-Shell }
    "composer" { Run-Composer }
}
