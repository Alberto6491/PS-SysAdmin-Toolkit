<#
.SYNOPSIS
    Nettoyage automatise de l'espace disque (Maintenance).
.DESCRIPTION
    Ce script vide la corbeille et supprime les fichiers temporaires (User & Windows)
    plus vieux que X jours.
.PARAMETER Days
    Nombre de jours de retention (par defaut : 30 jours).

#>

param (
    [int]$Days = 30
)

Write-Host "Demarrage du nettoyage (Fichiers de plus de $Days jours)..." -ForegroundColor Cyan

# 1. Vider la Corbeille (Recycle Bin)
Write-Host " - Vidage de la corbeille..." -NoNewline
try {
    Clear-RecycleBin -Force -ErrorAction Stop
    Write-Host " [OK]" -ForegroundColor Green
} catch {
    Write-Host " [Vide ou Erreur]" -ForegroundColor Yellow
}

# 2. Nettoyer les dossiers Temp (Windows + User)
$Folders = @(
    "C:\Windows\Temp",
    "$env:LOCALAPPDATA\Temp"
)

$DateLimit = (Get-Date).AddDays(-$Days)
$Count = 0

foreach ($Folder in $Folders) {
    if (Test-Path $Folder) {
        Write-Host " - Analyse de $Folder..."
        
        # On cherche les fichiers vieux de +X jours
        $Files = Get-ChildItem -Path $Folder -Recurse -File -ErrorAction SilentlyContinue | 
                 Where-Object { $_.LastWriteTime -lt $DateLimit }

        foreach ($File in $Files) {
            try {
                $File | Remove-Item -Force -ErrorAction Stop
                $Count++
            } catch {
                # On ignore les fichiers verrouilles par le systeme
            }
        }
    }
}

Write-Host "Maintenance terminee. $Count fichiers supprimes." -ForegroundColor Green
