# Platform Lab

A lightweight Node.js development laboratory with containerized deployments and reproducible environment setup.

## Overview

Platform Lab is a minimalist platform designed for rapid development and testing of Node.js applications. It combines Docker containerization with Nix flakes for consistent development environments, ensuring your application runs the same way locally and in production.

## What's Inside

- Node.js HTTP Server - A simple but functional HTTP server running on port 3004
- Docker Multi-stage Build - Optimized build process that runs tests and produces a lean runtime image
- Nix Flakes - Declarative development environment with all necessary dependencies
- Jest Test Suite - Built-in testing framework for validation

## Getting Started

### Prerequisites

Choose your development environment setup:

**Option 1: Docker**
- Docker and Docker Compose installed

**Option 2: Nix**
- Nix package manager with flakes enabled

**Option 3: Local Setup**
- Node.js 18 or higher
- npm or yarn

### Installation

Clone the repository and install dependencies:

```bash
git clone https://github.com/Jay-O-A/platform-lab.git
cd platform-lab
npm install
```

## Running Locally

Start the development server:

```bash
node node.js
```

The server will listen on http://localhost:3004 and respond with "Hello from Platform Lab!"

## Using Nix

Enter the development shell with all dependencies automatically available:

```bash
nix flake update
nix develop
```

Then run the application as normal.

## Docker Deployment

Build and run the containerized application:

```bash
docker build -t platform-lab .
docker run -p 3004:3004 platform-lab
```

The multi-stage Dockerfile ensures:
- Dependencies are installed in a builder stage
- Tests run before creating the final image
- Only production dependencies are included in the runtime image
- The container runs as a non-root user for security

## Running Tests

Execute the test suite using Jest:

```bash
npm test
```

## Project Structure

```
platform-lab/
├── Dockerfile           # Multi-stage containerization setup
├── flake.nix           # Nix development environment declaration
├── flake.lock          # Locked Nix dependencies
├── node.js             # Main application entry point
├── package.json        # Node.js project metadata and scripts
├── package-lock.json   # Locked npm dependencies
├── __tests__/          # Test directory
└── README.md           # This file
```

## Development Workflow

1. Modify node.js to implement your application logic
2. Add tests to the __tests__ directory
3. Run npm test to validate changes
4. Test with Docker: `docker build -t platform-lab . && docker run -p 3004:3004 platform-lab`
5. Commit and push your changes

## Environment Variables

Currently, the application accepts no environment variables but can be extended to support configuration through:

- Environment variables in Docker containers
- Configuration files loaded at startup
- Command-line arguments

## Port Configuration

The application listens on port 3004. To use a different port:

- Update node.js: Change the `.listen(3004)` call
- Update Dockerfile: Modify the `EXPOSE` instruction
- Map ports when running Docker: `docker run -p 8080:3004 platform-lab`

## Contributing

Contributions are welcome. Please ensure:

- All tests pass before opening a pull request
- Code follows the existing project conventions
- New features include corresponding tests

## License

ISC License. See package.json for details.

## Future Enhancements

- Add API endpoints for common operations
- Implement environment-based configuration
- Expand test coverage
- Add CI/CD pipeline with GitHub Actions
```
