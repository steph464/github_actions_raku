Utiliser avec app_V4 pour lancer l'api

rendre le fichier run_tests.sh exécutable
chmod +x run_tests.sh

Lancer les tests à partir du terminal
commande: ./run_tests.sh   --> fonctionnel

TODO
Créer Dockerfile pour les tests

(API) root@Stphane:/home/workspace/API/test_CI_CD# docker build -t test-runner2 -f /home/workspace_3/API_rakuten/CI_CD/Dockerfile.CI_CD .
Step 12/12 : CMD ["./run_tests.sh"]
 ---> Running in bd73fd481f99
Removing intermediate container bd73fd481f99
 ---> 44067b37fe4d
Successfully built 44067b37fe4d
Successfully tagged test-runner:latest

(API) root@Stphane:/home/workspace/API/app_v2/test# docker images
REPOSITORY                TAG          IMAGE ID       CREATED          SIZE
test-runner1              latest       97ebca487a95   59 seconds ago   69.3MB

(API) root@Stphane:/home/workspace/API/test_CI_CD# docker run -it test-runner2 ls /app/tests
requirements.txt     test_autho.py        test_predimage.py
run_tests.sh         test_create_user.py  test_predtexte.py
test_authen.py       test_delete_user.py

(API) root@Stphane:/home/workspace/API/test_CI_CD# docker run -it test-runner1 ls -l /app/tests/run_tests.sh
-rwxr-xr-x    1 root     root           202 Nov  5 12:11 /app/tests/run_tests.sh

(API) root@Stphane:/home/workspace/API/test_CI_CD# docker run -it test-runner1 cat /app/tests/run_tests.sh
#!/bin/bash

# Exécution de tous les fichiers de test
python test_authen.py
python test_autho.py
python test_create_user.py
python test_delete_user.py
python test_predimage.py
python test_predtexte.py

(API) root@Stphane:/home/workspace/API/test_CI_CD# docker run -it test-runner1 pwd
/app/tests

(API) root@Stphane:/home/workspace/API/app_v2/test# docker run -it test-runner1 env
PATH=/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
HOSTNAME=a5159d4c11a3
TERM=xterm
LANG=C.UTF-8
GPG_KEY=E3FF2839C048B25C084DEBE9B26995E310250568
PYTHON_VERSION=3.8.18
PYTHON_PIP_VERSION=23.0.1
PYTHON_SETUPTOOLS_VERSION=57.5.0
PYTHON_GET_PIP_URL=https://github.com/pypa/get-pip/raw/c6add47b0abf67511cdfb4734771cbab403af062/public/get-pip.py
PYTHON_GET_PIP_SHA256=22b849a10f86f5ddf7ce148ca2a31214504ee6c83ef626840fde6e5dcd809d11
HOME=/root

(API) root@Stphane:/home/workspace/API/app_v2/test# docker run -it --network host test-runner1 /bin/sh /app/tests/run_tests.sh
script de test Python tente de faire des requêtes HTTP vers un serveur local sur le port 8000 (API)
qui n'est pas accessible depuis le conteneur --> En attente connexion FastAPI

(raku_env) root@Stphane:/home/workspace_3/API_rakuten/CI_CD# docker run -it --network host test-runner1 /bin/sh /app/tests/run_tests.sh

    ============================
        Authentication test
    ============================

    request done at "/Users/user"
    | username="david"
    | password="chocolat"
    
    expected result = 200
    actual result = 200

    ==>  SUCCESS
    

    ============================
        Authentication test
    ============================

    request done at "/Users/user"
    | username="stephane"
    | password="sport"
    
    expected result = 200
    actual result = 401

    ==>  FAILURE
    

    ============================
        Authentication test
    ============================

    request done at "/Users/user"
    | username="clementine"
    | password="mandarine"
    
    expected result = 401
    actual result = 401

    ==>  SUCCESS
    

    ============================
        Autorisation test for /predict_text_class    
    ============================

    request done at "/Predictions/predict_text_class"
    | username="david"
    | password="chocolat"
    
    expected result = 200
    actual result = 200

    ==>  SUCCESS
    

    ============================
        Autorisation test for /predict_text_class    
    ============================

    request done at "/Predictions/predict_text_class"
    | username="clementine"
    | password="mandarine"
    
    expected result = 401
    actual result = 401

    ==>  SUCCESS
    
Traceback (most recent call last):
  File "test_create_user.py", line 12, in <module>
    from app_V3.user.user_db import add_user, load_users
ModuleNotFoundError: No module named 'app_V3'
Traceback (most recent call last):
  File "test_delete_user.py", line 11, in <module>
    from app_V3.user.user_db import delete_user, load_users
ModuleNotFoundError: No module named 'app_V3'
Image not found at /home/workspace/API/app/test/image_test/image_938157330_product_199450457.jpg

====================================================================
    Predictions test using CONV1D BASED MODEL - results
====================================================================

request done at "predict_text_class"
| username = 'admin'
| password = 'boss'
| designation = 'Robot de piscine électrique'
| description = '<p>Ce robot de piscine d&#39;un design innovant et élégant apportera un nettoyage efficace et rapide.'

expected result code = 200
expected Predicted class code =  2583

actual result code = 200
actual Predicted class code = 2583  
==> Code result = SUCCESS
==> Prediction result = SUCCESS