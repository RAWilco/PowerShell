$folderPath = "D:\Dropbox\Family Photos\Unsorted"

$files = Get-ChildItem -Path $folderPath -File

foreach ($file in $files) {
    $created = $file.CreationTime
    $extension = $file.Extension
    $newName = $created.ToString("yyyy-MM-dd_HH-mm-ss") + $extension
    $newPath = Join-Path $folderPath $newName

    $i = 1
    while (Test-Path $newPath) {
        $newName = $created.ToString("yyyy-MM-dd_HH-mm-ss") + "_$i" + $extension
        $newPath = Join-Path $folderPath $newName
        $i++
    }

    Rename-Item -Path $file.FullName -NewName $newName
    Write-Host "Renamed '$($file.Name)' to '$newName'"
}
