# Klasa `aghdpl`

Repozytorium zawiera opracowanie szablonu `aghdpl`, którego autorami są [prof. dr hab. Marcin Szpyrka](mailto:mszpyrka@agh.edu.pl), prof. dr hab. inż. Grzegorz J. Nalepa i dr inż. Paweł Kłeczek. Oryginalny szablon dostępny jest na [stronie prof. Szpyrki](http://home.agh.edu.pl/~mszpyrka/doku.php?id=lectures:latex:aghdpl).

Opracowanie to powstało za namową mojego promotora, [dr inż. Sebastiana Ernsta](mailto:ernst@agh.edu.pl), któremu dziękuję za polecenie filtra `pandoc-crossref` oraz pomoc ze stworzeniem `Makefile`.

Niniejsze opracowanie ma na celu umożliwienie napisania pracy dyplomowej w [Markdown](https://daringfireball.net/projects/markdown/) i wyeksportowanie jej do formatu PDF za pośrednictwem [`pandoc`](https://pandoc.org) oraz [`latexmk`](https://mg.readthedocs.io/latexmk.html).

Napisana praca jest najpierw generowana w formacie `latex`, ponieważ `pandoc` nie obsługuje użytego w szablonie `biblatex`. Następnie tworzony jest dokument PDF, domyślnie `out/praca-dyplomowa-latest.pdf`.

# Wymagania

- `make`
- `latexmk`
- `pandoc` (tested with version 3.6.4)
- `pandoc-crossref`

## Ubuntu (`amd64`)

```bash
apt install make texlive-full pandoc

# find version compatible with your pandoc to avoid warnings!
wget https://github.com/lierdakil/pandoc-crossref/releases/download/latest/pandoc-crossref-Linux.tar.xz
tar -xf pandoc-crossref-Linux.tar.xz
mv pandoc-crossref /usr/local/bin
```

## macOS

```zsh
brew install make mactex pandoc pandoc-crossref
```

# Sposób użycia

W katalogu `src/` znajdują się pliki źródłowe dokumentu. Są one załączane do pliku wynikowego w kolejności alfabetycznej, stąd sugestia, by stosować nazwy `XX-description.md`, gdzie `XX` to wartość liczbowa, zaczynając od `00`.

Plik `00-headers.md` zawiera niezbędne nagłówki w formacie YAML (tzw. YAML front matter), gdzie można dostosować informacje o pracy: tytuł, dane autora, promotora, bibliografię. Dobrą praktyką jest nie wpisywać treści pracy w tym pliku, jednak nie jest to błędem.

Plik `Makefile` zawiera w sobie polecenia tworzące końcowy plik PDF. Jako źródło brane są wszystkie pliki z rozszerzeniem `.md` znajdujące się w katalogu `src/`.

## Dostosowanie ustawień

Można zmienić domyślne zachowanie polecenia `make` ustawiając zmienne środowiskowe:

- `OUTPUT_FILE_SUFFIX` - domyślnie `latest`, suffix dołączany do bazowej nazwy `praca-dyplomowa-{suffix}.pdf`
- `OUTPUT_PATH` - domyślnie `out`, ścieżka, gdzie zostanie zapisany plik PDF

## Komenda do wykonania

```bash
OUTPUT_FILE_SUFFIX=latest OUTPUT_PATH=out make pdf
```
