#!/usr/bin/env bash
set -euo pipefail
FLUTTER_DIR=/opt/flutter
if [ ! -d "$FLUTTER_DIR/.git" ]; then
  git clone -b stable https://github.com/flutter/flutter.git "$FLUTTER_DIR"
else
  git -C "$FLUTTER_DIR" fetch origin stable
  git -C "$FLUTTER_DIR" checkout stable
  git -C "$FLUTTER_DIR" pull --ff-only
fi
chown -R vscode:vscode "$FLUTTER_DIR"
