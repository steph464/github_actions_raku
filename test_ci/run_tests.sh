#!/bin/bash

################### Modification du répertoire #######################################
cd test_ci
######################################################################################

# Exécution de tous les fichiers de test
python test_authen.py
python test_autho.py
python test_create_user.py
python test_delete_user.py
python test_predimage.py
python test_predtexte.py
