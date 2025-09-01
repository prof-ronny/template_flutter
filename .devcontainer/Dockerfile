# Devcontainer base image (Ubuntu 24.04)
FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

ARG DEBIAN_FRONTEND=noninteractive

# Essentials for Flutter + Android build
RUN apt-get update && apt-get install -y \ 
    curl \ 
    unzip \ 
    xz-utils \ 
    git \ 
    ca-certificates \ 
    openjdk-17-jdk \ 
    python3 \ 
    && rm -rf /var/lib/apt/lists/*

# Prepare directories
RUN mkdir -p /opt/flutter /opt/android-sdk && chown -R vscode:vscode /opt/flutter /opt/android-sdk
