#!/bin/bash

echo "Bienvenue dans ta to-do list."
echo "1) Ajouter une tâche."
echo "2) Supprimer une tâche."
echo "3) Afficher une tâche."
echo "4) Quitter."

read -p "Choississez une option: " choix

case $choix in
    1)
        delete_task()
        ;;



delete_task() {
    if [ ! -s tasks.txt ]; then
        echo "La liste de tâche est vide."
        return
    fi

    echo "Liste des tâches :"
    nl -w2 -s'. ' tasks.txt

    echo -n "Entrez le numéro de la tâche à supprimer : "
    read numero_tache
}



    
