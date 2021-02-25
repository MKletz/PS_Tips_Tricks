$Credential = Get-Credential

$Options = New-SeDriverOptions -Browser 'Chrome'
#$Options.AddArgument('headless')
Start-SeDriver -Options $Options -StartURL 'https://hrnet.uihr.uillinois.edu/ptrapplication' | Out-Null

Get-SeElement -By 'id' -Value 'netid' | Invoke-SeKeys -Keys $Credential.UserName
Get-SeElement -By 'id' -Value 'easpass' | Invoke-SeKeys -Keys ($Credential.Password | ConvertFrom-SecureString -AsPlainText)
Get-SeElement -By 'Name' -Value 'BTN_LOGIN' | Invoke-SeClick

$Hourfields = (
    "mondayTimesheetHourValue",
    "tuesdayTimesheetHourValue",
    "wednesdayTimesheetHourValue",
    "thursdayTimesheetHourValue",
    "fridayTimesheetHourValue"
)
$Hourfields | ForEach-Object -Process {
    Get-SeElement -By 'id' -Value $_ | Invoke-SeKeys -Keys '7'
}

$Minutefields = (
    "mondayTimesheetMinuteValue",
    "tuesdayTimesheetMinuteValue",
    "wednesdayTimesheetMinuteValue",
    "thursdayTimesheetMinuteValue",
    "fridayTimesheetMinuteValue"
)
$Minutefields | ForEach-Object -Process {
    Get-SeElement -By 'id' -Value $_ | Invoke-SeKeys -Keys '3'
}

#Get-SeElement -By Id -Value 'btn_submit' | Invoke-SeClick