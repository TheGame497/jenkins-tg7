#!/bin/bash
set -e

echo "Creando entorno virtual si no existe"
if [ ! -d venv ]; then
  python3 -m venv venv
fi

echo "Usando pip del entorno virtual"
venv/bin/pip install --upgrade pip
venv/bin/pip install -r requirements.txt
venv/bin/pip install pytest pytest-html

echo "Ejecutando pruebas"
mkdir -p reports

venv/bin/pytest tests/ \
  --junitxml=reports/test-results.xml \
  --html=reports/test-results.html \
  --self-contained-html

echo "Pruebas finalizadas"