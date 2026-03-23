#!/bin/zsh

# --- Configuration ---
PROJECT_NAME="jhfnetboy"
DEPLOY_DIR=".deploy_staging"

echo "🚀 Preparing deployment for Cloudflare Pages: $PROJECT_NAME..."

# 1. Create a clean staging directory
rm -rf $DEPLOY_DIR
mkdir -p $DEPLOY_DIR

# 2. Copy only static assets (ONLY HTML and JPEG as requested)
echo "📦 Collecting static assets (index.html, jlab.html, and images)..."
cp *.html $DEPLOY_DIR/ 2>/dev/null
cp jhfnetboy.jpeg $DEPLOY_DIR/ 2>/dev/null

# 3. Deploy using Wrangler
# Note: This assumes wrangler is installed and authenticated
echo "☁️  Uploading to Cloudflare Pages..."
npx wrangler pages deploy $DEPLOY_DIR --project-name $PROJECT_NAME

# 4. Cleanup
echo "🧹 Cleaning up..."
rm -rf $DEPLOY_DIR

echo "✅ Deployment finished!"
