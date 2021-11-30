Copy-Item 'src\Data\F4SE' 'pkg\Data\F4SE' -Recurse -Force
Copy-Item 'src\Data\MCM' 'pkg\Data\MCM' -Recurse -Force
Copy-Item 'src\Data\Tools' 'pkg\Data\Tools' -Recurse -Force
Copy-Item 'src\Data\FalloutVore.esp' 'pkg\Data\FalloutVore.esp' -Force
Copy-Item 'src\DLC Patch' 'pkg\DLC Patch' -Recurse -Force
Copy-Item 'src\fomod' 'pkg\fomod' -Recurse -Force
Copy-Item 'src\images' 'pkg\images' -Recurse -Force
Copy-Item 'src\Mod Patches' 'pkg\Mod Patches' -Recurse -Force
Copy-Item 'src\Ultrawide UI Patch' 'pkg\Ultrawide UI Patch' -Recurse -Force
Copy-Item 'src\VaultGirl Flash Patch' 'pkg\VaultGirl Flash Patch' -Recurse -Force
New-Alias -Name archive2 -Value "C:\Program Files (x86)\Steam\steamapps\common\Fallout 4\Tools\Archive2\Archive2.exe"

archive2 ".\src\Data\interface,.\src\Data\Materials,.\src\Data\Meshes,.\src\Data\Sound,.\src\Data\Scripts"`
    -create=".\pkg\Data\FalloutVore - Main.ba2" -compression=None
archive2 ".\src\Data\textures"`
    -create=".\pkg\Data\FalloutVore - Textures.ba2" -compression=Default -Format=DDS

New-Item -Path ".\dist" -ItemType Directory -Force

Compress-Archive -Path ".\pkg\*" -DestinationPath ".\dist\FalloutVore - v3.1.0.zip" -Force