Get-Process | Select-Object -Property @{Name='NewName';Expression={"$($_.ProcessName) is my favorite process!!!"}}

$Properties = (
    'Name',
    @{
        Name = 'SizeKB'
        Expression = {$_.Length / 1KB}
    },
    @{
        Name = 'PercentageOfUsed'
        Expression = {($_.Length / (Get-PSDrive -Name C).Used) * 100 -as [decimal]}
    }
)
Get-ChildItem | Select-Object -Property $Properties