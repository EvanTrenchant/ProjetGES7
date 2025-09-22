# ProjetGES7
## Prochaine étape effectuer l'asservissement en courant
## Projet Asservissement Machine à Courant Continu

Ce projet a pour objectif de réaliser l’asservissement en **vitesse** et en **courant** d’une machine à courant continu (MCC) avec charge.  
L’asservissement utilise :
- Un capteur tachymétrique ou un codeur incrémental (sélection via un switch).
- Un capteur de courant intégré au hacheur.  

La consigne est de limiter les dépassements en vitesse et en courant à **10–20%**.  
Les simulations sont effectuées avec **PSIM** et **MATLAB**, en validant étape par étape :  
- Moteur seul  
- Ajout de la charge  
- Boucle de courant  
- Boucle de vitesse  
- Correcteurs complets  

Chaque journée de travail doit être consignée dans un répertoire séparé, avec des noms explicites pour les fichiers (ex: `moteur_seul_12sept_11H08.m`).  
Les fichiers temporaires de test portent le nom **`poub.m`** (ou `poub.psimsch`) et ne sont renommés qu’une fois validés.  

---

## Structure du projet
```
ProjetGES7/
├── Projet GES7 Sujet.pdf
├── Modelisation/
│ ├── Jour_mois_année/
│ │ ├── moteur_seul_12sept_11H08.m
│ │ └── poub.m
│ └── Jour_mois_année2/
│ ├── moteur_charge_13sept_11H08.psimsch
│ └── poub.psimsch
├── Resultats/
│ ├── Figures/
│ │ └── Jour_YYYYMMDD/
│ └── Donnees/
│ └── Jour_YYYYMMDD/
├── 05_Final/
│ ├── Simulation_complete/
│ │ ├── Matlab/
│ │ └── PSIM/
├── Rapport_final.pdf
│
└── README.md
```

---

## Convention de nommage
- `Jour_YYYYMMDD_nom_etape/` : répertoire de travail par journée.  
- Fichier MATLAB : `nom_etape_date_heure.m` (ex: `moteur_seul_12sept_11H08.m`).  
- Fichier PSIM : `nom_etape_date_heure.psimsch`.  
- Fichier temporaire de test : `poub.m` / `poub.psimsch`.  

---

## Bonnes pratiques
- Ne garder que les programmes fonctionnels.  
- Sauvegarder les figures et données utiles dans `03_Resultats/`.  
- Tenir le **cahier des charges** et les **rapports** à jour.  
- Regrouper les simulations validées et le rapport final dans `05_Final/`. 
