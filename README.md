# Programowanie fullstack w chmurze obliczeniowej Zadanie 1 - Daniel Zawadka
### Zadanie 1:
Funkcja pobierająca czas lokalny użytkownika nie do końca działa użyta w kontenerze. Kiedy wywołuje się będąc częścią kontenera pobiera lokalną strefę czasową ustawiooną dla kontenera - UTC 

### Zadanie 3:
a. docker build -t zadanie1 .

b. docker run -p 8000:8000 --name chmura_zad1 zadanie1 - kontener zostanie uruchomiony na porcie 8000 żeby móc później sprawdzić na localhoscie czy wyświetlanie informacji działa, dodatkowo jest ustawiona nazwa kontenera na: chmura_zad1

c. docker logs chmura_zad1

d. docker history --no-trunc zadanie1


## Update 16.06.2023
### Zadanie 2:

Stworzono github action, do której kod znajduje się w: .github/workflows/docker-build.yaml

Dowód na działanie skryptu:
- Akcja zakończona sukcesem
![image](https://github.com/zawadek/ChmuraZadanie1/assets/47819173/b0cacc87-3b7f-4ce5-8a62-aebf7cb8986c)

- Zbudowane repozytorium na Docker Hubie
- ![image](https://github.com/zawadek/ChmuraZadanie1/assets/47819173/e8e8600a-2a48-47a6-8183-dbda9794a657)

