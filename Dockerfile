# Etap 1: Budowanie obrazu na bazie Ubuntu
FROM python:3.9 AS builder

# Ustawienie katalogu roboczego
WORKDIR /app

# Skopiowanie plików serwera do kontenera
COPY serverScript.py .

# Instalacja zależności
RUN pip3 install tzlocal

# Etap 2: Budowanie ostatecznego obrazu na bazie Ubuntu
FROM ubuntu:latest

# Ustawienie katalogu roboczego
WORKDIR /app

# Skopiowanie plików z poprzedniego etapu
COPY --from=builder /app/serverScript.py .

# Ustawienie zmiennej środowiskowej z danymi autora
ENV AUTHOR_NAME="Daniel Zawadka"

# Dodanie etykiet z informacjami o autorze
LABEL maintainer=$AUTHOR_NAME

# Dodanie metadanych do obrazu
LABEL description="Chmury zadanie1"

# Instalacja zależności
RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip3 install tzlocal

# Zdefiniowanie punktu wejściowego dla kontenera
CMD ["python3", "serverScript.py"]