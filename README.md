<!-- file: README.md -->
<!-- version: 1.0.0 -->
<!-- guid: 6d9e3a7b-4f2c-5e8a-1d7f-3c5e2a4b9d1f -->
<!-- last-edited: 2026-01-19 -->

# Release Frontend Application Action

Build and release frontend applications with automated testing and artifact
creation, with optional dockerized execution.

## Features

- ⚛️ React, Vue, Angular, Svelte support
- 📦 npm, yarn, pnpm support
- ✅ Automated testing and linting
- 🚀 Build artifact creation
- 🔍 Multiple Node.js versions

## Usage

```yaml
- uses: jdfalk/release-frontend-action@v1
  with:
    build-command: npm run build
```

### Force Docker Execution

```yaml
- uses: jdfalk/release-frontend-action@v1
  with:
    use-docker: true
    docker-image: ghcr.io/jdfalk/release-frontend-action:main
    package-manager: npm
    build-command: npm run build
```

## Inputs

| Input                     | Description                                                      | Required | Default                                       |
| ------------------------- | ---------------------------------------------------------------- | -------- | --------------------------------------------- |
| `node-version`            | Node.js version                                                  | No       | `20`                                          |
| `package-manager`         | Package manager (npm, yarn, pnpm)                                | No       | `npm`                                         |
| `working-directory`       | Working directory                                                | No       | `.`                                           |
| `build-command`           | Build command                                                    | No       | `npm run build`                               |
| `test-command`            | Test command                                                     | No       | `npm test`                                    |
| `lint-command`            | Lint command                                                     | No       | `npm run lint`                                |
| `run-tests`               | Run tests                                                        | No       | `true`                                        |
| `run-lint`                | Run lint                                                         | No       | `true`                                        |
| `build-output-dir`        | Output directory                                                 | No       | `dist`                                        |
| `create-artifact`         | Create artifact                                                  | No       | `true`                                        |
| `artifact-name`           | Artifact name                                                    | No       | `frontend-build`                              |
| `artifact-retention-days` | Artifact retention days                                          | No       | `90`                                          |
| `use-docker`              | Run the action inside the published container image              | No       | `false`                                       |
| `docker-image`            | Docker image reference (tag or digest) when `use-docker` is true | No       | `ghcr.io/jdfalk/release-frontend-action:main` |

## License

MIT
