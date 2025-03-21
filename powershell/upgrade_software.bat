SET var=%~dp0
Echo %var%
PowerShell.exe -NoProfile -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%var%\upgrade_software.ps1""' -Verb RunAs}"
