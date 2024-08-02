Register-ScriptFeedbackProvider -Name PSTerminalOK -Trigger Success -ScriptBlock {
    if(Test-Path -Path "$($env:LOCALAPPDATA)\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json.bak"){
        $TerminalSettings = Get-Content -Path "$($env:LOCALAPPDATA)\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json.bak" -Raw | ConvertFrom-Json
        $TerminalSettings | ConvertTo-Json -depth 4| out-file "$($env:LOCALAPPDATA)\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
        remove-item -Path "$($env:LOCALAPPDATA)\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json.bak" -force
    }
}
