## Zadania do realizacji

## 1. Pogrupuj studentów na “zdanych i oblanych”

### Założenia

* Jako pierwszy argument przyjmujemy hash, gdzie kluczami są imiona studentów, a wartościami otrzymana przez nich ilość punktów.
* Drugim argumentem jest próg zdawalności.
* Następnie grupujemy ich na tych, którzy zdali VS oblali i zwracamy odpowiedniego hash-a.
* Należy zabezpieczyć się na możliwość, że próg lub ilość punktów będzie podana jako string, nie integer.

Przykładowe wywołanie:

```
hash = {"Mark" => 10, "Ellen" => 65, "Roger" => 20, "Mike" => 70}

PassedOrFailed.new(hash, "65").result
=> { passed: { "Ellen" => 65, "Mike" => 70 }, failed: { "Mark" => 10, "Roger" => 20 } }
```

## 2. Napisz mechanizm Szyfrowania Cezara

### Założenia

* Czym z założenia jest Szyfr Cezara możesz dowiedzieć się z internetu :)
* Dla podanego stringa zwracamy jego zaszyfrowaną wersję.
* Szyfrowanie polega na podstawianiu litery alfabetu - znakiem oddalonym od niego o pewną ilość pozycji.
* Operiamy się o alfabet łaciński - nie bawimy się w polskie znaki ;)
* Rozróżniamy wielkość liter, jako argument możemy dostać tylko string i stosujemy wówczas klasyczne przesunięcie o 13 pozycji - ROT13 (dla c zwrócimy p).
* Jako argument, poza stringiem może zostać podane również przesunięcie (integer), które będzie narzucało przesunięcie szyfru (przy 3 dla c zwrócimy f).
* Zapętlamy się, tzn. przy parametrze przesunięcia 5, dla Z zwrócimy E, dla x - c.
* Spacje oraz inne znaki specjalne zostawiamy w spokoju.

Przykładowe wywołania

```
CaesarCipher.new("Testowy Tekst").perform
=> "Grfgbjl Grxfg"
CaesarCipher.new("Ala ma...psa!", 4).perform
=> "Epe qe...twe!"
```

## Setup

```
gem install bundler
bundle
```

## Uruchomienie testów

```
bundle exec rspec
```

Zadanie jest wykonane poprawnie, jeśli testy przejdą bez błędów, jak poniżej:

```
CaesarCipher
  args: 'Testowy Tekst'
    should eq "Grfgbjl Grxfg"
  args: 'Ala ma...psa!', 4
    should eq "Epe qe...twe!"
  args: 'Ala ma...psa!', -4
    should eq "Whw iw...low!"
  args: 'Ala ma...psa!', 26
    should eq "Ala ma...psa!"
  args: 'Ala ma...psa!', -26
    should eq "Ala ma...psa!"

PassedOrFailed
  first dataset
    should eq {:passed=>{"Ellen"=>65, "Mike"=>70}, :failed=>{"Mark"=>10,
"Roger"=>20}}
  second dataset
    should eq {:passed=>{"Ellen"=>65, "Roger"=>20, "Mike"=>70},
:failed=>{"Mark"=>10}}
  third dataset
    should eq {:passed=>{}, :failed=>{"Mark"=>10, "Ellen"=>65,
"Roger"=>20, "Mike"=>70}}
  fourth dataset
    should eq {:passed=>{"Mark"=>10, "Ellen"=>65, "Roger"=>20,
"Mike"=>70}, :failed=>{}}

Finished in 0.00732 seconds (files took 0.30578 seconds to load)
9 examples, 0 failures
```
