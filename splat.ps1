function Find-MyFiles {
    [CmdletBinding()]
    param (
       [string]$Extension,
       [boolean]$Recurse 
    )
    
    begin {
        
    }
    
    process {
        $Path = 'C:\test'
        if($Extension -and $Recurse){
            Get-ChildItem -Path $Path -Filter $Extension -Recurse
        }
        elseif($Extension) {
            Get-ChildItem -Path $Path -Recurse
        }
        elseif($Recurse) {
            Get-ChildItem -Path $Path -Filter $Extension
        }
        else{
            Get-ChildItem -Path $Path
        }
    }
    
    end {
        
    }
}
function Find-MyFiles2 {
    [CmdletBinding()]
    param (
       [string]$Extension,
       [boolean]$Recurse 
    )
    
    begin {
        
    }
    
    process {
        $Splat = @{
            Path = 'C:\test'
        }

        if($Extension){
            $Splat.Add('Filter',"*$($Extension)")
        }

        if($Recurse){
            $Splat.Add('Recurse',$True)
        }
        
        Get-ChildItem @Splat
    }
    
    end {
        
    }
}