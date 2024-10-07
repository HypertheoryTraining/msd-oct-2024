default:
    @just --list

dev-pg:
    cd dev-environment && docker-compose -f docker-compose.yml up -d

dev-pg-down:
    cd dev-environment && docker-compose -f ./docker-compose.yml down

dev-kafka:
    cd dev-environment && docker-compose -f docker-compose.kafka.yml up -d

dev-kafka-down:
    cd dev-environment && docker-compose -f docker-compose.kafka.yml down

dev-reset-pg: (dev-pg-down)
    docker volume rm dev-environment_db_data

dev-reset-kafka: (dev-kafka-down)
    docker volume rm dev-environment_kafka_data

software-center-backend-run:
    cd logical-boundaries/software-center/src/backend/SoftwareCenterSolution/SoftwareCenterApi && dotnet run -- run

software-center-frontend-run:
    cd logical-boundaries/software-center/src/frontend && npm run dev
    
software-center-frontend-install:
    cd logical-boundaries/software-center/src/frontend && npm ci && npm run build