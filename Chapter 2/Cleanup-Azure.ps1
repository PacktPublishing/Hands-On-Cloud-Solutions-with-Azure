#Requires -Version 3.0

Param(
    [string] $ResourceGroupName = '<resource group name>',
    [string] $TemplateFile = 'Azure-Cleanup.template.json'
)

function Check-Login
{
    $needLogin = $true
    Try 
    {
        $content = Get-AzureRmContext
        if ($content) 
        {
            $needLogin = ([string]::IsNullOrEmpty($content.Account))
        } 
    } 
    Catch 
    {
        if ($_ -like "*Login-AzureRmAccount to login*") 
        {
            $needLogin = $true
        } 
        else 
        {
            throw
        }
    }

    if ($needLogin)
    {
        Login-AzureRmAccount
    }
}

Check-Login

New-AzureRmResourceGroupDeployment -ResourceGroupName $ResourceGroupName -Mode Complete -TemplateFile $TemplateFile -Force -Verbose
