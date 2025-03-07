
        3)
            if [ ! -s tasks.txt ]; then
                echo "Aucune tâche à afficher."
            else
                cat -n tasks.txt
            fi
            ;;
