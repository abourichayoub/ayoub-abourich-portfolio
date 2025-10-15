# 🐍 Projet de Supervision Industrielle avec Python

Ce projet a pour objectif le développement d'une interface de supervision (SCADA/HMI) pour un [système automatisé spécifique, ex: simulateur de cuve de mélange] en utilisant le langage Python.

---

### 🎯 Objectifs et Rôles

* **Interface Utilisateur :** Création d'une IHM intuitive pour afficher l'état du système en temps réel.
* **Communication :** Établir une communication fiable avec le PLC ou un simulateur PLC via un protocole standard.
* **Historisation :** Enregistrement des données de production et des événements critiques dans une base de données.

### 💻 Technologies et Outils Clés

| Catégorie | Outils/Compétences |
| :--- | :--- |
| **Langage** | **Python** |
| **Librairies IHM** | [Tkinter / PyQt / Kivy - Choisissez celui utilisé] |
| **Protocole de Com.** | **Modbus TCP** (via `pymodbus`) ou **OPC UA** |
| **Base de Données** | [SQLite / MySQL - Si applicable] |

### 🛠️ Structure du Répertoire

* `/src` : Contient le code source Python de l'application.
* `/config` : Fichiers de configuration ou de mappage d'adresses Modbus.
* `/data` : Logs ou fichiers de données historiques.

---

### ✅ Compétences Mises en Œuvre

* Maîtrise de la programmation orientée objet (POO) en Python.
* Compréhension des protocoles de communication industrielle.
* Gestion des threads pour la mise à jour asynchrone des données.
