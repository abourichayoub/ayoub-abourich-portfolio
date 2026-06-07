# Simulateur Python pour le Monitoring Énergétique - Ligne d'Impression Fiduciaire

![Statut](https://img.shields.io/badge/Statut-Projet_de_Fin_d'Études-success?style=for-the-badge)
![Domaine](https://img.shields.io/badge/Domaine-Efficacité_Énergétique_&_IIoT-ff69b4?style=for-the-badge)
![Institution](https://img.shields.io/badge/Institution-Bank_Al--Maghrib-0066cc?style=for-the-badge)
![Technologie](https://img.shields.io/badge/Technologie-Python-blue?style=for-the-badge&logo=python)

## 📌 Contexte du Projet
Ce projet constitue mon Projet de Fin d'Études (PFE) en ingénierie électrique, réalisé pour **Bank Al-Maghrib - Dar As-Sikkah**. Il s'inscrit dans la démarche de certification **ISO 50001** visant à optimiser l'efficacité énergétique de la ligne d'impression fiduciaire (KBA).

Pour éliminer l'effet de "boîte noire" de la distribution électrique centralisée et identifier l'énergie fatale des quatre presses (Offset, Taille-douce, Sérigraphie, Numérotation), j'ai conçu une architecture de monitoring non intrusive basée sur l'Internet des Objets Industriels (IIoT). L'intégralité de l'acquisition de données a été développée et validée à l'aide d'un **simulateur Python**.

## ⚙️ Architecture Technique

* **Simulation et Acquisition :** Développement d'un script Python pour émuler le comportement des compteurs d'énergie et capteurs de courant (SOCOMEC DIRIS Digiware) afin de générer les profils de consommation.
* **Communication Industrielle :** Échange et transmission des données via le protocole **Modbus TCP/IP**.
* **Déploiement :** Environnement conteneurisé utilisant **Docker** pour garantir la portabilité du système.
* **Supervision (SCADA) :** Création de tableaux de bord dynamiques et analytiques sur **Grafana**.

## 🚀 Fonctionnalités Principales

* **Acquisition Simulée en Temps Réel :** Collecte en continu des données de consommation générées artificiellement par le programme Python pour chaque presse fiduciaire.
* **Dashboards Analytiques :** Visualisation précise des flux énergétiques et suivi des indicateurs de performance clés (IPÉ) sur Grafana.
* **Architecture Scalable :** Conception d'un système IIoT modulaire, testé via simulation, et prêt à être déployé sur des installations physiques critiques.

## 📄 Livrables

* 📄 **Rapport technique détaillé :** [Consulter le rapport PFE](./Rapport_PFE.pdf)
