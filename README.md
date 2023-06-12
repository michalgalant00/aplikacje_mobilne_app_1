# aplikacja_1

Aplikacja nr 1 na programowanie aplikacji mobilnych.

## Polecenie
### Napisz aplikację bazującą na widgecie Form. Formularz powinien posiadać:
- pola tekstowe:
  - Imię,
  - Nazwisko,
  - Poziom
- suwak (Slider)
  - poziom (w skali 0 – 100, co 4),
  - włączony po wciśnięciu przycisku,
- przycisk
  - zapisz,
  - włączony po wprowadzeniu danych

#### Program ma spełniać następujące warunki:
- umożliwienie wprowadzenia danych (imię, nazwisko, poziom),
- w polach tekstowych należy umieścić odpowiednie podpowiedzi,
- musi występować podstawowa walidacja – dane nie mogą być puste, poziom musi być
  wartością z przedziału <0,100> podzielną przez 4,
- w momencie opuszczenia pola tekstowego z błędną wartością ma być wyświetlony
  komunikat – np. przy użyciu SnackBar,
- przycisk aktywuje się po wprowadzeniu wszystkich danych (poprawnie),
- suwak aktywuje się po wciśnięciu przycisku zapisz

#### Zawartość
- obrazek
- formularz (imie, nazwisko, poziom) i slider (zablokowany)
- ZAPISZ przechodzi do ekranu 2 na ktorym wyswietla dane przekazane z formularza
- POWROT wraca do ekranu 1 z odblokowanym sliderem, ktorego zmiana polozenia aktualizuje wartosc w polu poziom i poziom wyswietlony w lewym gornym rogu obrazka
- przycisk ZAPISZ odblokowuje sie dopiero po poprawnej walidacji wprowadzonych danych
- slider odblokowuje sie dopiero po powrocie z ekranu 2