#!/bin/bash

task_file="tasks.txt"

show_menu() {
    echo "1) Ajouter une tâche"
    echo "2) Supprimer une tâche"
    echo "3) Afficher les tâches"
    echo "4) Modifier une tâche"
    echo "5) Effacer toutes les tâches"
    echo "6) Quitter"
}

add_task() {
    echo "Entrez une tâche à ajouter :"
    read task
    echo "$task" >> "$task_file"
    echo "Tâche ajoutée !"
}

show_tasks() {
    if [ ! -s "$task_file"]; then
        echo "Aucune tâche enregistrée."
        return
    fi
    nl -w2 -s") " "$task_file"
}

delete_task() {
    show_tasks
    echo "Entrez le numéro de la tâche à supprimer :"
    read num
    if sed -i "${num}d" "$task_file" 2>/dev/null; then
        echo "Tâche supprimée !"
    else
        echo "Numéro invalide."
    fi
}

edit_task() {
    show_tasks
    echo "Entrez le numéro de la tâche à miodifier :"
    read num
    echo "Nouvelle description :"
    read new_task
    sed -i "${num}s/.*/$new_task/" "$task_file" 2>/dev/null && echo "Tâche modifiée !" || echo "Numéro invalide."
}

clear_tasks() {
    > "$task_file"
    echo "Toutes les tâches ont été effacées."
}

while true; do
    show_menu
    echo "Choisissez une option :"
    read choice

    case $choice in
        1) add_task ;;
        2) delete_task ;;
        3) show_tasks ;;
        4) edit_task ;;
        5) clear_tasks ;;
        6) echo "Au revoir !"; exit 0 ;;
        *) echo "Option invalide. Veuillez réessayer." ,,
    esac
done