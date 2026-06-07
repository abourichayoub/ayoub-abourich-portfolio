# Automatisation et Supervision d'une Cellule d'Usinage Parallèle

![TIA Portal](https://img.shields.io/badge/TIA_Portal-Siemens-009999?style=for-the-badge&logo=siemens)
![Factory I/O](https://img.shields.io/badge/Factory_I/O-Simulation-blue?style=for-the-badge)
![S7-PLCSIM](https://img.shields.io/badge/S7--1500-PLCSIM_Advanced-darkgrey?style=for-the-badge)

## 📌 Contexte du Projet
Ce projet a été réalisé dans le cadre de ma formation en Ingénierie Électrique (Option Automatique et Informatique Industrielle) à l'EMG Rabat. Il s'inscrit dans une démarche d'industrie 4.0 axée sur la **mise en service virtuelle (Virtual Commissioning)**.

L'objectif principal est le développement du système de contrôle-commande d'une double cellule d'usinage robotisée. Le projet associe TIA Portal pour la logique d'automatisme et Factory I/O pour la création du jumeau numérique interactif.

## ⚙️ Architecture Technique

* **Automate Cible :** SIMATIC S7-1500.
* **Langage de Programmation :** LADDER.
* **Structure du Programme :** 16 réseaux (Networks) intégrant des bascules SR, des détecteurs de fronts (P_TRIG/N_TRIG) et des temporisateurs (TON).
* **Plan d'Adressage :** Gestion rigoureuse de 94 variables (Tags) d'entrées/sorties pour interfacer les capteurs et actionneurs virtuels.
* **Communication :** Échange de trames réseau entre le simulateur S7-PLCSIM Advanced et Factory I/O via les mécanismes PUT/GET.

## 🚀 Fonctionnalités Principales

* **Parallélisme Asynchrone :** Gestion de deux cellules d'usinage de manière totalement indépendante. Si une cellule est en cours d'usinage, la seconde continue d'absorber le flux, doublant ainsi le rendement (Throughput).
* **Interverrouillage et Sécurité :** Le robot manipulateur n'agit que si la présence de la pièce est confirmée et que la machine CNC est disponible (porte ouverte, broche à l'arrêt).
* **Usinage en Temps Masqué :** Optimisation de la cadence en préparant la pièce suivante sur le convoyeur pendant que la CNC usine la pièce en cours.
* **Traçabilité :** Incrémentation automatique du compteur de production (bloc CTU) à l'évacuation de chaque lot.

## 🎥 Démonstration et Livrables

Ce dépôt agit comme une vitrine technique du travail réalisé en environnement simulé.

* 📄 **Rapport technique détaillé :** [Consulter le rapport de projet](./rapport.pdf)
* 🎬 **Vidéo de la mise en service virtuelle :** [Voir la démonstration du jumeau numérique](./simulation.mp4)
