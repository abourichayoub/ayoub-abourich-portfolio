# ⚡️ Asservissement en Vitesse d'un Moteur DC par Contrôleur PID (Arduino)

Ce projet se concentre sur l'implémentation d'un algorithme de contrôle en boucle fermée pour réguler précisément la vitesse d'un moteur à courant continu (DC) en utilisant un microcontrôleur Arduino.

---

### 🎯 Objectifs et Méthodologie

* **Régulation PID :** Développer et optimiser un contrôleur **PID** pour minimiser l'erreur statique et le temps de réponse du système.
* **Acquisition de Données :** Utilisation d'un **encodeur** pour mesurer la vitesse réelle du moteur (feedback).
* **Commande de Puissance :** Utilisation d'un pont en H (ou d'un driver moteur) pour la modulation de largeur d'impulsion (**PWM**) afin de piloter le moteur.

### 💻 Technologies et Compétences Clés

| Catégorie | Outils/Compétences |
| :--- | :--- |
| **Microcontrôleur** | **Arduino** Uno/Mega |
| **Langage** | **C/C++** |
| **Théorie** | **Asservissement**, Théorie des systèmes, Boucle de régulation |
| **Composants** | Encodeur incrémental, Pont en H (L298N, etc.) |

### 🛠️ Structure du Projet

* `/Code_Arduino` : Contient le sketch Arduino (.ino) avec l'implémentation PID.
* `/Schémas` : Diagramme de câblage et de connexion des composants.
* `/Résultats` : Graphiques des réponses en boucle ouverte et fermée (via Plotter Arduino ou MATLAB).

---

### ✅ Compétences Mises en Œuvre

* Maîtrise de l'algorithme PID et des méthodes de réglage (Ziegler-Nichols, etc.).
* Programmation temps réel sur microcontrôleur.
* Interface entre composants analogiques et numériques.
