Set-Content -Path .\testfile.txt -Value (1..1000)
break

function Update-File {
    [CmdletBinding()]
    param (
        [string]$Path,
        [parameter(ValueFromPipeline)]
        [string]$Value
    )
    
    begin {
    }
    
    process {
        [string[]]$Content = Get-Content -Path $Path
        $Content = $Content.Replace($Value,'foo')
        Set-Content -Path $Path -Value $Content
    }
    
    end {
    }
}
Measure-Command -Expression {1..1000 | Update-File -Path .\testfile.txt}
break

function Update-File2 {
    [CmdletBinding()]
    param (
        [string]$Path,
        [parameter(ValueFromPipeline)]
        [string]$Value
    )
    
    begin {
        [string[]]$Content = Get-Content -Path $Path
    }
    
    process {
        $Content = $Content.Replace($Value,'foo')
    }
    
    end {
        Set-Content -Path $Path -Value $Content
    }
}
Measure-Command -Expression {1..1000 | Update-File2 -Path .\testfile.txt}
