# 🛠️ PS-SysAdmin-Toolkit

> **Administration Système & Réseau | Automatisation | Sécurité**

Ce dépôt regroupe une collection d'outils PowerShell optimisés pour l'administration quotidienne, le troubleshooting réseau et l'audit de sécurité en environnement Windows.

---

## 📋 Vue d'ensemble

| Fichier | Catégorie | Description rapide |
| :--- | :--- | :--- |
| **`Get-ServerHealth.ps1`** | 📊 Monitoring | Diagnostic santé (RAM, CPU, Disque, Uptime). |
| **`Test-NetworkPorts.ps1`** | 🔌 Réseau | Test de connectivité TCP (Port Check). |

---

## 📂 Détails des Scripts

### 1️⃣ Get-ServerHealth.ps1
*Health Check rapide pour serveurs et postes de travail.*

**Fonctionnalités clés :**
* ✅ Récupération de l'**Uptime** précis.
* ✅ Calcul du pourcentage d'utilisation de la **RAM**.
* ✅ Monitoring de l'espace disque critique sur **C:**.
* ✅ **Sortie Objet :** Retourne un objet PowerShell propre, idéal pour l'export CSV/JSON.

**Utilisation :**
```powershell
.\Get-ServerHealth.ps1
```
### 2️⃣ Test-NetworkPorts.ps1
*Outil de troubleshooting avancé. Remplace le Ping pour valider les flux applicatifs.*

**Fonctionnalités clés :**
* ✅ **Validation TCP :** Vérifie l'ouverture réelle du port (Layer 4) contrairement au Ping (Layer 3).
* ✅ **Multi-Cibles :** Permet de scanner une liste de serveurs ou d'IPs simultanément.
* ✅ **Diagnostic Rapide :** Identifie instantanément si le problème vient du réseau ou du service.

**Utilisation :**
```powershell
# Exemple : Vérifier l'accès RDP (3389) sur un serveur de fichiers et une IP interne
.\Test-NetworkPorts.ps1 -Targets "SRV-FICHIERS", "192.168.10.50" -Port 3389
```
