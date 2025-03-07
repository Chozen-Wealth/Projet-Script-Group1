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
       
        2)
            if [ ! -s tasks.txt ]; then
                echo "La liste de tâche est vide."
                continue
            fi

            echo "Liste des tâches :"
            nl -w2 -s'. ' tasks.txt

            echo -n "Entrez le numéro de la tâche à supprimer : "
            read numero_tache

            if ! [[ "$numero_tache" =~ ^[0-9]+$ ]]; then
                echo "Erreur : Veuillez entrer un numéro valide."
                continue
            fi

            total_taches=$(wc -l < tasks.txt)
            if [ "$numero_tache" -le 0 ] || [ "$numero_tache" -gt "$total_taches" ]; then
                echo "Erreur : Numéro invalide."
                continue
            fi

            sed -i "${numero_tache}d" tasks.txt
            echo "Tâche supprimée avec succès."
            ;;


    

        3)
            if [ ! -s tasks.txt ]; then
                echo "Aucune tâche à afficher."
            else
                cat -n tasks.txt
            fi
            ;;

    esac
done
 