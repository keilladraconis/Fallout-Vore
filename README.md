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
* Build the scripts with /Terminal -> Run Task.../ and pick `pyro: Compile Project (FalloutVore.ppj)`
* Hardlink the src directory into your mod staging directory 
  `New-Item -ItemType Junction -Name FalloutVore -Value '..\Fallout Vore\src\Data'`
* (re)launch Vortex

## Releasing
* Build the scripts with /Terminal -> Run Task.../ and pick `pyro: Compile Project (FalloutVore.ppj)`
* Build the packages/mod with the task `Powershell: build`
* Drag the zip file from `.\dist` into Vortex to install. 