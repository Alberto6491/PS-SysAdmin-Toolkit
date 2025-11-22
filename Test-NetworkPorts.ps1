<#
.SYNOPSIS
    Vérifie la connectivité TCP sur une liste de serveurs et de ports.
.DESCRIPTION
    Ce script teste si un port spécifique est ouvert sur une liste de machines cibles.
    Utile pour diagnostiquer des problèmes de pare-feu ou de service arrêté.
#>

param (
    [Parameter(Mandatory=$true)]
    [string[]]$Targets,

    [Parameter(Mandatory=$true)]
    [int]$Port
)

$Results = @()

foreach ($Target in $Targets) {
    Write-Host "Test de la connexion vers $Target sur le port $Port..." -ForegroundColor Cyan
    
    # Test silencieux
    $Test = Test-NetConnection -ComputerName $Target -Port $Port -WarningAction SilentlyContinue

    $Results += [PSCustomObject]@{
        'Cible'       = $Target
        'Port'        = $Port
        'Statut'      = if ($Test.TcpTestSucceeded) { "OUVERT" } else { "FERMÉ / INACCESSIBLE" }
        'Latence(ms)' = $Test.PingReplyDetails.RoundtripTime
    }
}

$Results | Format-Table -AutoSize
