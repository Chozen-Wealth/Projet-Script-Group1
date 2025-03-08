 #!/bin/bash

tache="tasks.txt"
echo "Bienvenue dans ta to-do list."
while true; do

    echo "1) Ajouter une tâche."
    echo "2) Supprimer une tâche."
    echo "3) Afficher une tâche."
    echo "4) Quitter."

    read -p "Choississez une option: " choix
# le >> permet d'ajouter la tache sur le fichier text sans ecraser le contenu ou en créer un nouveau a chaque fois
    case $choix in
        1)  
            read -p "Entrez la description de la tâche : " task
            echo "$task" >> "$tache"
            echo "Tâche ajoutée avec succès."
            ;;
       
        2)
            if [ ! -s tasks.txt ]; then # ! -s permet de verifier si le fichier est vide
                echo "La liste de tâche est vide." # si le fichier est vide on affiche ce message
                continue # on continue la boucle
            fi

            echo "Liste des tâches :" # sinon on affiche la liste des taches
            nl -w2 -s'. ' tasks.txt # nl permet de numeroter les taches et -w2 permet de specifier la largeur du numero

            echo -n "Entrez le numéro de la tâche à supprimer : " # on demande a l'utilisateur de saisir le numero de la tache a supprimer
            read numero_tache # on stocke la valeur saisie dans la variable numero_tache

            if ! [[ "$numero_tache" =~ ^[0-9]+$ ]]; then # on verifie si la valeur saisie est un nombre
                echo "Erreur : Veuillez entrer un numéro valide." # si non on affiche ce message
                continue # on continue la boucle
            fi

            total_taches=$(wc -l < tasks.txt) # on compte le nombre de taches
            if [ "$numero_tache" -le 0 ] || [ "$numero_tache" -gt "$total_taches" ]; then # on verifie si le numero de la tache est valide
                echo "Erreur : Numéro invalide." # si non on affiche ce message
                continue # on continue la boucle
            fi

            sed -i "${numero_tache}d" tasks.txt # on supprime la tache
            echo "Tâche supprimée avec succès." # on affiche ce message
            ;;


        3)
            if [ ! -s tasks.txt ]; then
                echo "Aucune tâche à afficher."
            else
                cat -n tasks.txt
            fi
            ;;
 
        4)
            echo "Au revoir !"
            exit 0
            ;;
     esac
done 
 
