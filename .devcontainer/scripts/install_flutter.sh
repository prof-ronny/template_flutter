#!/usr/bin/env bash
set -euo pipefail

FLUTTER_DIR=/opt/flutter
if [ ! -d "$FLUTTER_DIR/.git" ]; then
  echo "[flutter] Clonando Flutter (stable)..."
  git clone -b stable https://github.com/flutter/flutter.git "$FLUTTER_DIR"
else
  echo "[flutter] Atualizando Flutter para 'stable'..."
  git -C "$FLUTTER_DIR" fetch origin stable
  git -C "$FLUTTER_DIR" checkout stable
  git -C "$FLUTTER_DIR" pull --ff-only
fi

chown -R vscode:vscode "$FLUTTER_DIR"

# Persist PATH for login shells
if [ ! -f /etc/profile.d/flutter.sh ]; then
  echo 'export PATH=/opt/flutter/bin:$PATH' | tee /etc/profile.d/flutter.sh >/dev/null
fi
