Push-Location "C:\Program Files (x86)\Steam\steamapps\common\Fallout 4"
New-Item -Path ".\Merging\Data" -ItemType Directory -Force
New-Item -Path ".\Merging\VersionBackup" -ItemType Directory -Force
New-Item -Path ".\Data\CheckInBackup" -ItemType Directory -Force
Remove-SmbShare -Name Merging -Force
Remove-SmbShare -Name CheckInBackup -Force
New-SmbShare -Path "C:\Program Files (x86)\Steam\steamapps\common\Fallout 4\Merging" -Name "Merging" -FullAccess "Everyone"
New-SmbShare -Path "C:\Program Files (x86)\Steam\steamapps\common\Fallout 4\Data\CheckInBackup" -Name "CheckInBackup" -FullAccess "Everyone"
Pop-Location