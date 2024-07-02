# Nmap IP y Servicios Extractor

Este es un script de Bash diseñado para extraer direcciones IP y servicios abiertos desde un archivo de salida de `nmap` y guardarlos en un archivo de texto. El script busca la dirección IP del informe de escaneo y lista los puertos abiertos junto con sus servicios.

## Descripción

Este script realiza las siguientes tareas:
1. **Lee un archivo de salida de `nmap`**: Acepta un archivo generado por `nmap` que contiene un informe de escaneo de red.
2. **Extrae la dirección IP**: Busca la línea que comienza con "Nmap scan report for" y extrae la dirección IP.
3. **Lista puertos y servicios abiertos**: Busca líneas que contengan "open" para identificar puertos abiertos y los servicios asociados.
4. **Guarda la información en un archivo**: Crea un archivo `ports_and_services.txt` con la dirección IP y una lista de puertos y servicios.

## Requisitos

- **Sistema Operativo**: El script está diseñado para sistemas Unix-like (Linux, macOS).
- **Nmap**: Asegúrate de tener `nmap` instalado para generar el archivo de entrada.

## Uso

1. **Generar el archivo de salida con `nmap`**:

   Ejecuta un comando `nmap` con una opción de escaneo, por ejemplo:

   ```bash
   nmap -sS -p- 192.168.1.1 -oN nmap_output.txt

Ejecutar el script con el archivo nmap_output.txt generará un archivo ports_and_services.txt 

   ./scriptPorts_and_services.sh nmap_output.txt



