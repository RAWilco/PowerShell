# Replace with exact process name of Unity Hub you found
$processName = "Unity Hub"  

function Send-Notification {
    param (
        [string]$title = "Backup Reminder",
        [string]$message = "Don't forget to back up your projects after closing Unity Hub!"
    )

    Import-Module BurntToast -ErrorAction SilentlyContinue
    New-BurntToastNotification -Text $title, $message
}

while ($true) {
    $process = Get-Process -Name $processName -ErrorAction SilentlyContinue
    
    if ($null -eq $process) {
        Send-Notification
        break
    }
    else {
        Start-Sleep -Seconds 5
    }
}
