#!/bin/bash

# Exit immediately if any command fails
set -e

# ==========================================
# CONFIGURATION
# ==========================================
TEMPLATE_URL="https://www.tooplate.com/zip-templates/2171_spatial_diorama.zip"
WEB_ROOT="/var/www/html"

echo "=========================================="
echo "Step 1: Updating system packages..."
echo "=========================================="
sudo apt update && sudo apt upgrade -y

echo "=========================================="
echo "Step 2: Installing Apache2, Unzip, and Wget..."
echo "=========================================="
sudo apt install apache2 unzip wget -y

echo "=========================================="
echo "Step 3: Starting and enabling Apache service..."
echo "=========================================="
sudo systemctl start apache2
sudo systemctl enable apache2

echo "=========================================="
echo "Step 4: Downloading Spatial Diorama template..."
echo "=========================================="
cd /tmp
# Clean up any leftover temporary files from prior runs
rm -rf template.zip template_extracted 2171_spatial_diorama
wget -O template.zip "$TEMPLATE_URL"

echo "=========================================="
echo "Step 5: Extracting template..."
echo "=========================================="
mkdir -p template_extracted
unzip -q template.zip -d template_extracted

echo "=========================================="
echo "Step 6: Deploying website files to Apache web root..."
echo "=========================================="
# Remove default Apache index page and files
sudo rm -rf ${WEB_ROOT}/*

# Move extracted Spatial Diorama files into the Apache web root
if [ -d "template_extracted/2171_spatial_diorama" ]; then
    sudo cp -r template_extracted/2171_spatial_diorama/* ${WEB_ROOT}/
else
    sudo cp -r template_extracted/*/* ${WEB_ROOT}/
fi

echo "=========================================="
echo "Step 7: Setting permissions for Apache (www-data)..."
echo "=========================================="
sudo chown -R www-data:www-data ${WEB_ROOT}
sudo chmod -R 755 ${WEB_ROOT}

echo "=========================================="
echo "Step 8: Restarting Apache service..."
echo "=========================================="
sudo systemctl restart apache2

echo "=========================================="
echo "Step 9: Cleaning up temporary files..."
echo "=========================================="
rm -rf /tmp/template.zip /tmp/template_extracted

echo "=========================================="
echo "Deployment successful!"
echo "Your Spatial Diorama site is live at: http://<YOUR_SERVER_IP>"
echo "=========================================="