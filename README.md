# 🍕 Jarochos Pizza

Bienvenido a **Jarochos Pizza**, una aplicación web moderna para la gestión y pedidos de pizzas, construida con Laravel.

## 🚀 Características Principales

### 🛒 Para Clientes
*   **Catálogo de Pizzas:** Explora nuestra variedad de pizzas con detalles deliciosos.
*   **Carrito de Compras:** Agrega tus pizzas favoritas y gestiona tu pedido fácilmente.
*   **Checkout Rápido:** Proceso de pago simplificado.
*   **Rastreo de Pedidos:** Sigue el estado de tu orden en tiempo real desde tu dashboard (Pendiente → Preparando → Lista).
*   **Historial de Pedidos:** Revisa tus compras anteriores.
*   **Perfil de Usuario:** Gestiona tu información personal.

### 🛡️ Panel de Administración (Empleados/Admin)
*   **Gestión de Pedidos:** Visualiza pedidos entrantes, actualiza su estado y genera tickets.
*   **Gestión de Menú:** Agrega, edita o elimina pizzas del catálogo.
*   **Dashboard Administrativo:** Vista general del negocio.
*   **Gestión de Usuarios:** (Solo Admin) Control de usuarios y roles.

## 🛠️ Tecnologías Utilizadas

*   **Backend:** [Laravel 12](https://laravel.com)
*   **Frontend:** Blade Templates + [Tailwind CSS 4](https://tailwindcss.com)
*   **Base de Datos:** MySQL / SQLite
*   **Autenticación:** Laravel Breeze/Jetstream (según configuración)

## 📦 Instalación y Configuración

Sigue estos pasos para desplegar el proyecto localmente:

1.  **Clonar el repositorio:**
    ```bash
    git clone https://github.com/Onlyoubabe/JarochosPizza.git
    cd JarochosPizza
    ```

2.  **Instalar dependencias de PHP:**
    ```bash
    composer install
    ```

3.  **Instalar dependencias de Frontend:**
    ```bash
    npm install
    npm run build
    ```

4.  **Configurar Variables de Entorno:**
    ```bash
    cp .env.example .env
    php artisan key:generate
    ```
    *Asegúrate de configurar tu base de datos en el archivo `.env`.*

5.  **Ejecutar Migraciones:**
    ```bash
    php artisan migrate
    ```
    *(Opcional: `php artisan migrate --seed` si hay datos de prueba)*

6.  **Iniciar Servidor:**
    ```bash
    php artisan serve
    ```

¡Listo! Visita `http://127.0.0.1:8000` para pedir tu pizza. 🍕

## 📄 Licencia

Este proyecto es de código abierto y está disponible bajo la licencia [MIT](https://opensource.org/licenses/MIT).
