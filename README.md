# PSTerminalBoom

This module registers a ScriptFeedbackprovider which plays an exploding animation in the Windows Terminal when ever an error occurs

## Warning

This module is still in the proof of concept (PoC) phase. Be aware as this module will make changes to your Windows Terminal Settings.Json file!

## Requirements

- PowerShell 7.x
- Enabled experimental feature 'PSFeedbackProvider'
- The public external module 'ScriptFeedbackProvider' by 'Justin Grote'
- Windows Terminal

## Demo

![Animation](https://github.com/HCRitter/PSTerminalBoom/blob/main/Demo.gif)

## Whats next

- Check for preview release of Windows Terminal
- Avoid to write Settings.json.bak in the %APPdata% folder
- Your idea could be here, raise an Issue :)
  