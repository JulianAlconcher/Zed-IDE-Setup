# Zed IDE Setup

Repositorio de configuración compartible para Zed Editor en macOS/Linux mediante enlaces simbólicos (symlinks).

## Estructura del repositorio

* `zed/settings.json`: Configuración del editor y extensiones declarativas.
* `zed/keymap.json`: Atajos de teclado personalizados.
* `zed/tasks.json`: Tareas personalizadas.
* `zed/themes/`: Temas personalizados.
* `bootstrap/setup-zed.sh`: Script de instalación y configuración de enlaces simbólicos.

## Instalación rápida

1. Clona el repositorio:
   ```bash
   git clone <URL_DEL_REPOSITORIO>
   cd Zed-IDE-Setup
   ```

2. Ejecuta el script de configuración:
   ```bash
   ./bootstrap/setup-zed.sh
   ```

Cualquier cambio que realices directamente dentro de Zed se actualizará de forma automática en este repositorio gracias a los enlaces simbólicos. Si ya existen configuraciones previas en la máquina de destino, el script creará un respaldo automático con extensión `.bak.<timestamp>`.
