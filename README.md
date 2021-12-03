# Fallout Vore

## Credit
- Carreau 
- Gat
- Coldsteelj
- Many others!

I am in their debt for the open source code, the many, many forum posts that I was able to learn key details of modding from, and of course the original mod itself without which I wouldn't have ever come down this road. So thank you deeply for opening me up to this weird and arduous path.

I'm working on this mod as a service to the community, and to myself. After a long time of working on [Vore4Fallout](https://github.com/keilladraconis/Vore4Fallout) I felt it was time to try to return to the community and repair and improve this much-beloved mod.

## Setup
* Install the recommended extension, `joelday.papyrus-lang-vscode`.
* You should have Fallout 4 and the creation kit installed to the typical Steam location. Launch each of them at least once.

## Developing
This mod uses an `ESM` master file and Creation Kit version control. Please [Follow The Instructions](https://www.creationkit.com/fallout4/index.php?title=Version_Control) to configure your system.

**Windows 10 Powershell Automation**
Launch a powershell in administrator mode: `Ctrl-X` -> "Windows Powershell (Admin)".
Enable running unsigned scripts:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
```

You may run `.\script\setup.ps1` to automatically create and share the necessary directories on Windows 10. It might not even be possible to follow the instructions on Win10 because the `Share...` dialogs are different.

Create or edit the `Fallout 4\CreationKitCustom.ini` file with the following data:
```ini
[General]
bUseVersionControl=1
sNetwork Path=\\COMPUTERNAME\Merging\
sNewVersionBackupPath=\\COMPUTERNAME\Merging\VersionBackup\
sNetworkMasterPath=\\COMPUTERNAME\Merging\Data\
sLocalBackupPath=Data\CheckInBackup\
```
Your COMPUTERNAME can be retrieved in powershell by writing `$env:ComputerName`.

Edit `CreationKitPrefs.ini` with the following data:
```ini
[WhoCanMerge]
USERNAME=1
```
Your USERNAME can be retrieved in powershell by writing `$env:UserName`

You can then use the `.\script\checkout.ps1` to copy the `FalloutVore.esm` file into the merging directory.

### Troubleshooting

#### Master File does not exist on the network
1. Check that you did copy the `FalloutVore.esm` file or `Fallout4.esm` file into the `Fallout 4\Merging\Data` directory.
2. Check that you have properly shared the folders as explained in the creation kit wiki.
3. Check that the shared network paths are correctly copied into the `CreationKitCustom.ini`

#### Details takes a long time to appear, or Ctrl-Shift-B does not work
1. Check that you modified the `CreationKitPrefs.ini` and properly put in your actual username for `[WhoCanMerge]` and not `USERNAME`, which is wrong.

### Development Workflow
* Build the scripts with /Terminal -> Run Task.../ and pick `pyro: Compile Project (FalloutVore.ppj)`
* Hardlink the src directory into your mod staging directory 
  `New-Item -ItemType Junction -Name FalloutVore -Value '..\Fallout Vore\src\Data'`
* Use the "Checkout ESM" task to copy the `FalloutVore.esm` file to the merging directory.
* Launch the Creation Kit with the plugin enabled.
* When working in creation kit **do not make `FalloutVore.esm` active**, instead set it to 'checked' and then after CK loads it immediately save a new `FalloutVore.esp` plugin. 
* After making modifications to the plugin, use the "Version Control" interface to "Select All", "Check Out", and "Check In", saving a new version of the `FalloutVore.esm`.
* Use the "Checkin ESM" task to copy the `FalloutVore.esm` file back into the repo.

You can still override assets if two developers are working on the exact same thing, but this eases the procedure of working on multiple parts of a mod simultaneously. 

## Releasing
* Build the scripts with /Terminal -> Run Task.../ and pick `pyro: Compile Project (FalloutVore.ppj)`
* Build the packages/mod with the task `Powershell: build`
* Drag the zip file from `.\dist` into Vortex to install. 