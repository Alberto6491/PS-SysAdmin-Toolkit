<#
.SYNOPSIS
    Audit de sécurité des utilisateurs locaux.
.DESCRIPTION
    Ce script liste tous les comptes utilisateurs locaux et vérifie leur état 
    (Actif/Désactivé, Date de dernier mot de passe, Expiration).
#>

function Get-LocalUserAudit {
    Write-Host "Audit des utilisateurs locaux en cours..." -ForegroundColor Cyan

    # Obtener usuarios locales
    $Users = Get-LocalUser

    $Results = foreach ($User in $Users) {
        # Calcul de l'âge du mot de passe
        if ($User.PasswordLastSet) {
            $PwdAge = ((Get-Date) - $User.PasswordLastSet).Days
            $PwdAgeStr = "$PwdAge jours"
        } else {
            $PwdAgeStr = "JAMAIS"
        }

        # Création de l'objet (Éviter les accents dans les clés pour éviter les erreurs.)
        [PSCustomObject]@{
            'Compte'           = $User.Name
            'Actif'            = if ($User.Enabled) { "OUI" } else { "NON" }
            'Dernier Login'    = if ($User.LastLogon) { $User.LastLogon } else { "Jamais" }
            'Age Mot de Passe' = $PwdAgeStr
            'Pwd Expire'       = if ($User.PasswordExpires) { "Oui" } else { "NON (Danger)" }
            'Description'      = $User.Description
        }
    }

    # Afficher le résultat sous forme de tableau trié
    $Results | Sort-Object "Actif" -Descending | Format-Table -AutoSize
}

# Exécution
Get-LocalUserAudit
