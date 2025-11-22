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
2. Test-NetworkPorts.ps1
Outil de troubleshooting réseau. Il permet de tester l'ouverture d'un port TCP spécifique sur une ou plusieurs machines distantes.

Utilisation :

PowerShell

# Tester le port web (80) sur google.fr et un serveur local
.\Test-NetworkPorts.ps1 -Targets "google.fr", "192.168.1.50" -Port 80
🧐 Pourquoi utiliser ce script ? (L'utilité réelle)
Dans un réseau d'entreprise, la commande Ping ne suffit pas.

Le Ping (ICMP) vérifie seulement si la machine est allumée.

Ce Script (TCP) vérifie si la porte est ouverte.

Cas d'usage concrets pour un Admin Sys :

Troubleshooting : Un utilisateur ne peut pas accéder à l'Intranet. Le serveur répond au Ping, mais le service Web est peut-être arrêté. Ce script le confirmera immédiatement.

Audit Firewall : Vérifier que les règles de sécurité sont appliquées (ex: le port RDP 3389 doit être bloqué, mais le port HTTPS 443 doit être ouvert).

Connectivité Applicative : Vérifier si un serveur d'application peut bien communiquer avec son serveur de Base de Données (SQL Port 1433).

🚀 Comment l'utiliser (Guide pour débutants)
Si vous n'êtes pas familier avec Git ou PowerShell, voici comment tester ce script manuellement :

1. Créer le fichier

Ouvrez le Bloc-notes (Notepad).

Copiez le code du script Test-NetworkPorts.ps1 (disponible dans ce dépôt).

Collez-le dans le Bloc-notes.

Important : Enregistrez le fichier sous le nom Test-NetworkPorts.ps1 (dans le champ "Type", choisissez "Tous les fichiers" et non ".txt").

2. Lancer le script Ouvrez PowerShell, naviguez vers le dossier où vous avez enregistré le fichier et lancez la commande suivante :

PowerShell

# Exemple pour tester le port 80 (Web)
.\Test-NetworkPorts.ps1 -Targets "google.fr" -Port 80
3. Interpréter le résultat

🟢 OUVERT : Le service est accessible, le réseau fonctionne.

🔴 FERMÉ : Le service est éteint ou un Pare-feu bloque la connexion.
