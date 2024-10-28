#!/bin/bash

# Update package index
echo "Updating package index..."
sudo apt update

# Install default JDK
echo "Installing default JDK..."
sudo apt install -y default-jdk

# Verify installation
echo "Verifying Java installation..."
java -version
javac -version

# Optional: Set JAVA_HOME
echo "Setting JAVA_HOME environment variable..."
JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
echo "export JAVA_HOME=$JAVA_HOME" >> ~/.bashrc
echo "export PATH=\$PATH:\$JAVA_HOME/bin" >> ~/.bashrc

# Source .bashrc to apply changes
source ~/.bashrc

echo "Java installation completed!"

