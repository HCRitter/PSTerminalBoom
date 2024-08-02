$GifPath = $PSScriptRoot + '\Boom.gif'
Add-Type -TypeDefinition @"
public static class PSTBHelperClass
{
    private static string _gifPath = "Initial Path";

    public static string GifPath
    {
        get { return _gifPath; }
        set { _gifPath = value; }
    }
}
"@

[PSTBHelperClass]::GifPath = $GifPath

# in another runspace


Register-ScriptFeedbackProvider -Name PSTerminalError -Trigger Error -ScriptBlock {
    if(Test-Path -Path "$($env:LOCALAPPDATA)\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"){
        
        $gifpath = [PSTBHelperClass]::GifPath
        $TerminalSettings = Get-Content -Path "$($env:LOCALAPPDATA)\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -Raw | ConvertFrom-Json
        Copy-Item -Path "$($env:LOCALAPPDATA)\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -Destination "$($env:LOCALAPPDATA)\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json.bak"
        $TerminalSettings.profiles.defaults.backgroundImageAlignment = 'center'
        $TerminalSettings.profiles.defaults.backgroundImage = $GifPath
        $TerminalSettings.profiles.defaults.backgroundImageStretchMode = 'fill'
        $TerminalSettings | ConvertTo-Json -depth 4| out-file "$($env:LOCALAPPDATA)\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
    }
}