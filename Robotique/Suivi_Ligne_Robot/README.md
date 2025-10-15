# 📍 Robot de Suivi de Ligne

Ce projet détaille la conception, l'assemblage et la programmation d'un robot mobile autonome capable de détecter et de suivre un chemin marqué au sol (ligne noire sur fond blanc ou inversement).

---

### 🎯 Objectifs et Implémentation

* **Détection :** Utilisation d'un ensemble de **capteurs infrarouges** pour lire la position de la ligne.
* **Algorithme de Décision :** Mise en œuvre d'une **logique de contrôle** (souvent une machine à états simple ou une logique PID de base) pour ajuster les vitesses des moteurs.
* **Mobilité :** Commande de deux moteurs indépendants pour permettre les virages et la correction de trajectoire.

### 💻 Technologies et Compétences Clés

| Catégorie | Outils/Compétences |
| :--- | :--- |
| **Microcontrôleur** | **Arduino** ou autre microcontrôleur (STM32, ESP32) |
| **Langage** | **C/C++** |
| **Composants** | Capteurs à réflexion infrarouge, Driver moteur, Moteurs DC/Servos |
| **Théorie** | Robotique mobile, Algorithmes de navigation simples |

### 🛠️ Structure du Projet

* `/Code_Source` : Fichier de code du robot (`.ino`).
* `/Câblage` : Schéma de connexion entre le microcontrôleur, les capteurs et le driver moteur.
* `/Vidéos` : Courte vidéo montrant le robot en action.

---

### ✅ Compétences Mises en Œuvre

* Intégration matériel/logiciel (hardware/software).
* Gestion des entrées/sorties numériques et analogiques.
* Optimisation de la réactivité de l'algorithme de suivi.
