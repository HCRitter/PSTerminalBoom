using namespace System.Management.Automation.Subsystem.Feedback


try {
    if($null -ne (Get-Module -Name ScriptFeedbackProvider)){
        Import-Module ScriptFeedbackProvider -ErrorAction Stop
    }
}
catch {
    Write-Error 'Module: ScriptFeedBackProver  - must be installed!'
    return
}

try {
    if((Get-ExperimentalFeature -Name PSFeedbackProvider).Enabled -eq $false){
        Throw 'Experimental Feature PSFeedBackProvider is required'
    }
}
catch {
    return
}


foreach($ProviderFile in (Get-Childitem -Path "$PSSCriptroot\Private\")){
    if($ProviderFile.Extension -eq '.ps1'){
        . $ProviderFile.FullName
    }
}

