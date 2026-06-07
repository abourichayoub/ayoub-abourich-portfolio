# 🏭 Projets d'Automatisation Industrielle et Systèmes Embarqués

## 📌 Présentation
Ce répertoire regroupe plusieurs projets appliqués en informatique industrielle et automatisation. L'objectif de ces travaux est de concevoir et valider des chaînes de commande complètes : de la programmation bas niveau sur microcontrôleurs (logique matérielle) jusqu'à la supervision haut niveau sur des standards industriels (IHM/API/Simulation 3D).

## ⚙️ Projets Développés

### 1. Supervision et IHM (Siemens TIA Portal)
* **Dossier :** `Supervision_TIA_Portal/`
* **Description :** Conception d'une Interface Homme-Machine (IHM) pour la supervision de processus industriels.
* **Réalisations :** Création d'animations dynamiques, gestion des variables de communication (tags) entre l'automate programmable (API) et l'écran de supervision, et résolution des problématiques de connexion réseau.

### 2. Contrôle d'un Ascenseur à 3 Étages
* **Dossier :** `Ascenseur_3_Etages_PIC/`
* **Description :** Automatisation complète de la logique de commande d'un ascenseur.
* **Réalisations :** Développement du programme en langage C sous **MikroC**, gestion des appels cabine/paliers, des capteurs de fin de course, et simulation interactive du circuit électronique sous **Proteus**.

### 3. Système de Portail Automatique
* **Dossier :** `Portail_Automatique_PIC/`
* **Description :** Logique de contrôle pour l'ouverture et la fermeture d'un portail motorisé.
* **Réalisations :** Programmation PIC avec **MikroC**, intégration de capteurs de présence/sécurité, et validation du fonctionnement via schéma de simulation **Proteus**.

### 4. Interface de Puissance : Contrôle Moteur 36V
* **Dossier :** `Controle_Moteur_Pont_H/`
* **Description :** Interfaçage entre une logique de commande basse tension et un actionneur de puissance.
* **Réalisations :** Commande d'un moteur DC 36V à partir des signaux 5V d'un microcontrôleur PIC, en utilisant un circuit d'entraînement en pont en H (H-bridge driver).

### 5. Cellule d'Usinage Parallèle (Virtual Commissioning)
* **Dossier :** `Cellule_Usinage_FactoryIO/`
* **Description :** Automatisation et mise en service virtuelle d'une double cellule d'usinage robotisée asynchrone.
* **Réalisations :** Développement d'une architecture LADDER à 16 réseaux pour gérer 94 variables sur un automate SIMATIC S7-1500, couplage réseau via accès PUT/GET avec le logiciel de simulation 3D **Factory I/O**, et validation des interverrouillages de sécurité et de la traçabilité par comptage en temps réel.

## 🛠️ Outils et Technologies Utilisés
* **Automatisme Industriel & Simulation 3D :** Siemens TIA Portal (API S7-1500, LADDER, IHM), Factory I/O, S7-PLCSIM Advanced.
* **Systèmes Embarqués :** Microcontrôleurs PIC, MikroC PRO for PIC, Langage C.
* **Simulation Électronique :** Proteus ISIS.
* **Compétences :** Logique combinatoire et séquentielle, parallélisme asynchrone, interfaçage de puissance, réseaux industriels (communication PUT/GET), mise en service virtuelle (Virtual Commissioning).
