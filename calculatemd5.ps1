param([string]$path = ".")

$files = Get-ChildItem $path -File
$hashes = foreach($file in $files) {
    Write-Output (New-Object -TypeName PSCustomObject -Property @{
    FileName = $file.FullName
    MD5 = Get-FileHash $file.FullName -Algorithm MD5 | Select-Object -ExpandProperty Hash
    Size = (Get-Item $file.FullName).length
    })
}

$hashes | Export-Csv -NoTypeInformation -Path output.csv