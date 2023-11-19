# créer un environnement virtuel

# Construction du Dockerfile.app
(raku_env) root@Stphane:/home/workspace_3/API_rakuten/app_V4# docker build -f Dockerfile.app -t api_rakuten_recup .

# Vérification de l'image créé
(raku_env) root@Stphane:/home/workspace_3/API_rakuten_V4/app# docker images
REPOSITORY                  TAG          IMAGE ID       CREATED          SIZE
api_rakuten_v4              latest       70dd65294e80   18 seconds ago   4.04GB

# Lancer le conteneur
(raku_env) root@Stphane:/home/workspace_3/API_rakuten/app_V4# docker run -d -p 8000:8000 --name conteneur_app api_rakuten_v4
45b755e19a78b8f1d90f229cfbdff38485e67245864798c2216569970169da57

# Vérification de l'existence du container
(raku_env) root@Stphane:/home/workspace_3/API_rakuten_V4/app# docker ps
CONTAINER ID   IMAGE            COMMAND                  CREATED              STATUS              PORTS                                       NAMES
86cc8623e8f6   api_rakuten_v4   "uvicorn main_router…"   About a minute ago   Up About a minute   0.0.0.0:8000->8000/tcp, :::8000->8000/tcp   conteneur_app

# Vérifier le contenu du container
(raku_env) root@Stphane:/home/workspace_3/API_rakuten_V4/app# docker exec -it conteneur_app /bin/bash
root@86cc8623e8f6:/app# ls
Dockerfile.app  __pycache__  main_router.py  operations  predict  readme.txt  requirements.txt  user
root@45b755e19a78:/app# cd operations
root@45b755e19a78:/app/operations# ls
__pycache__  operations_router.py
root@45b755e19a78:/app/operations# cd ..
root@45b755e19a78:/app# cd predict
root@45b755e19a78:/app/predict# ls
__pycache__  model.py  predict_router.py  texte_process.py
root@45b755e19a78:/app/predict# cd ..
root@45b755e19a78:/app# cd user
root@45b755e19a78:/app/user# ls
__pycache__  init_admin.py  user_db.py  user_router.py  users.json


# Constuire le docker-compose
(raku_env) root@Stphane:/home/workspace_recup/API_rakuten# docker-compose build
Building api_server
DEPRECATED: The legacy builder is deprecated and will be removed in a future release.
            Install the buildx component to build images with BuildKit:
            https://docs.docker.com/go/buildx/

Sending build context to Docker daemon  173.6kB
Step 1/7 : FROM python:3.9.18
 ---> fc0d8a3ea4c2
Step 2/7 : WORKDIR /app
 ---> Using cache
 ---> f2076d2a797c
Step 3/7 : COPY . .
 ---> f0d9f23c446a
Step 4/7 : RUN apt-get update && apt-get install -y     libgl1-mesa-glx     && rm -rf /var/lib/apt/lists/*
 ---> Running in 37f03f13e6f7
Get:1 http://deb.debian.org/debian bookworm InRelease [151 kB]
Get:2 http://deb.debian.org/debian bookworm-updates InRelease [52.1 kB]
Get:3 http://deb.debian.org/debian-security bookworm-security InRelease [48.0 kB]
Get:4 http://deb.debian.org/debian bookworm/main amd64 Packages [8780 kB]
Get:5 http://deb.debian.org/debian bookworm-updates/main amd64 Packages [6668 B]
Get:6 http://deb.debian.org/debian-security bookworm-security/main amd64 Packages [101 kB]
Fetched 9140 kB in 1s (9878 kB/s)
Reading package lists...
Reading package lists...
Building dependency tree...
Reading state information...
The following additional packages will be installed:
  libdrm-amdgpu1 libdrm-common libdrm-intel1 libdrm-nouveau2 libdrm-radeon1
  libdrm2 libgl1 libgl1-mesa-dri libglapi-mesa libglvnd0 libglx-mesa0 libglx0
  libllvm15 libpciaccess0 libsensors-config libsensors5 libx11-xcb1
  libxcb-dri2-0 libxcb-dri3-0 libxcb-glx0 libxcb-present0 libxcb-randr0
  libxcb-sync1 libxcb-xfixes0 libxfixes3 libxshmfence1 libxxf86vm1 libz3-4
Suggested packages:
  pciutils lm-sensors
The following NEW packages will be installed:
  libdrm-amdgpu1 libdrm-common libdrm-intel1 libdrm-nouveau2 libdrm-radeon1
  libdrm2 libgl1 libgl1-mesa-dri libgl1-mesa-glx libglapi-mesa libglvnd0
  libglx-mesa0 libglx0 libllvm15 libpciaccess0 libsensors-config libsensors5
  libx11-xcb1 libxcb-dri2-0 libxcb-dri3-0 libxcb-glx0 libxcb-present0
  libxcb-randr0 libxcb-sync1 libxcb-xfixes0 libxfixes3 libxshmfence1
  libxxf86vm1 libz3-4
0 upgraded, 29 newly installed, 0 to remove and 2 not upgraded.
Need to get 39.2 MB of archives.
After this operation, 171 MB of additional disk space will be used.
Get:1 http://deb.debian.org/debian bookworm/main amd64 libdrm-common all 2.4.114-1 [7112 B]
Get:2 http://deb.debian.org/debian bookworm/main amd64 libdrm2 amd64 2.4.114-1+b1 [37.5 kB]
Get:3 http://deb.debian.org/debian bookworm/main amd64 libdrm-amdgpu1 amd64 2.4.114-1+b1 [20.9 kB]
Get:4 http://deb.debian.org/debian bookworm/main amd64 libpciaccess0 amd64 0.17-2 [51.4 kB]
Get:5 http://deb.debian.org/debian bookworm/main amd64 libdrm-intel1 amd64 2.4.114-1+b1 [64.0 kB]
Get:6 http://deb.debian.org/debian bookworm/main amd64 libdrm-nouveau2 amd64 2.4.114-1+b1 [19.1 kB]
Get:7 http://deb.debian.org/debian bookworm/main amd64 libdrm-radeon1 amd64 2.4.114-1+b1 [21.8 kB]
Get:8 http://deb.debian.org/debian bookworm/main amd64 libglvnd0 amd64 1.6.0-1 [51.8 kB]
Get:9 http://deb.debian.org/debian bookworm/main amd64 libglapi-mesa amd64 22.3.6-1+deb12u1 [35.7 kB]
Get:10 http://deb.debian.org/debian-security bookworm-security/main amd64 libx11-xcb1 amd64 2:1.8.4-2+deb12u2 [192 kB]
Get:11 http://deb.debian.org/debian bookworm/main amd64 libxcb-dri2-0 amd64 1.15-1 [107 kB]
Get:12 http://deb.debian.org/debian bookworm/main amd64 libxcb-dri3-0 amd64 1.15-1 [107 kB]
Get:13 http://deb.debian.org/debian bookworm/main amd64 libxcb-glx0 amd64 1.15-1 [122 kB]
Get:14 http://deb.debian.org/debian bookworm/main amd64 libxcb-present0 amd64 1.15-1 [105 kB]
Get:15 http://deb.debian.org/debian bookworm/main amd64 libxcb-randr0 amd64 1.15-1 [117 kB]
Get:16 http://deb.debian.org/debian bookworm/main amd64 libxcb-sync1 amd64 1.15-1 [109 kB]
Get:17 http://deb.debian.org/debian bookworm/main amd64 libxcb-xfixes0 amd64 1.15-1 [109 kB]
Get:18 http://deb.debian.org/debian bookworm/main amd64 libxfixes3 amd64 1:6.0.0-2 [22.7 kB]
Get:19 http://deb.debian.org/debian bookworm/main amd64 libxshmfence1 amd64 1.3-1 [8820 B]
Get:20 http://deb.debian.org/debian bookworm/main amd64 libxxf86vm1 amd64 1:1.1.4-1+b2 [20.8 kB]
Get:21 http://deb.debian.org/debian bookworm/main amd64 libz3-4 amd64 4.8.12-3.1 [7216 kB]
Get:22 http://deb.debian.org/debian bookworm/main amd64 libllvm15 amd64 1:15.0.6-4+b1 [23.1 MB]
Get:23 http://deb.debian.org/debian bookworm/main amd64 libsensors-config all 1:3.6.0-7.1 [14.3 kB]
Get:24 http://deb.debian.org/debian bookworm/main amd64 libsensors5 amd64 1:3.6.0-7.1 [34.2 kB]
Get:25 http://deb.debian.org/debian bookworm/main amd64 libgl1-mesa-dri amd64 22.3.6-1+deb12u1 [7239 kB]
Get:26 http://deb.debian.org/debian bookworm/main amd64 libglx-mesa0 amd64 22.3.6-1+deb12u1 [147 kB]
Get:27 http://deb.debian.org/debian bookworm/main amd64 libglx0 amd64 1.6.0-1 [34.4 kB]
Get:28 http://deb.debian.org/debian bookworm/main amd64 libgl1 amd64 1.6.0-1 [88.4 kB]
Get:29 http://deb.debian.org/debian bookworm/main amd64 libgl1-mesa-glx amd64 22.3.6-1+deb12u1 [14.5 kB]
debconf: delaying package configuration, since apt-utils is not installed
Fetched 39.2 MB in 1s (67.4 MB/s)
Selecting previously unselected package libdrm-common.
(Reading database ... 23974 files and directories currently installed.)
Preparing to unpack .../00-libdrm-common_2.4.114-1_all.deb ...
Unpacking libdrm-common (2.4.114-1) ...
Selecting previously unselected package libdrm2:amd64.
Preparing to unpack .../01-libdrm2_2.4.114-1+b1_amd64.deb ...
Unpacking libdrm2:amd64 (2.4.114-1+b1) ...
Selecting previously unselected package libdrm-amdgpu1:amd64.
Preparing to unpack .../02-libdrm-amdgpu1_2.4.114-1+b1_amd64.deb ...
Unpacking libdrm-amdgpu1:amd64 (2.4.114-1+b1) ...
Selecting previously unselected package libpciaccess0:amd64.
Preparing to unpack .../03-libpciaccess0_0.17-2_amd64.deb ...
Unpacking libpciaccess0:amd64 (0.17-2) ...
Selecting previously unselected package libdrm-intel1:amd64.
Preparing to unpack .../04-libdrm-intel1_2.4.114-1+b1_amd64.deb ...
Unpacking libdrm-intel1:amd64 (2.4.114-1+b1) ...
Selecting previously unselected package libdrm-nouveau2:amd64.
Preparing to unpack .../05-libdrm-nouveau2_2.4.114-1+b1_amd64.deb ...
Unpacking libdrm-nouveau2:amd64 (2.4.114-1+b1) ...
Selecting previously unselected package libdrm-radeon1:amd64.
Preparing to unpack .../06-libdrm-radeon1_2.4.114-1+b1_amd64.deb ...
Unpacking libdrm-radeon1:amd64 (2.4.114-1+b1) ...
Selecting previously unselected package libglvnd0:amd64.
Preparing to unpack .../07-libglvnd0_1.6.0-1_amd64.deb ...
Unpacking libglvnd0:amd64 (1.6.0-1) ...
Selecting previously unselected package libglapi-mesa:amd64.
Preparing to unpack .../08-libglapi-mesa_22.3.6-1+deb12u1_amd64.deb ...
Unpacking libglapi-mesa:amd64 (22.3.6-1+deb12u1) ...
Selecting previously unselected package libx11-xcb1:amd64.
Preparing to unpack .../09-libx11-xcb1_2%3a1.8.4-2+deb12u2_amd64.deb ...
Unpacking libx11-xcb1:amd64 (2:1.8.4-2+deb12u2) ...
Selecting previously unselected package libxcb-dri2-0:amd64.
Preparing to unpack .../10-libxcb-dri2-0_1.15-1_amd64.deb ...
Unpacking libxcb-dri2-0:amd64 (1.15-1) ...
Selecting previously unselected package libxcb-dri3-0:amd64.
Preparing to unpack .../11-libxcb-dri3-0_1.15-1_amd64.deb ...
Unpacking libxcb-dri3-0:amd64 (1.15-1) ...
Selecting previously unselected package libxcb-glx0:amd64.
Preparing to unpack .../12-libxcb-glx0_1.15-1_amd64.deb ...
Unpacking libxcb-glx0:amd64 (1.15-1) ...
Selecting previously unselected package libxcb-present0:amd64.
Preparing to unpack .../13-libxcb-present0_1.15-1_amd64.deb ...
Unpacking libxcb-present0:amd64 (1.15-1) ...
Selecting previously unselected package libxcb-randr0:amd64.
Preparing to unpack .../14-libxcb-randr0_1.15-1_amd64.deb ...
Unpacking libxcb-randr0:amd64 (1.15-1) ...
Selecting previously unselected package libxcb-sync1:amd64.
Preparing to unpack .../15-libxcb-sync1_1.15-1_amd64.deb ...
Unpacking libxcb-sync1:amd64 (1.15-1) ...
Selecting previously unselected package libxcb-xfixes0:amd64.
Preparing to unpack .../16-libxcb-xfixes0_1.15-1_amd64.deb ...
Unpacking libxcb-xfixes0:amd64 (1.15-1) ...
Selecting previously unselected package libxfixes3:amd64.
Preparing to unpack .../17-libxfixes3_1%3a6.0.0-2_amd64.deb ...
Unpacking libxfixes3:amd64 (1:6.0.0-2) ...
Selecting previously unselected package libxshmfence1:amd64.
Preparing to unpack .../18-libxshmfence1_1.3-1_amd64.deb ...
Unpacking libxshmfence1:amd64 (1.3-1) ...
Selecting previously unselected package libxxf86vm1:amd64.
Preparing to unpack .../19-libxxf86vm1_1%3a1.1.4-1+b2_amd64.deb ...
Unpacking libxxf86vm1:amd64 (1:1.1.4-1+b2) ...
Selecting previously unselected package libz3-4:amd64.
Preparing to unpack .../20-libz3-4_4.8.12-3.1_amd64.deb ...
Unpacking libz3-4:amd64 (4.8.12-3.1) ...
Selecting previously unselected package libllvm15:amd64.
Preparing to unpack .../21-libllvm15_1%3a15.0.6-4+b1_amd64.deb ...
Unpacking libllvm15:amd64 (1:15.0.6-4+b1) ...
Selecting previously unselected package libsensors-config.
Preparing to unpack .../22-libsensors-config_1%3a3.6.0-7.1_all.deb ...
Unpacking libsensors-config (1:3.6.0-7.1) ...
Selecting previously unselected package libsensors5:amd64.
Preparing to unpack .../23-libsensors5_1%3a3.6.0-7.1_amd64.deb ...
Unpacking libsensors5:amd64 (1:3.6.0-7.1) ...
Selecting previously unselected package libgl1-mesa-dri:amd64.
Preparing to unpack .../24-libgl1-mesa-dri_22.3.6-1+deb12u1_amd64.deb ...
Unpacking libgl1-mesa-dri:amd64 (22.3.6-1+deb12u1) ...
Selecting previously unselected package libglx-mesa0:amd64.
Preparing to unpack .../25-libglx-mesa0_22.3.6-1+deb12u1_amd64.deb ...
Unpacking libglx-mesa0:amd64 (22.3.6-1+deb12u1) ...
Selecting previously unselected package libglx0:amd64.
Preparing to unpack .../26-libglx0_1.6.0-1_amd64.deb ...
Unpacking libglx0:amd64 (1.6.0-1) ...
Selecting previously unselected package libgl1:amd64.
Preparing to unpack .../27-libgl1_1.6.0-1_amd64.deb ...
Unpacking libgl1:amd64 (1.6.0-1) ...
Selecting previously unselected package libgl1-mesa-glx:amd64.
Preparing to unpack .../28-libgl1-mesa-glx_22.3.6-1+deb12u1_amd64.deb ...
Unpacking libgl1-mesa-glx:amd64 (22.3.6-1+deb12u1) ...
Setting up libxcb-dri3-0:amd64 (1.15-1) ...
Setting up libx11-xcb1:amd64 (2:1.8.4-2+deb12u2) ...
Setting up libpciaccess0:amd64 (0.17-2) ...
Setting up libxcb-xfixes0:amd64 (1.15-1) ...
Setting up libglvnd0:amd64 (1.6.0-1) ...
Setting up libxcb-glx0:amd64 (1.15-1) ...
Setting up libsensors-config (1:3.6.0-7.1) ...
Setting up libxxf86vm1:amd64 (1:1.1.4-1+b2) ...
Setting up libxcb-present0:amd64 (1.15-1) ...
Setting up libz3-4:amd64 (4.8.12-3.1) ...
Setting up libxfixes3:amd64 (1:6.0.0-2) ...
Setting up libxcb-sync1:amd64 (1.15-1) ...
Setting up libsensors5:amd64 (1:3.6.0-7.1) ...
Setting up libglapi-mesa:amd64 (22.3.6-1+deb12u1) ...
Setting up libxcb-dri2-0:amd64 (1.15-1) ...
Setting up libxshmfence1:amd64 (1.3-1) ...
Setting up libxcb-randr0:amd64 (1.15-1) ...
Setting up libllvm15:amd64 (1:15.0.6-4+b1) ...
Setting up libdrm-common (2.4.114-1) ...
Setting up libdrm2:amd64 (2.4.114-1+b1) ...
Setting up libdrm-amdgpu1:amd64 (2.4.114-1+b1) ...
Setting up libdrm-nouveau2:amd64 (2.4.114-1+b1) ...
Setting up libdrm-radeon1:amd64 (2.4.114-1+b1) ...
Setting up libdrm-intel1:amd64 (2.4.114-1+b1) ...
Setting up libgl1-mesa-dri:amd64 (22.3.6-1+deb12u1) ...
Setting up libglx-mesa0:amd64 (22.3.6-1+deb12u1) ...
Setting up libglx0:amd64 (1.6.0-1) ...
Setting up libgl1:amd64 (1.6.0-1) ...
Setting up libgl1-mesa-glx:amd64 (22.3.6-1+deb12u1) ...
Processing triggers for libc-bin (2.36-9+deb12u3) ...
Removing intermediate container 37f03f13e6f7
 ---> 78dfee929694
Step 5/7 : RUN pip install --no-cache-dir -r requirements.txt
 ---> Running in 33de26b0b47d
Collecting pandas==2.1.2
  Downloading pandas-2.1.2-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (12.3 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 12.3/12.3 MB 94.8 MB/s eta 0:00:00
Collecting scikit-learn==1.3.2
  Downloading scikit_learn-1.3.2-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (10.9 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 10.9/10.9 MB 105.3 MB/s eta 0:00:00
Collecting tensorflow==2.14.0
  Downloading tensorflow-2.14.0-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (489.8 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 489.8/489.8 MB 105.6 MB/s eta 0:00:00
Collecting nltk==3.8.1
  Downloading nltk-3.8.1-py3-none-any.whl (1.5 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1.5/1.5 MB 110.6 MB/s eta 0:00:00
Collecting fastapi==0.104.1
  Downloading fastapi-0.104.1-py3-none-any.whl (92 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 92.9/92.9 kB 479.0 MB/s eta 0:00:00
Collecting Pillow==10.0.0
  Downloading Pillow-10.0.0-cp39-cp39-manylinux_2_28_x86_64.whl (3.4 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 3.4/3.4 MB 103.2 MB/s eta 0:00:00
Collecting passlib==1.7.4
  Downloading passlib-1.7.4-py2.py3-none-any.whl (525 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 525.6/525.6 kB 168.3 MB/s eta 0:00:00
Collecting opencv-python==4.8.0.76
  Downloading opencv_python-4.8.0.76-cp37-abi3-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (61.7 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 61.7/61.7 MB 106.8 MB/s eta 0:00:00
Collecting keras==2.14.0
  Downloading keras-2.14.0-py3-none-any.whl (1.7 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1.7/1.7 MB 116.8 MB/s eta 0:00:00
Collecting scipy==1.11.2
  Downloading scipy-1.11.2-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (36.5 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 36.5/36.5 MB 105.9 MB/s eta 0:00:00
Collecting pytz==2023.3
  Downloading pytz-2023.3-py2.py3-none-any.whl (502 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 502.3/502.3 kB 169.2 MB/s eta 0:00:00
Collecting numpy==1.24.3
  Downloading numpy-1.24.3-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (17.3 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 17.3/17.3 MB 105.9 MB/s eta 0:00:00
Collecting gast==0.4.0
  Downloading gast-0.4.0-py3-none-any.whl (9.8 kB)
Collecting joblib==1.3.2
  Downloading joblib-1.3.2-py3-none-any.whl (302 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 302.2/302.2 kB 149.2 MB/s eta 0:00:00
Collecting pydantic==1.10.13
  Downloading pydantic-1.10.13-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (3.2 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 3.2/3.2 MB 104.1 MB/s eta 0:00:00
Collecting uvicorn==0.23.2
  Downloading uvicorn-0.23.2-py3-none-any.whl (59 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 59.5/59.5 kB 134.9 MB/s eta 0:00:00
Collecting python-multipart==0.0.6
  Downloading python_multipart-0.0.6-py3-none-any.whl (45 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 45.7/45.7 kB 130.1 MB/s eta 0:00:00
Collecting python-dateutil>=2.8.2
  Downloading python_dateutil-2.8.2-py2.py3-none-any.whl (247 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 247.7/247.7 kB 209.6 MB/s eta 0:00:00
Collecting tzdata>=2022.1
  Downloading tzdata-2023.3-py2.py3-none-any.whl (341 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 341.8/341.8 kB 204.1 MB/s eta 0:00:00
Collecting threadpoolctl>=2.0.0
  Downloading threadpoolctl-3.2.0-py3-none-any.whl (15 kB)
Collecting tensorboard<2.15,>=2.14
  Downloading tensorboard-2.14.1-py3-none-any.whl (5.5 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 5.5/5.5 MB 100.9 MB/s eta 0:00:00
Collecting absl-py>=1.0.0
  Downloading absl_py-2.0.0-py3-none-any.whl (130 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 130.2/130.2 kB 208.9 MB/s eta 0:00:00
Collecting tensorflow-io-gcs-filesystem>=0.23.1
  Downloading tensorflow_io_gcs_filesystem-0.34.0-cp39-cp39-manylinux_2_12_x86_64.manylinux2010_x86_64.whl (2.4 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 2.4/2.4 MB 104.4 MB/s eta 0:00:00
Collecting packaging
  Downloading packaging-23.2-py3-none-any.whl (53 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 53.0/53.0 kB 169.1 MB/s eta 0:00:00
Collecting grpcio<2.0,>=1.24.3
  Downloading grpcio-1.59.3-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (5.3 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 5.3/5.3 MB 107.2 MB/s eta 0:00:00
Requirement already satisfied: setuptools in /usr/local/lib/python3.9/site-packages (from tensorflow==2.14.0->-r requirements.txt (line 3)) (58.1.0)
Collecting wrapt<1.15,>=1.11.0
  Downloading wrapt-1.14.1-cp39-cp39-manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl (77 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 77.8/77.8 kB 142.3 MB/s eta 0:00:00
Collecting google-pasta>=0.1.1
  Downloading google_pasta-0.2.0-py3-none-any.whl (57 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 57.5/57.5 kB 138.2 MB/s eta 0:00:00
Collecting astunparse>=1.6.0
  Downloading astunparse-1.6.3-py2.py3-none-any.whl (12 kB)
Collecting termcolor>=1.1.0
  Downloading termcolor-2.3.0-py3-none-any.whl (6.9 kB)
Collecting ml-dtypes==0.2.0
  Downloading ml_dtypes-0.2.0-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (1.0 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1.0/1.0 MB 120.7 MB/s eta 0:00:00
Collecting h5py>=2.9.0
  Downloading h5py-3.10.0-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (4.8 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 4.8/4.8 MB 102.5 MB/s eta 0:00:00
Collecting six>=1.12.0
  Downloading six-1.16.0-py2.py3-none-any.whl (11 kB)
Collecting opt-einsum>=2.3.2
  Downloading opt_einsum-3.3.0-py3-none-any.whl (65 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 65.5/65.5 kB 267.7 MB/s eta 0:00:00
Collecting tensorflow-estimator<2.15,>=2.14.0
  Downloading tensorflow_estimator-2.14.0-py2.py3-none-any.whl (440 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 440.7/440.7 kB 195.6 MB/s eta 0:00:00
Collecting protobuf!=4.21.0,!=4.21.1,!=4.21.2,!=4.21.3,!=4.21.4,!=4.21.5,<5.0.0dev,>=3.20.3
  Downloading protobuf-4.25.1-cp37-abi3-manylinux2014_x86_64.whl (294 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 294.6/294.6 kB 305.8 MB/s eta 0:00:00
Collecting typing-extensions>=3.6.6
  Downloading typing_extensions-4.8.0-py3-none-any.whl (31 kB)
Collecting flatbuffers>=23.5.26
  Downloading flatbuffers-23.5.26-py2.py3-none-any.whl (26 kB)
Collecting libclang>=13.0.0
  Downloading libclang-16.0.6-py2.py3-none-manylinux2010_x86_64.whl (22.9 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 22.9/22.9 MB 107.6 MB/s eta 0:00:00
Collecting click
  Downloading click-8.1.7-py3-none-any.whl (97 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 97.9/97.9 kB 348.6 MB/s eta 0:00:00
Collecting tqdm
  Downloading tqdm-4.66.1-py3-none-any.whl (78 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 78.3/78.3 kB 244.6 MB/s eta 0:00:00
Collecting regex>=2021.8.3
  Downloading regex-2023.10.3-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (773 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 773.3/773.3 kB 173.1 MB/s eta 0:00:00
Collecting anyio<4.0.0,>=3.7.1
  Downloading anyio-3.7.1-py3-none-any.whl (80 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 80.9/80.9 kB 175.5 MB/s eta 0:00:00
Collecting starlette<0.28.0,>=0.27.0
  Downloading starlette-0.27.0-py3-none-any.whl (66 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 67.0/67.0 kB 142.4 MB/s eta 0:00:00
Collecting h11>=0.8
  Downloading h11-0.14.0-py3-none-any.whl (58 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 58.3/58.3 kB 202.3 MB/s eta 0:00:00
Collecting exceptiongroup
  Downloading exceptiongroup-1.1.3-py3-none-any.whl (14 kB)
Collecting idna>=2.8
  Downloading idna-3.4-py3-none-any.whl (61 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 61.5/61.5 kB 201.4 MB/s eta 0:00:00
Collecting sniffio>=1.1
  Downloading sniffio-1.3.0-py3-none-any.whl (10 kB)
Requirement already satisfied: wheel<1.0,>=0.23.0 in /usr/local/lib/python3.9/site-packages (from astunparse>=1.6.0->tensorflow==2.14.0->-r requirements.txt (line 3)) (0.41.3)
Collecting google-auth-oauthlib<1.1,>=0.5
  Downloading google_auth_oauthlib-1.0.0-py2.py3-none-any.whl (18 kB)
Collecting markdown>=2.6.8
  Downloading Markdown-3.5.1-py3-none-any.whl (102 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 102.2/102.2 kB 205.6 MB/s eta 0:00:00
Collecting requests<3,>=2.21.0
  Downloading requests-2.31.0-py3-none-any.whl (62 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 62.6/62.6 kB 168.6 MB/s eta 0:00:00
Collecting werkzeug>=1.0.1
  Downloading werkzeug-3.0.1-py3-none-any.whl (226 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 226.7/226.7 kB 203.2 MB/s eta 0:00:00
Collecting tensorboard-data-server<0.8.0,>=0.7.0
  Downloading tensorboard_data_server-0.7.2-py3-none-manylinux_2_31_x86_64.whl (6.6 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 6.6/6.6 MB 101.4 MB/s eta 0:00:00
Collecting google-auth<3,>=1.6.3
  Downloading google_auth-2.23.4-py2.py3-none-any.whl (183 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 183.3/183.3 kB 158.0 MB/s eta 0:00:00
Collecting pyasn1-modules>=0.2.1
  Downloading pyasn1_modules-0.3.0-py2.py3-none-any.whl (181 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 181.3/181.3 kB 152.1 MB/s eta 0:00:00
Collecting cachetools<6.0,>=2.0.0
  Downloading cachetools-5.3.2-py3-none-any.whl (9.3 kB)
Collecting rsa<5,>=3.1.4
  Downloading rsa-4.9-py3-none-any.whl (34 kB)
Collecting requests-oauthlib>=0.7.0
  Downloading requests_oauthlib-1.3.1-py2.py3-none-any.whl (23 kB)
Collecting importlib-metadata>=4.4
  Downloading importlib_metadata-6.8.0-py3-none-any.whl (22 kB)
Collecting certifi>=2017.4.17
  Downloading certifi-2023.11.17-py3-none-any.whl (162 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 162.5/162.5 kB 207.9 MB/s eta 0:00:00
Collecting charset-normalizer<4,>=2
  Downloading charset_normalizer-3.3.2-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (142 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 142.3/142.3 kB 223.9 MB/s eta 0:00:00
Collecting urllib3<3,>=1.21.1
  Downloading urllib3-2.1.0-py3-none-any.whl (104 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 104.6/104.6 kB 201.8 MB/s eta 0:00:00
Collecting MarkupSafe>=2.1.1
  Downloading MarkupSafe-2.1.3-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (25 kB)
Collecting zipp>=0.5
  Downloading zipp-3.17.0-py3-none-any.whl (7.4 kB)
Collecting pyasn1<0.6.0,>=0.4.6
  Downloading pyasn1-0.5.0-py2.py3-none-any.whl (83 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 83.9/83.9 kB 130.3 MB/s eta 0:00:00
Collecting oauthlib>=3.0.0
  Downloading oauthlib-3.2.2-py3-none-any.whl (151 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 151.7/151.7 kB 510.8 MB/s eta 0:00:00
Installing collected packages: pytz, passlib, libclang, flatbuffers, zipp, wrapt, urllib3, tzdata, typing-extensions, tqdm, threadpoolctl, termcolor, tensorflow-io-gcs-filesystem, tensorflow-estimator, tensorboard-data-server, sniffio, six, regex, python-multipart, pyasn1, protobuf, Pillow, packaging, oauthlib, numpy, MarkupSafe, keras, joblib, idna, h11, grpcio, gast, exceptiongroup, click, charset-normalizer, certifi, cachetools, absl-py, werkzeug, uvicorn, scipy, rsa, requests, python-dateutil, pydantic, pyasn1-modules, opt-einsum, opencv-python, nltk, ml-dtypes, importlib-metadata, h5py, google-pasta, astunparse, anyio, starlette, scikit-learn, requests-oauthlib, pandas, markdown, google-auth, google-auth-oauthlib, fastapi, tensorboard, tensorflow
Successfully installed MarkupSafe-2.1.3 Pillow-10.0.0 absl-py-2.0.0 anyio-3.7.1 astunparse-1.6.3 cachetools-5.3.2 certifi-2023.11.17 charset-normalizer-3.3.2 click-8.1.7 exceptiongroup-1.1.3 fastapi-0.104.1 flatbuffers-23.5.26 gast-0.4.0 google-auth-2.23.4 google-auth-oauthlib-1.0.0 google-pasta-0.2.0 grpcio-1.59.3 h11-0.14.0 h5py-3.10.0 idna-3.4 importlib-metadata-6.8.0 joblib-1.3.2 keras-2.14.0 libclang-16.0.6 markdown-3.5.1 ml-dtypes-0.2.0 nltk-3.8.1 numpy-1.24.3 oauthlib-3.2.2 opencv-python-4.8.0.76 opt-einsum-3.3.0 packaging-23.2 pandas-2.1.2 passlib-1.7.4 protobuf-4.25.1 pyasn1-0.5.0 pyasn1-modules-0.3.0 pydantic-1.10.13 python-dateutil-2.8.2 python-multipart-0.0.6 pytz-2023.3 regex-2023.10.3 requests-2.31.0 requests-oauthlib-1.3.1 rsa-4.9 scikit-learn-1.3.2 scipy-1.11.2 six-1.16.0 sniffio-1.3.0 starlette-0.27.0 tensorboard-2.14.1 tensorboard-data-server-0.7.2 tensorflow-2.14.0 tensorflow-estimator-2.14.0 tensorflow-io-gcs-filesystem-0.34.0 termcolor-2.3.0 threadpoolctl-3.2.0 tqdm-4.66.1 typing-extensions-4.8.0 tzdata-2023.3 urllib3-2.1.0 uvicorn-0.23.2 werkzeug-3.0.1 wrapt-1.14.1 zipp-3.17.0
WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv

[notice] A new release of pip is available: 23.0.1 -> 23.3.1
[notice] To update, run: pip install --upgrade pip
Removing intermediate container 33de26b0b47d
 ---> daab774e497c
Step 6/7 : EXPOSE 8000
 ---> Running in be99e6fecd9c
Removing intermediate container be99e6fecd9c
 ---> 8a06a01b0cf2
Step 7/7 : CMD ["uvicorn", "main_router:api", "--host", "0.0.0.0", "--port", "8000"]
 ---> Running in 78f8357dc5ae
Removing intermediate container 78f8357dc5ae
 ---> 357ff3fe5f5f
Successfully built 357ff3fe5f5f
Successfully tagged api_rakuten_api_server:latest
Building test_ci
DEPRECATED: The legacy builder is deprecated and will be removed in a future release.
            Install the buildx component to build images with BuildKit:
            https://docs.docker.com/go/buildx/

Sending build context to Docker daemon  196.1kB
Step 1/13 : FROM python:3.9-alpine
 ---> 188c141401fe
Step 2/13 : WORKDIR /tests
 ---> Using cache
 ---> 93dec390f535
Step 3/13 : COPY ./requirements.txt /tests/
 ---> Using cache
 ---> adc30d099373
Step 4/13 : COPY ./test_authen.py /tests/
 ---> Using cache
 ---> 55166a38ea0a
Step 5/13 : COPY ./test_autho.py /tests/
 ---> Using cache
 ---> 4e2861aa8bdc
Step 6/13 : COPY ./test_create_user.py /tests/
 ---> Using cache
 ---> 76b095eaa1e9
Step 7/13 : COPY ./test_delete_user.py /tests/
 ---> Using cache
 ---> 9a033f66a843
Step 8/13 : COPY ./test_predimage.py /tests/
 ---> Using cache
 ---> 0f953f0b031b
Step 9/13 : COPY ./test_predtexte.py /tests/
 ---> Using cache
 ---> 08e31a190198
Step 10/13 : COPY ./run_tests.sh /tests/
 ---> Using cache
 ---> 51c0c74958e7
Step 11/13 : RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt
 ---> Using cache
 ---> 26f39ec89c42
Step 12/13 : RUN chmod +x /tests/run_tests.sh
 ---> Using cache
 ---> 7a6ac7892d39
Step 13/13 : CMD ["/tests/run_tests.sh"] > log.txt
 ---> Using cache
 ---> 514dec0be0cc
Successfully built 514dec0be0cc
Successfully tagged api_rakuten_test_ci:latest

# Lancement du docker compose
(raku_env) root@Stphane:/home/workspace_3/API_rakuten_V4/app# docker-compose up
Creating network "api_rakuten_v4_default" with the default driver
Creating api_rakuten_v4_api_server_1 ... done
Attaching to api_rakuten_v4_api_server_1
api_server_1  | [nltk_data] Downloading package stopwords to /root/nltk_data...
api_server_1  | [nltk_data]   Unzipping corpora/stopwords.zip.
api_server_1  | INFO:     Started server process [1]
api_server_1  | INFO:     Waiting for application startup.
api_server_1  | INFO:     Application startup complete.
api_server_1  | INFO:     Uvicorn running on http://0.0.0.0:8000 (Press CTRL+C to quit)
api_server_1  | INFO:     172.24.0.1:37882 - "GET / HTTP/1.1" 404 Not Found
api_server_1  | INFO:     172.24.0.1:37890 - "GET /docs HTTP/1.1" 200 OK
api_server_1  | email-validator not installed, email fields will be treated as str.
api_server_1  | To install, run: pip install email-validator
api_server_1  | INFO:     172.24.0.1:37890 - "GET /openapi.json HTTP/1.1" 200 OK
api_server_1  | /app/predict/texte_process.py:36: SettingWithCopyWarning: 
api_server_1  | A value is trying to be set on a copy of a slice from a DataFrame
api_server_1  | 
api_server_1  | See the caveats in the documentation: https://pandas.pydata.org/pandas-docs/stable/user_guide/indexing.html#returning-a-view-versus-a-copy
api_server_1  |   df['text'][i] = create_text(df['designation'][i], df['description'][i])
1/1 [==============================] - 0s 98ms/step
api_server_1  | INFO:     172.24.0.1:48064 - "POST /Predictions/predict_text_class?designation=musique&description=jazz HTTP/1.1" 200 OK
1/1 [==============================] - 0s 389ms/step
api_server_1  | INFO:     172.24.0.1:52798 - "POST /Predictions/predict_image_class HTTP/1.1" 200 OK
api_server_1  | INFO:     172.24.0.1:53492 - "GET /Users/user HTTP/1.1" 401 Unauthorized
api_server_1  | INFO:     172.24.0.1:53492 - "GET /Users/user HTTP/1.1" 200 OK
api_server_1  | INFO:     172.24.0.1:42096 - "POST /Users/add_user?username=jeff&password=stark HTTP/1.1" 403 Forbidden

# Arrêter le docker compose 
(raku_env) root@Stphane:/home/workspace_3/API_rakuten_V4# docker-compose down
Removing api_rakuten_v4_test_ci_cd_1 ... done
Removing api_rakuten_v4_api_server_1 ... done
