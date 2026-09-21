@echo off
echo ===================================================
echo     INICIANDO SISTEMA MLB PREDICTOR PRO
echo ===================================================
echo.
echo [1/2] Iniciando el cerebro de datos (Python)...

cd /d C:\Users\29dav\.gemini\antigravity\scratch\mlb_predictor

IF NOT EXIST "venv" (
    echo Creando entorno virtual...
    "C:\Users\29dav\AppData\Local\Programs\Python\Python312\python.exe" -m venv venv
)

echo Instalando/Verificando dependencias matematicas...
call .\venv\Scripts\python.exe -m pip install -r requirements.txt -q

echo Encendiendo servidor de datos en segundo plano...
start "MLB Backend (No cerrar)" cmd /c ".\venv\Scripts\uvicorn.exe main:app --reload --port 8000"

echo.
echo [2/2] Iniciando la interfaz visual (Node.js)...
cd /d C:\Users\29dav\.gemini\antigravity\scratch\mlb_predictor\frontend

IF NOT EXIST "node_modules" (
    echo Descargando componentes visuales (esto tomara un minuto la primera vez)...
    call npm install
)

echo Encendiendo la pagina web...
start "MLB Frontend (No cerrar)" cmd /c "npm run dev"

echo.
echo ===================================================
echo     TODO ESTA LISTO Y FUNCIONANDO
echo ===================================================
echo.
echo Abriendo tu navegador en 5 segundos...
timeout /t 5 /nobreak >nul
start http://localhost:3000

echo Puedes minimizar estas ventanas negras, pero NO LAS CIERRES 
echo mientras uses la pagina.
pause
