#!/bin/bash
echo "activando el entorno virtual"
if [ ! "-d venv" ]; then
  python3 -m venv venv
fi

if [ -f "venv/bin/activate" ]; then
  source venv/bin/activate
elif [ -f "venv/Scripts/activate" ] then
  source venv/bin/activate
else
    echo "Error no se activo el env"
    exit 1
fi

echo "instalando dependencias"
pip install --upgrade pip --break-system-packages
pip install -r requirements.txt --break-system-packages

echo "ejecutando pruebas con pytest"
pytest tests/ --junitxml=reports/test-results.xml --html=reports/test-results.html --self-contained-html
echo "pruebas finalizadas resultados en reports"