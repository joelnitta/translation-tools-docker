FROM ubuntu:latest

LABEL org.opencontainers.image.authors="joelnitta@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive

# Update the package list
RUN apt-get update \
    # Install aptitude
    && apt-get install -y aptitude \
    # Use aptitude to install translate-toolkit
    && aptitude install -y translate-toolkit \
    # Clean up cache and temporary files to reduce image size
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user and switch to it
RUN useradd -m user
USER user
