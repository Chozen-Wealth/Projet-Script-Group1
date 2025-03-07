        4)  
            echo "Option Supprimer une tâche sélectionnée."  
            # Vérifier s'il y a des tâches dans tasks.txt
            if [[ ! -s tasks.txt ]]; then  
                echo "Aucune tâche à supprimer."  
            else  
                echo "Voici la liste des tâches :"
                nl tasks.txt  # Affiche les tâches avec un numéro
                read -p "Entrez le numéro de la tâche à supprimer : " num_tache

                # Vérifier si la tâche existe
                if sed -n "${num_tache}p" tasks.txt >/dev/null; then
                    # Supprimer la tâche sélectionnée
                    sed -i "${num_tache}d" tasks.txt
                    echo "Tâche supprimée."
                else
                    echo "Tâche invalide, numéro introuvable."
                fi
            fi
            ;;  
     esac
done  
