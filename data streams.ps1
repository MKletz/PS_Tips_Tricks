function MyFunction {
    [CmdletBinding()]
    param()
    Write-Output -InputObject "Output"
}
MyFunction | Tee-Object -Variable MyVar
$MyVar

function MyFunction {
    [CmdletBinding()]
    param()
    "I'm gonna do some stuff"
    5 + 5
}
MyFunction | Tee-Object -Variable MyVar
$MyVar


function MyFunction {
    [CmdletBinding()]
    param()
    Write-Error "Output"
    5 + 5
}
MyFunction -ErrorAction SilentlyContinue | Tee-Object -Variable MyVar2
$MyVar2
try{
    MyFunction
}
catch{
    'Do crash stuff'
}


function MyFunction {
    [CmdletBinding()]
    param()
    Write-Warning -Message "Output"
    5 + 5
}
MyFunction | Tee-Object -Variable MyVar
$MyVar

function MyFunction {
    [CmdletBinding()]
    param()
    Write-Verbose -Message "I'm gonna do some stuff"
    5 + 5
}
MyFunction -Verbose | Tee-Object -Variable MyVar3
$MyVar3

function MyFunction {
    [CmdletBinding()]
    param()
    Write-Debug -Message 'Output'
    5 + 5
}
MyFunction -Debug | Tee-Object -Variable MyVar4
$MyVar4

function MyFunction {
    [CmdletBinding()]
    param()
    Write-Information -MessageData "Got your features!" -InformationAction Continue -
    5 + 5
}
MyFunction | Tee-Object -Variable MyVar5
$MyVar5

function MyFunction {
    [CmdletBinding()]
    param()
    Write-Verbose -Message "I'm gonna do some stuff"
    5 + 5
}
MyFunction -Verbose 4>&1 | Tee-Object -Variable MyVar3
$MyVar3
