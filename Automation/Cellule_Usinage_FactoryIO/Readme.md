# Automatisation et Supervision d'une Cellule d'Usinage Parallèle

![TIA Portal](https://img.shields.io/badge/TIA_Portal-Siemens-009999?style=for-the-badge&logo=siemens)
![Factory I/O](https://img.shields.io/badge/Factory_I/O-Simulation-blue?style=for-the-badge)
![S7-PLCSIM](https://img.shields.io/badge/S7--1500-PLCSIM_Advanced-darkgrey?style=for-the-badge)

## 📌 Contexte du Projet
[cite_start]Ce projet a été réalisé dans le cadre de ma formation en Ingénierie Électrique (Option Automatique et Informatique Industrielle) à l'EMG Rabat[cite: 1, 2, 3]. [cite_start]Il s'inscrit dans une démarche d'industrie 4.0 axée sur la **mise en service virtuelle (Virtual Commissioning)**.

[cite_start]L'objectif principal est le développement du système de contrôle-commande d'une double cellule d'usinage robotisée[cite: 24]. [cite_start]Le projet associe TIA Portal pour la logique d'automatisme et Factory I/O pour la création du jumeau numérique interactif[cite: 25].

## ⚙️ Architecture Technique

* [cite_start]**Automate Cible :** SIMATIC S7-1500[cite: 79].
* [cite_start]**Langage de Programmation :** LADDER[cite: 125].
* [cite_start]**Structure du Programme :** 16 réseaux (Networks) intégrant des bascules SR, des détecteurs de fronts (P_TRIG/N_TRIG) et des temporisateurs (TON)[cite: 125, 126].
* [cite_start]**Plan d'Adressage :** Gestion rigoureuse de 94 variables (Tags) d'entrées/sorties pour interfacer les capteurs et actionneurs virtuels[cite: 68, 69].
* [cite_start]**Communication :** Échange de trames réseau entre le simulateur S7-PLCSIM Advanced et Factory I/O via les mécanismes PUT/GET[cite: 83].

## 🚀 Fonctionnalités Principales

* [cite_start]**Parallélisme Asynchrone :** Gestion de deux cellules d'usinage de manière totalement indépendante[cite: 60]. [cite_start]Si une cellule est en cours d'usinage, la seconde continue d'absorber le flux, doublant ainsi le rendement (Throughput)[cite: 61, 62].
* [cite_start]**Interverrouillage et Sécurité :** Le robot manipulateur n'agit que si la présence de la pièce est confirmée et que la machine CNC est disponible (porte ouverte, broche à l'arrêt)[cite: 50].
* [cite_start]**Usinage en Temps Masqué :** Optimisation de la cadence en préparant la pièce suivante sur le convoyeur pendant que la CNC usine la pièce en cours[cite: 54].
* [cite_start]**Traçabilité :** Incrémentation automatique du compteur de production (bloc CTU) à l'évacuation de chaque lot[cite: 58, 210].

## 📷 Aperçu du Jumeau Numérique

*(Ajoute ici une image de la vue 3D de Factory I/O)*
`![Vue 3D de la ligne de production](lien_vers_ton_image_factory_io.png)`

## 🛠️ Installation et Simulation

1. [cite_start]Ouvrir le projet `.ap1X` sous **TIA Portal** et compiler la configuration matérielle du S7-1500[cite: 79, 80].
2. [cite_start]Lancer l'instance virtuelle sur **S7-PLCSIM Advanced** et vérifier l'adresse IP[cite: 83, 103, 112].
3. Ouvrir la scène correspondante sur **Factory I/O**.
4. [cite_start]Dans Factory I/O, aller dans `Drivers`, sélectionner `Siemens S7-PLCSIM` et connecter le jumeau numérique à l'automate[cite: 84].
5. [cite_start]Lancer la simulation : l'alimentation des pièces brutes déclenchera automatiquement le cycle[cite: 45].
