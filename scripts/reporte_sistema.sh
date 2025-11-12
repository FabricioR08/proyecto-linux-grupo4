#!/bin/bash

# inicio del reporte
echo "------ Reporte de sistema ------"

#  fecha y hora actual
echo "Fecha y Hora: $(date +'%Y-%m-%d %H:%M:%S')"

#  nombre del host del sistema
echo "Nombre del Host: $(hostname)"

#  numero de usuarios conectados
echo "Usuarios Conectados: $(who -q | grep users | awk '{print $1}')"

#  espacio libre en el disco principal
# se asume el disco principal es el que monta el sistema de archivos principal (root)
echo "Espacio Libre en Disco: $(df -h / | awk 'NR==2 {print $4}')"

#  memoria RAM disponible
# la columna 4 del comando free -h es la 'available' memory
echo "Memoria RAM Disponible: $(free -h | awk 'NR==2 {print $7}')"

#  numero de contenedores Docker activos
# contamos el numero de lineas, restando 1 por la cabecera
echo "Contenedores Docker Activos: $(sudo docker ps -q | wc -l)"

# fin del Reporte
echo "------ Fin del Reporte ------"
