#!/bin/bash
set -e

echo "Activando el entorno virtual"

# crear venv si no existe
if [ ! -d venv ]; then
  python3 -m venv venv
fi

# activar venv (Linux/Jenkins)
if [ -f "venv/bin/activate" ]; then
  . venv/bin/activate
else
  echo "Error: no se pudo activar el entorno virtual"
  exit 1
fi

echo "instalando dependencias"
pip install --upgrade pip
pip install -r requirements.txt

echo "ejecutando pruebas con pytest"
mkdir -p reports
pytest tests/ \
  --junitxml=reports/test-results.xml \
  --html=reports/test-results.html \
  --self-contained-html

echo "pruebas finalizadas resultados en reports"