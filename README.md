# ⚙️ Zed IDE Configuration Repository

Este repositorio contiene la configuración declarativa y compartible para **[Zed Editor](https://zed.dev/)**. Está diseñado para sincronizar de manera uniforme la configuración de tu entorno de desarrollo en cualquier máquina macOS o Linux que utilices.

## 🚀 ¿Por qué este enfoque?

En lugar de simplemente copiar archivos (`cp`), utilizamos **enlaces simbólicos (symlinks)**. Al enlazar tu directorio de configuración real de Zed (`~/.config/zed/`) a este repositorio local de Git:

1. **Sincronización Automática:** Cualquier cambio que realices en el panel de configuración de Zed o mediante la paleta de comandos se guarda instantáneamente en este repositorio. No necesitas copiar archivos manualmente para subir tus actualizaciones.
2. **Control de Versiones Sin Esfuerzo:** Solo tienes que abrir este repositorio, hacer `git add`, `git commit` y `git push` para tener tus cambios listos en la nube.
3. **Instalación Declarativa de Extensiones:** Usamos la directiva `auto_install_extensions` de Zed en `settings.json` para definir qué extensiones deben estar presentes. Al clonar este repo en una nueva computadora, Zed descargará automáticamente todas las extensiones especificadas sin intervención manual.

---

## 📁 Estructura del Repositorio

El repositorio está organizado con la siguiente estructura limpia:

```text
Zed-IDE-Setup/
├── README.md               # Este archivo de documentación
├── .gitignore              # Archivos ignorados por Git (caché, temporales, etc.)
├── zed/                    # Archivos de configuración de Zed
│   ├── settings.json       # Configuración global del editor y extensiones declarativas
│   ├── keymap.json         # Atajos de teclado personalizados
│   ├── tasks.json          # Tareas personalizadas/automatizaciones
│   └── themes/             # Carpeta para tus temas personalizados (.json)
└── bootstrap/
    └── setup-zed.sh        # Script automatizado y seguro de instalación
```

---

## 💻 Instalación y Sincronización

Sigue estos sencillos pasos para instalar y sincronizar tu configuración en una computadora nueva:

### Paso 1: Clonar el repositorio
Clona este repositorio en tu directorio de preferencia (ej. `~/Documents/GitHub/`):
```bash
git clone https://github.com/tu-usuario/Zed-IDE-Setup.git
cd Zed-IDE-Setup
```

### Paso 2: Ejecutar el script de inicialización
El script `bootstrap/setup-zed.sh` se encargará de realizar el enlace de forma 100% segura. Si ya tienes archivos de configuración existentes en `~/.config/zed/`, **creará un respaldo automático** con la extensión `.bak.<fecha_hora>` para que no pierdas ningún dato.

Ejecuta el script de arranque:
```bash
./bootstrap/setup-zed.sh
```

Una vez finalizado, verás un mensaje indicando que la vinculación se realizó con éxito. ¡Abre Zed y todo estará listo!

---

## 🧩 Extensiones Autoinstaladas

Actualmente, el archivo `zed/settings.json` tiene preconfiguradas las siguientes extensiones bajo la propiedad `auto_install_extensions`:

- **Iconos:** `catppuccin-icons`, `charmed-icons`, `jetbrains-new-ui-icons`
- **Temas:** `dracula`, `nvim-nightfox`, `one-dark-pro`, `snazzy`, `the-dark-side`, `tokyo-night`, `vesper-blur`
- **Lenguajes y Herramientas:** `csv`, `dockerfile`, `git-firefly`, `html`, `latex`, `markdown-oxide`, `mcp-server-supabase`, `sql`, `vue`

### Cómo agregar nuevas extensiones:
Cuando instales una nueva extensión desde Zed, para hacerla parte de tu configuración declarativa, simplemente agrégala al objeto `"auto_install_extensions"` en `zed/settings.json`:
```json
"auto_install_extensions": {
  "nombre-de-la-extension": true
}
```

---

## 🎨 Temas Propios y Personalizaciones

- **Temas propios:** Si quieres crear tu propio tema, guárdalo dentro de la carpeta `zed/themes/` (ej. `my-theme.json`). El script de instalación sincronizará la carpeta completa de temas para que Zed la cargue automáticamente.
- **Atajos de teclado:** Edita el archivo `zed/keymap.json`.
- **Tareas del editor:** Administra tus flujos y tareas en `zed/tasks.json`.

---

## 🛡️ Contribución y Buenas Prácticas

- **Qué guardar:** Configuraciones (`settings.json`), combinaciones de teclas (`keymap.json`), tareas (`tasks.json`), temas (`themes/`).
- **Qué NO guardar:** Evita añadir al repositorio carpetas compiladas, cachés, logs o la carpeta `extensions/installed` de Zed (ya que esto se maneja de forma declarativa con `auto_install_extensions`). Esto ya está configurado por defecto en el archivo `.gitignore`.
