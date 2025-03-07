#!/bin/bash

task="sport"

echo "Quelle tâches voulez-vous supprimer ?"
read supprimer
if [ $supprimer > tasks.txt ] 
then
    
