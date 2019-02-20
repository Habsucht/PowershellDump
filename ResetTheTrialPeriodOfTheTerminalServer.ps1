# Скрипт сброса триального периода для терминального сревера
#=====================================

# Путь к ключам реестра
#===================
$pathToKey = "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\RCM\GracePeriod\"

# Получение реестровых ключей
#===================
$regKeys = Get-Item $pathToKey

# Удаление ключей по циклу
#===================
foreach ($regKey in $regKeys)
    {
    
    Write-Host $regKey is deleted
    Remove-ItemProperty -Path $pathToKey -Name $regKey.Property 

    }

# Сообщение пользователям о перезагрузке
#===================
$wshell = New-Object -ComObject Wscript.Shell
$Output = $wshell.Popup("Сервер будет перезагружен для технического обслуживания через 10 минут, завершите работу")

# Постановка задачи перезагрузки
#===================
Start-Sleep -Seconds 600; Restart-Computer
