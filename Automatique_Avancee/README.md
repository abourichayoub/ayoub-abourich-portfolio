# 📈 Automatique Avancée : Représentation et Commande dans l'Espace d'État

## 📌 Contexte
Ce répertoire regroupe une série d'études portant sur la modélisation et la commande de systèmes dynamiques continus en utilisant la représentation d'état. Ces travaux ont été réalisés sous **MATLAB et Simulink** et illustrent la progression de la théorie du contrôle : de l'analyse de stabilité jusqu'à la commande optimale LQR.

---

## 🚀 Projets Détaillés

### 1. Modélisation et Analyse dans l'Espace d'État (TP1)
Ce premier volet se concentre sur l'étude des systèmes dans l'espace d'état sous Matlab et Simulink[cite: 1].
* **Systèmes étudiés :** Modélisation d'un circuit électrique RLC, d'un système mécanique (masse en translation) et d'un Moteur à Courant Continu (MCC)[cite: 1].
* **Analyse :** Passage de la représentation d'état à la fonction de transfert externe[cite: 1].
* **Simulation :** Étude comparative des réponses temporelles (indicielle et impulsionnelle) et de l'analyse fréquentielle (Bode) en Boucle Ouverte (BO) et en Boucle Fermée (BF)[cite: 1].

### 2. Commande par Placement de Pôles (TP2)
Ce projet illustre les concepts de commande par retour d'état de systèmes linéaires mono-variables appliqués à un Moteur à Courant Continu[cite: 2].
* **Vérification :** Analyse de la matrice de commandabilité pour garantir qu'un placement de pôles arbitraire est possible[cite: 2].
* **Retour d'état simple :** Synthèse d'une matrice de gain modifiant la matrice d'évolution du système pour imposer une dynamique désirée en boucle fermée[cite: 2].
* **Action intégrale :** Ajout d'un état augmenté intégrant l'erreur pour annuler l'erreur en régime permanent et assurer un suivi de consigne parfait[cite: 2].
* **Analyse physique :** Étude des limites de l'effort de commande (courant d'induit) face à une dynamique extrêmement nerveuse[cite: 2].

### 3. Commande Optimale LQR (TP3)
Mise en place d'un Régulateur Linéaire Quadratique (LQR) pour trouver le meilleur compromis entre la rapidité de la réponse et l'énergie dépensée par les actionneurs[cite: 3].
* **Résolution :** Utilisation de l'équation algébrique de Riccati en continu pour déterminer le gain optimal[cite: 3].
* **Pondération :** Analyse de l'impact des matrices Q (pénalisation de l'état/erreur) et R (pénalisation de l'effort de commande) sur les performances du moteur[cite: 3].
* **Pré-compensation :** Calcul analytique et intégration d'un gain de pré-compensation pour réaliser un asservissement et forcer le gain statique de la boucle fermée à 1[cite: 3].

---

## 🛠️ Outils et Compétences
* **Logiciels :** MATLAB, Simulink.
* **Théorie du Contrôle :** Représentation d'état, Observabilité / Commandabilité, Placement de pôles, Commande avec action intégrale, Régulateur LQR (Riccati).
* **Domaines d'application :** Systèmes électromécaniques (Moteur à Courant Continu), Électronique (RLC), Mécanique.
