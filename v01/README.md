# Exekvering

Programmet körs från en prompt i v01 katalogen med kommandot

`dart run bin/v01.dart`

Programmet frågar efter första och andra värdet som kan vara heltal, sedan vilken operation + eller -.

Inmatade argument verifieras så att bara heltal och operationerna + och - är giltiga, om andra argument matas in så frågas igen.

Efter korrekta argument utförs beräkningen och resultatet skrivs ut. 

# Funktions exempel

- Funktioner deklareras med returtyp och void om metoden inte returnerar något.
- Sedan ett namn på metoden och paranteser efter metodnamnet som innesluter en lista av argument separerade av kommatecken om det finns några argument till metoden. 
- För varje argument anges type och namn.
- Metodens logik innesluts i måsvingar, { }.
- Om något returneras från metoden så görs det med nyckelordet return

### Generiskt exempel

```
<returTyp> <metodNamn>(<Arg1Datatyp> <arg1Namn>, <Arg2Datatyp> <arg2Namn>) {
    return <instansAvReturTyp>;
}
```

### Konkret exempel
```
String whatIs(int arg1, int arg2) {
    if (arg1 + arg2 == 42) {
        return "The meaning of life :)";
    } else {
        return "Some other stuff";
    }
}
```
