#!/usr/bin/env bash
set -euo pipefail
SDK_DIR=/opt/android-sdk
CMDLINE_URL="${CMDLINE_TOOLS_URL:-https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip}"
mkdir -p "$SDK_DIR/cmdline-tools"
curl -fsSL "$CMDLINE_URL" -o /tmp/cmdline-tools.zip
rm -rf "$SDK_DIR/cmdline-tools/latest"
unzip -q /tmp/cmdline-tools.zip -d "$SDK_DIR/cmdline-tools"
if [ -d "$SDK_DIR/cmdline-tools/cmdline-tools" ]; then
  mv "$SDK_DIR/cmdline-tools/cmdline-tools" "$SDK_DIR/cmdline-tools/latest"
elif [ -d "$SDK_DIR/cmdline-tools/tools" ]; then
  mv "$SDK_DIR/cmdline-tools/tools" "$SDK_DIR/cmdline-tools/latest"
fi
rm -f /tmp/cmdline-tools.zip
chown -R vscode:vscode "$SDK_DIR"
export ANDROID_SDK_ROOT="$SDK_DIR"; export ANDROID_HOME="$SDK_DIR"; export PATH="$SDK_DIR/platform-tools:$SDK_DIR/cmdline-tools/latest/bin:$PATH"
yes | sdkmanager --sdk_root="$SDK_DIR" --licenses || true
sdkmanager --sdk_root="$SDK_DIR" --install "platform-tools" "platforms;android-35" "build-tools;35.0.0" "platforms;android-34" "build-tools;34.0.0"
yes | sdkmanager --sdk_root="$SDK_DIR" --licenses || true
