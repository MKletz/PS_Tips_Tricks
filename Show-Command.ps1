Show-Command -Name Get-Aduser

function Add-SomeNumbers {
    param (
        [int]$FirstNumber,
        [int]$SecondNumber
    )

    $FirstNumber + $SecondNumber
}
Show-Command -Name Add-SomeNumbers
