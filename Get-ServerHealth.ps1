<#
.SYNOPSIS
    Effectue un diagnostic rapide de l'état du serveur (Health Check).
.DESCRIPTION
    Ce script récupère les informations essentielles : Uptime, utilisation RAM 
    et espace disque disponible sur C:.
    Il retourne un objet personnalisé, facile à exporter en CSV ou JSON.
#>

function Get-ServerHealth {
    [CmdletBinding()]
    param()

    Write-Host "Analyse du système en cours..." -ForegroundColor Cyan

    # 1. Récupération de l'Uptime (Temps de fonctionnement)
    $os = Get-CimInstance -ClassName Win32_OperatingSystem
    $uptime = (Get-Date) - $os.LastBootUpTime
    $uptimeString = "{0} jours, {1} heures, {2} minutes" -f $uptime.Days, $uptime.Hours, $uptime.Minutes

    # 2. Calcul de la mémoire RAM
    $totalRam = [math]::Round($os.TotalVisibleMemorySize / 1MB, 2)
    $freeRam  = [math]::Round($os.FreePhysicalMemory / 1MB, 2)
    $usedRam  = $totalRam - $freeRam
    $ramPercent = [math]::Round(($usedRam / $totalRam) * 100, 1)

    # 3. Vérification de l'espace disque (Disque C: uniquement)
    $disk = Get-CimInstance -ClassName Win32_LogicalDisk | Where-Object { $_.DeviceID -eq "C:" }
    $totalDisk = [math]::Round($disk.Size / 1GB, 2)
    $freeDisk  = [math]::Round($disk.FreeSpace / 1GB, 2)
    $diskPercent = [math]::Round(($freeDisk / $totalDisk) * 100, 1)

    # 4. Création de l'objet de sortie
    $result = [PSCustomObject]@{
        'Serveur'        = $env:COMPUTERNAME
        'Uptime'         = $uptimeString
        'RAM Totale (GB)'= $totalRam
        'RAM Utilisée'   = "$ramPercent %"
        'Disque C (Libre)'= "$freeDisk GB ($diskPercent %)"
        'Statut Global'  = if ($ramPercent -gt 90 -or $diskPercent -lt 10) { "ALERTE" } else { "OK" }
    }

    return $result
}

# Exécution de la fonction
Get-ServerHealth
