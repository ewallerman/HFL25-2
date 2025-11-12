# v04

Programmet körs från en prompt i v04 katalogen med kommandot

`dart run bin/v04.dart`

.env filen i roten av projektet förväntas innehålla API_KEY för att kunna använda rest-api:et för hjältar.


## Funktionalitet
- När programmet startas kommer lokalt sparade hjältar att läsas in från disk-foldern data, detta görs synkront för att alla ska vara inlästa innan programmet startar.
- Varje hjälte skrivs till en egen fil, vilket gör det enkelt att skriva och ta bort hjältar, detta görs synkront för att säkerställa konsistens.
- Lagring av nya hjältar görs direkt så att allt data finns persistent om programmet skulle avslutas plötsligt.
- Alla hjältar finns cachade i minne för snabb åtkomst och sökning.
- Sökning lokalt hanterar bara dom hjältar som finns i applikationen.
- Sökning för att hämta fler hjältar sker via nätet, endast hjältar som inte redan finns lokalt läggs till i applikationen.
- Hjältar anses vara unika via id.
- I övrigt så finns funktionalitet för att skapa, ta bort, visa, lista hjältar på olika vis(alla, top, good, bad).

## Implementations detaljer
- Klasser finns för hantera hjältar lokalt sparade på disk, i ramminne och via nätet.
- Klasserna har interface för att få en abstraktion och konkreta implementationer instansieras och injiseras via "constructor injection" där programmet konfigureras och vävs ihop.
- Vid uppstart kommer högsta id på existerande hjältar att användas som start för id för skapande av nya hjältar men som lägst 1000, om inga hjältar finns så kommer id börja på 1000 för att undvika konflikt med dom hjältar som kan laddas via nätet (detta är en design som funkar så länge som det inte kommer till massa hjältar på nätet, i så fall går det att välja en annan strategi med tex negativa id för lokalt skapade hjältar men det ser inte så snyggt ut :) .
