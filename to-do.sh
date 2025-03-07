#!/bin/bash

tache="tasks.txt"
echo "Bienvenue dans ta to-do list."
while true; do
    
    echo "1) Ajouter une tâche."
    echo "2) Supprimer une tâche."
    echo "3) Afficher une tâche."
    echo "4) Quitter."

    read -p "Choississez une option: " choix

    case $choix in
        1)  
            read -p "Entrez la description de la tâche : " task
            echo "$task" >> "$tache"
            echo "Tâche ajoutée avec succès."
            ;;
       