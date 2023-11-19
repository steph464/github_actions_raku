FROM python:3.9.18

# Définissez le répertoire de travail dans le conteneur
WORKDIR /app

# Copie des fichiers de l'application dans le conteneur
COPY . .

# Ajout des instructions pour installer les dépendances système   le 13/11/2023 api_rakuten1 docker images
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    # Autres dépendances système 
    && rm -rf /var/lib/apt/lists/*

# Installation requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Exposez le port sur lequel l'application s'exécute 
EXPOSE 8000

# commande pour exécuter l'application
CMD ["uvicorn", "main_router:api", "--host", "0.0.0.0", "--port", "8000"]