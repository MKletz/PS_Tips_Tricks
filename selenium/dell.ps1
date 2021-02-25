param (
    [String]$ServiceTag
)

$Options = New-SeDriverOptions -Browser 'Chrome'
#$Options.AddArgument('headless')
Start-SeDriver -Options $Options | Out-Null

Set-SeUrl -Url 'https://www.dell.com/support/home/en-us?app=drivers'

Get-SeElement -By 'Name' -Value 'entry-main-input-home' | Invoke-SeKeys -Keys $ServiceTag

Get-SeElement -By 'id' -Value 'btn-entry-select' | Invoke-SeClick

Wait-SeDriver -Condition ScriptBlock -Timeout 5.5 -Value {
    (Get-SeElement -By 'id' -Value 'btn-detect-drivers' -ErrorAction SilentlyContinue | Measure-Object).Count -eq 1
} | Out-Null

Get-SeElement -By 'id' -Value 'btn-detect-drivers' | Invoke-SeClick

Wait-SeDriver -Condition ScriptBlock -Timeout 5.5 -Value {
    (Get-SeElement -By ClassName 'align-top' -ErrorAction SilentlyContinue | Measure-Object).Count -eq 1
} | Out-Null

(Get-SeElement -By ClassName 'align-top').Text
