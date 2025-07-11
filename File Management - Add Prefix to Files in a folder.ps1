$files = Get-ChildItem "D:\Dropbox\Family Photos\Unsorted"

foreach ($file in $files) {
    Rename-Item $file.FullName -NewName ("Family-" + $file.Name)
}