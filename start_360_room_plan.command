#!/bin/zsh
set -e
cd "${0:A:h}"
PORT=8766
if ! curl -fsS "http://127.0.0.1:${PORT}/room_360_plan/index.html" >/dev/null 2>&1; then
  /usr/bin/python3 -m http.server "$PORT" --bind 127.0.0.1 >/tmp/virtualtour-360.log 2>&1 &
  SERVER_PID=$!
  trap 'kill "$SERVER_PID" 2>/dev/null || true' EXIT
  sleep 1
fi
open "http://127.0.0.1:${PORT}/room_360_plan/index.html"
wait