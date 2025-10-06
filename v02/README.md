# v02
Automatically generated README for v02

Programmet körs från en prompt i v02 katalogen med kommandot

`dart run bin/v02.dart`

Koden följer inte exakt uppgift nedan pga bättre design och utökade alternativ :) 

---

Uppgift.

Programmet ska visa en meny med följande alternativ och ska enbart dö när vi har tryckt på 4:

mvp:
1. Lägg till hjälte – användaren skriver in namn, styrka (int), och kanske en specialkraft.
2. Visa hjältar – skriv ut alla hjältar i listan. Sortera dem efter styrka (starkast först).
3. Sök – låt användaren skriva in en bokstav eller ett namn och visa matchande hjältar.
4. Avsluta – stäng programmet.

⸻

Krav:
- Använd List<Map för att lagra hjältarna.

```
listexempel = [
{
    "name": "Batman",
    "powerstats": {
        "strength": "12"
    } ,
    "appearance": {
        "gender": "Male",
        "race": "Human"
    }
    *"biography": {
        "alignment": ""  
    }
}
];
```

- Använd sort för att ordna hjältarna efter styrka.
- Använd forEach för att skriva ut listan snyggt.
- Switch/case
Tänk på att skapa återanvändbar kod med funktioner.

Vi vill använda: List<Map<String, dynamic>> heroes = [ ]

⸻

Bonusidéer (för den som vill levela upp):
- Ge varje hjälte ett ID.
- Lägg till en egenskap “alignment” (god/ond). *
- Visa en topplista över de 3 starkaste hjältarna.
- Skapa ett test
- Hur sparar du hjältarna lokalt så att de finns kvar vid varje start?
- Filtrera fram hjältar i ordning beroende på input från menyn
- Har du mer tid, go wild and crazy med design.