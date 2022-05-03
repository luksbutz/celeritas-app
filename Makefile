BINARY_NAME=celeritas

build:
	@echo "Building Celeritas..."
	@go build -o dist/${BINARY_NAME} .
	@echo "Celeritas built!"

run: build
	@echo "Starting Celeritas..."
	@./dist/${BINARY_NAME} &
	@echo "Celeritas started!"

clean:
	@echo "Cleaning..."
	@go clean
	@rm dist/${BINARY_NAME}
	@echo "Cleaned!"

start_compose:
	@echo "Starting Docker Compose"
	@docker-compose up -d
	@echo "Done!"

stop_compose:
	@echo "Stopping Docker Compose"
	@docker-compose down
	@echo "Done!"

test:
	@echo "Testing..."
	@go test ./...
	@echo "Done!"

start: run

stop:
	@echo "Stopping Celeritas..."
	@-pkill -SIGTERM -f "./dist/${BINARY_NAME}"
	@echo "Stopped Celeritas!"

restart: stop start