# Fallout Vore

## Setup
* Install the recommended extension, `joelday.papyrus-lang-vscode`.
* You should have Fallout 4 and the creation kit installed to the typical Steam location. Launch each of them at least once.

## Developing
* Build the scripts with /Terminal -> Run Task.../ and pick `pyro: Compile Project (FalloutVore.ppj)`
* Build the packages/mod with the task `Powershell: dev`
* Hardlink the pkg directory into your mod staging directory 
  `New-Item -ItemType Junction -Name FalloutVore -Value '..\Fallout Vore\pkg'`
* (re)launch Vortex

## Releasing
* Build the scripts with /Terminal -> Run Task.../ and pick `pyro: Compile Project (FalloutVore.ppj)`
* Build the packages/mod with the task `Powershell: build`
* Drag the zip file from `.\dist` into Vortex to install. 