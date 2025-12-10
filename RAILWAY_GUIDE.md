# 🚀 Despliegue en Railway

Sigue estos pasos para poner **Jarochos Pizza** en línea usando Railway (PaaS).

## 1. Preparación en Railway

1.  Crea una cuenta en [Railway.app](https://railway.app/).
2.  Haz clic en **"New Project"**.
3.  Selecciona **"Deploy from GitHub repo"**.
4.  Elige el repositorio `Onlyoubabe/JarochosPizza`.
5.  Haz clic en **"Deploy Now"**.

## 2. Configuración de Base de Datos

1.  En tu proyecto de Railway, haz clic en **"New"** (o botón derecho en el lienzo) → **Database** → **MySQL**.
2.  Espera a que se cree el servicio de MySQL.
3.  Conecta tu aplicación Laravel a la base de datos:
    *   Railway suele inyectar las variables automáticamente si usas sus plugins, pero para asegurar:
    *   Ve a la pestaña **Variables** de tu servicio de *Laravel*.
    *   Agrega (o verifica) las siguientes variables usando los datos de conexión de tu servicio MySQL (pestaña *Connect*):
        *   `DB_CONNECTION`: `mysql`
        *   `DB_HOST`: *${MYSQL_HOST}*
        *   `DB_PORT`: *${MYSQL_PORT}*
        *   `DB_DATABASE`: *${MYSQL_DATABASE}*
        *   `DB_USERNAME`: *${MYSQL_USER}*
        *   `DB_PASSWORD`: *${MYSQL_PASSWORD}*

## 3. Variables de Entorno (Environment Variables)

En la pestaña **Variables** de tu servicio Laravel, asegúrate de tener estas configuraciones:

| Variable | Valor Recomendado |
| :--- | :--- |
| `APP_NAME` | `JarochosPizza` |
| `APP_ENV` | `production` |
| `APP_DEBUG` | `false` |
| `APP_URL` | *https://tudominio.up.railway.app* (Railway te dará uno) |
| `APP_KEY` | *Copia la clave de tu archivo .env local* |
| `NIXPACKS_BUILD_CMD` | `npm install && npm run build && composer install --no-dev --optimize-autoloader` |

> **Nota sobre APP_KEY:** Es VITAL que copies tu `APP_KEY` local (la cadena que empieza con `base64:...`) y la pongas en Railway. Sin ella, la app no iniciará.

## 4. Comandos de Despliegue

Railway usa **Nixpacks** para detectar que es un proyecto Laravel. Generalmente lo configura bien solo, pero puedes asegurar el comando de inicio en la pestaña **Settings** → **Deploy** → **Start Command**:

```bash
php artisan migrate --force && php artisan serve --host=0.0.0.0 --port=$PORT
```

*   `php artisan migrate --force`: Ejecuta las migraciones de base de datos automáticamente en cada despliegue.

## 5. ¡Listo!

Una vez que Railway termine el despliegue (Building... Deployed), te dará una URL pública. ¡Entra y disfruta de tu pizza! 🍕
