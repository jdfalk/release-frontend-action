#!/usr/bin/env bash
# file: src/entrypoint.sh
# version: 1.0.0
# guid: 9f2c5b8e-1a4d-4c7e-8f9a-2b3c4d5e6f7a

set -euo pipefail

: "${NODE_VERSION:=20}"
: "${PACKAGE_MANAGER:=npm}"
: "${WORKING_DIRECTORY:=.}"
: "${BUILD_COMMAND:=npm run build}"
: "${TEST_COMMAND:=npm test}"
: "${LINT_COMMAND:=npm run lint}"
: "${RUN_TESTS:=true}"
: "${RUN_LINT:=true}"
: "${BUILD_OUTPUT_DIR:=dist}"

write_output() {
  name=$1
  value=$2
  if [ -n "${GITHUB_OUTPUT:-}" ]; then
    printf '%s=%s\n' "$name" "$value" >>"$GITHUB_OUTPUT"
  fi
}

write_summary() {
  text=$1
  if [ -n "${GITHUB_STEP_SUMMARY:-}" ]; then
    printf '%s\n' "$text" >>"$GITHUB_STEP_SUMMARY"
  fi
}

cd "$WORKING_DIRECTORY"

echo "Using Node.js $NODE_VERSION"

if command -v corepack >/dev/null 2>&1; then
  corepack enable || true
fi

case "$PACKAGE_MANAGER" in
npm)
  npm install -g "npm@$NODE_VERSION" >/dev/null 2>&1 || true
  ;;
yarn)
  npm install -g yarn >/dev/null 2>&1 || true
  ;;
pnpm)
  npm install -g pnpm >/dev/null 2>&1 || true
  ;;
*)
  echo "::error::Unsupported package manager: $PACKAGE_MANAGER"
  exit 1
  ;;
esac

echo "Installing dependencies with $PACKAGE_MANAGER"
if [ "$PACKAGE_MANAGER" = "npm" ]; then
  if [ -f package-lock.json ]; then
    npm ci
  else
    npm install --no-audit --no-fund
  fi
elif [ "$PACKAGE_MANAGER" = "yarn" ]; then
  if [ -f yarn.lock ]; then
    yarn install --frozen-lockfile
  else
    yarn install --non-interactive
  fi
elif [ "$PACKAGE_MANAGER" = "pnpm" ]; then
  if [ -f pnpm-lock.yaml ]; then
    pnpm install --frozen-lockfile
  else
    pnpm install
  fi
fi

if [ "$RUN_LINT" = "true" ]; then
  echo "Running lint: $LINT_COMMAND"
  sh -c "$LINT_COMMAND"
fi

if [ "$RUN_TESTS" = "true" ]; then
  echo "Running tests: $TEST_COMMAND"
  sh -c "$TEST_COMMAND"
fi

echo "Building: $BUILD_COMMAND"
sh -c "$BUILD_COMMAND"

BUILD_PATH="${WORKING_DIRECTORY}/${BUILD_OUTPUT_DIR}"
write_output "build-path" "$BUILD_PATH"

write_summary "## Frontend Build Summary"
write_summary ""
write_summary "**Node.js:** ${NODE_VERSION}"
write_summary "**Package Manager:** ${PACKAGE_MANAGER}"
write_summary "**Build Output:** ${BUILD_PATH}"
