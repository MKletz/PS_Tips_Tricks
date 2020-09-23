function Update-File3 {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [string]$Path,
        [parameter(ValueFromPipeline)]
        [string]$Value
    )
    
    begin {
        [string[]]$Content = Get-Content -Path $Path
    }
    
    process {
        if($PSCmdlet.ShouldProcess($Value, 'Replace')){
            $Content = $Content.Replace($Value,'foo')
        }
    }
    
    end {
        if($PSCmdlet.ShouldProcess($Path,'Commit')){
            Set-Content -Path $Path -Value $Content
        }
    }
}
Update-File3 -Path .\testfile.txt -Value '100' -WhatIf