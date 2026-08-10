#!/bin/bash
# setup_logai.sh — Automates LogAI installation and patching

set -e

echo "[1/6] Installing pip..."
sudo apt install python3-pip -y

echo "[2/6] Cloning LogAI repository..."
git clone https://github.com/Asierzubia/logai.git
cd logai

echo "[3/6] Creating virtual environment..."
python3 -m venv venv
source venv/bin/activate

echo "[4/6] Installing LogAI packages..."
pip install logai
pip install "logai[gui]"
pip install "logai[dev]"

echo "[5/6] Patching gui/application.py for framework compatibility..."
sed -i 's/app\.run_server(debug=False)/app.run(debug=False)/' gui/application.py

echo "[6/6] Setup complete. Run the following to start LogAI:"
echo ""
echo "  cd logai"
echo "  source venv/bin/activate"
echo "  export PYTHONPATH=."
echo "  python3 gui/application.py"
echo ""
echo "Then open: http://127.0.0.1:8050"
