#!/bin/bash
set -e

echo "Eliminando entorno virtual viejo"
rm -rf venv

echo "Creando entorno virtual limpio"
python3 -m venv venv

echo "Verificando python del venv"
venv/bin/python --version

echo "Instalando dependencias"
venv/bin/python -m pip install --upgrade pip
venv/bin/python -m pip install -r requirements.txt
venv/bin/python -m pip install pytest pytest-html

echo "Ejecutando pruebas"
mkdir -p reports

venv/bin/python -m pytest tests/ \
  --junitxml=reports/test-results.xml \
  --html=reports/test-results.html \
  --self-contained-html

echo "Pruebas finalizadas"