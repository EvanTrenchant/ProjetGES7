# Système de Gestion Automatique des Chemins de Figures

## Description

Ce système permet de générer automatiquement la liste des figures avec leurs chemins d'accès aux fichiers de simulation correspondants.

## Fichiers impliqués

1. **`config/figure-paths.tex`** : Définit les commandes LaTeX pour la gestion des chemins
2. **`config/figure-paths-definitions.tex`** : Contient toutes les définitions de chemins
3. **`contenu/liste_figures_chemins.tex`** : Affiche automatiquement la liste

## Utilisation

### Ajouter un chemin pour une nouvelle figure

Dans le fichier `config/figure-paths-definitions.tex`, ajoutez une ligne :

```latex
\figpath{fig:votre_label}{Chemin/vers/votre/fichier.ext}
```

**Exemple :**
```latex
\figpath{fig:schema_moteur}{Modelisation/01_12_09_2025/moteur.slx}
```

**Important :** 
- Le label doit correspondre exactement au label utilisé dans votre `\label{...}` dans le document
- Les underscores `_` dans le chemin doivent être échappés avec `\_`

### La liste se met à jour automatiquement

Une fois que vous avez défini le chemin avec `\figpath`, il apparaîtra automatiquement dans la section "Liste des figures et chemins d'accès" lors de la compilation du document.

## Commandes disponibles

- `\figpath{label}{chemin}` : Associe un chemin à une figure
- `\getfigpath{label}` : Récupère le chemin d'une figure (utilisable n'importe où dans le document)
- `\printfigurelist` : Affiche la liste complète (déjà utilisé dans `liste_figures_chemins.tex`)

## Exemple complet

1. Dans votre chapitre, vous avez une figure :
```latex
\begin{figure}[H]
    \centering
    \includegraphics[width=0.8\textwidth]{images/schema.png}
    \caption{Schéma du moteur}
    \label{fig:schema_moteur}
\end{figure}
```

2. Dans `config/figure-paths-definitions.tex`, ajoutez :
```latex
\figpath{fig:schema_moteur}{Modelisation/01\_12\_09\_2025/moteur.slx}
```

3. La liste sera automatiquement générée :
```
Figure 1.2: Modelisation/01_12_09_2025/moteur.slx
```

## Remarques

- Vous pouvez organiser les définitions par chapitre dans le fichier `figure-paths-definitions.tex` pour plus de clarté
- Si une figure n'a pas de fichier de simulation associé, ne la définissez pas avec `\figpath` et elle n'apparaîtra pas dans la liste
- Les chemins sont affichés en police monospace (`\texttt`) pour une meilleure lisibilité
