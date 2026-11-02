# _pic — Clipboard Image Saver

CLI-утилита для сохранения изображения из буфера обмена Windows в файл.

## Требования
- Windows 10
- Windows PowerShell 5.1
- .NET Framework (System.Windows.Forms, System.Drawing)

## Установка
1. Скрипт `_pic.ps1` и обёртка `_pic.cmd` находятся в:
   `C:\Projects\Common\1101_agent-cli-pic`
2. Добавить директорию в пользовательский `PATH`.
3. Перезапустить PowerShell.

## Использование

```powershell
_pic
_pic -Dir "C:\Screenshots"
_pic -Format png
_pic -Dir "C:\Screenshots" -Format png
```

## Параметры

| Параметр | По умолчанию | Назначение |
|---|---|---|
| `-Dir` | Текущая директория | Каталог сохранения |
| `-Format` | `jpeg` | Формат `jpeg` или `png` |

## Имя файла

`clipboard_YYmmddHHmmss.jpg`

Пример: `clipboard_261102185148.jpg`

## Особенности
- Изображение берётся из буфера обмена.
- JPEG используется по умолчанию.
- Путь сохранённого файла выводится в консоль.
