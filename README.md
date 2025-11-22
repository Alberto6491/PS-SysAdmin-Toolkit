# PS-SysAdmin-Toolkit 🛠️

Ce dépôt regroupe des scripts PowerShell destinés à l'administration système, l'automatisation et la sécurité des environnements Windows.

## 📂 Scripts disponibles

### 1. Get-ServerHealth.ps1
Un utilitaire pour effectuer un diagnostic rapide de l'état de santé d'un serveur ou d'un poste de travail.

**Fonctionnalités :**
* Récupération de l'**Uptime** (temps d'activité).
* Calcul du pourcentage d'utilisation de la **RAM**.
* Vérification de l'espace libre sur le disque **C:**.
* Retourne un objet PowerShell propre (exploitable pour des logs ou de l'export CSV).

**Utilisation :**
```powershell
.\Get-ServerHealth.ps1
