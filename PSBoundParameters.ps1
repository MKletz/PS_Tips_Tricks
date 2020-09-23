function Send-DefaultEmail {
    [CmdletBinding()]
    param (
        [parameter(Mandatory)]    
        [string[]]$To,
        [parameter(Mandatory)] 
        [string]$Subject,
        [parameter(Mandatory)] 
        [string]$Body,
        [string]$Attachments,
        [string[]]$CC
    )
    
    begin {
        
    }
    
    process {
        $Server = "Email.Our.Server"
        $From = "Anonymous"
        #$PSBoundParameters
        Send-MailMessage @PSBoundParameters -SmtpServer $Server -From $From -BodyAsHtml
    }
    
    end {
        
    }
}

Send-DefaultEmail -To "mike@aesf" -Subject "subject" -Body "body"