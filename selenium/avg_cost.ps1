Param(
    $Search
)

$Options = New-SeDriverOptions -Browser 'Chrome'
#$Options.AddArgument('headless')
Start-SeDriver -Options $Options | Out-Null
Set-SeUrl -Url "https://www.homedepot.com/s/$($Search.Replace(' ','%20'))?NCNI-5"

$Prices = Get-SeElement -By Class -Value "price-format__main-price" | Select-Object -Property @{ Name = 'Price'; Expression = {
        $Price = $_.Text.TrimStart('$')
        [double]$Price.Insert(($Price.Length - 2), '.')
    }
}

$PricesActual = @()
$PricesActual += $Prices | Sort-Object -Property 'Price' -Descending | Select-Object -Skip ([Math]::Round($Prices.Count / 10))
$PricesActual += $Prices | Sort-Object -Property 'Price' | Select-Object -Skip ([Math]::Round($Prices.Count / 10))
[Math]::Round((($PricesActual).Price | Measure-Object -Average).Average, 2)
Stop-SeDriver
