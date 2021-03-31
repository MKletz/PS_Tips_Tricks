function Test-ParamBlocks {
    [CmdletBinding(DefaultParameterSetName = 'None')]
    Param (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Tom','Dick','Jane')]
        [string]$Name,

        [ValidateRange(60,999)]
        [Int32]$Age = 60,

        [ValidateLength(1,256)]
        [String]$StreetName,

        [ValidatePattern("[0-9][0-9][0-9][0-9][0-9]")]
        [String]$ZipCode,

        [ValidateScript({ !(Test-Path -Path $_) })]
        [string]$Path,

        [string]$OutputPath = (Join-Path -Path $PWD -ChildPath 'Output'),

        [Parameter(ParameterSetName = 'OS')]
        [ValidateSet(
            'Microsoft Windows 10 Enterprise',
            'Microsoft Windows Server 2016 Member Server',
            'Microsoft Windows Server 2016 Domain Controller',
            'Microsoft Windows Server 2019 Member Server',
            'Microsoft Windows Server 2019 Domain Controller'
        )]
        [string]$OS,

        [Parameter(ParameterSetName = 'OS')]
        [string]$OSBuild,

        [Parameter(ParameterSetName = 'Browser')]
        [ValidateSet(
            'Microsoft Edge',
            'Google Chrome',
            'Mozilla FireFox'
        )]
        [string]$Browser
    )

    Process {
        $Age
        $OutputPath
    }
}

Test-ParamBlocks
Test-ParamBlocks -Name 'Mike'
Test-ParamBlocks -Name 'Tom' -Age 51
Test-ParamBlocks -Name 'Tom' -OS 'Microsoft Windows Server 2019 Domain Controller' -Browser 'Microsoft Edge'

Show-Command Test-ParamBlocks
