PLAN DE TESTARE – Script Gestiune Download-uri

Scop:
Testarea funcționalităților scriptului de organizare a fișierelor descărcate în categorii:
Filme, Seriale, Muzică, Documente, Executabile și fișiere aflate direct în Downloads.

1. Testare FILME
--------------------------------------------------
ID Test: T1
Categorie: Filme
Condiție inițială: Fișier existent în Downloads/Movies: `Titanic_1997.mp4`
Acțiune: Rularea scriptului pe opțiunea "Filme"
Rezultat așteptat: Fișierul mutat în Media/Movies/1997/Titanic/Titanic_1997.mp4

ID Test: T2
Categorie: Filme
Condiție inițială: Fișier existent în Downloads/Movies: `Inception.mp4` (fără an)
Acțiune: Rularea scriptului (folosește OMDb API)
Rezultat așteptat: Fișierul mutat în Media/Movies/2010/Inception/Inception.mp4 (an detectat automat)

2. Testare SERIALE
--------------------------------------------------
ID Test: T3
Categorie: Seriale
Condiție inițială: Fișier `BreakingBad_S01E02.mkv` în Downloads/Series
Acțiune: Rularea scriptului pe opțiunea "Seriale"
Rezultat așteptat: Fișierul mutat în Media/Series/BreakingBad/Season 01/Episode 02/BreakingBad_S01E02.mkv

ID Test: T4
Categorie: Seriale
Condiție inițială: Fișier `InvalidSerial.mkv` fără formatul SxxExx
Acțiune: Rularea scriptului
Rezultat așteptat: Afișare mesaj "Format invalid serial"

3. Testare MUZICĂ
--------------------------------------------------
ID Test: T5
Categorie: Muzică
Condiție inițială: Fișier `Eminem_LoseYourself.mp3` în Downloads/Music
Acțiune: Rularea scriptului pe opțiunea "Muzică"
Rezultat așteptat: Fișierul mutat în Media/Music/Eminem/LoseYourself/Eminem_LoseYourself.mp3

ID Test: T6
Categorie: Muzică
Condiție inițială: Fișier `track01.mp3` (fără separator _ )
Acțiune: Rularea scriptului
Rezultat așteptat: Afișare mesaj "Format invalid melodie"

4. Testare DOCUMENTE
--------------------------------------------------
ID Test: T7
Categorie: Documente
Condiție inițială: Fișier `referat.docx` în Downloads/Documents
Acțiune: Rularea scriptului pe opțiunea "Documente"
Rezultat așteptat: Fișierul mutat în Documents/referat.docx

ID Test: T8
Categorie: Documente
Condiție inițială: Fișier `manual.exe` în Downloads/Documents
Acțiune: Rularea scriptului
Rezultat așteptat: Afișare mesaj "nu e document valid"

5. Testare EXECUTABILE
--------------------------------------------------
ID Test: T9
Categorie: Executabile
Condiție inițială: Fișier `setup.sh` în Downloads/Executables
Acțiune: Rularea scriptului
Rezultat așteptat: Fișierul mutat în Executables/setup.sh

ID Test: T10
Categorie: Executabile
Condiție inițială: Fișier `not_a_script.txt` în Downloads/Executables
Acțiune: Rularea scriptului
Rezultat așteptat: Afișare mesaj "nu e executabil valid"

6. Testare fișiere DIRECT în Downloads/
--------------------------------------------------
ID Test: T11
Categorie: Fișiere fără subfolder
Condiție inițială: `lucrare.pdf` în Downloads/
Acțiune: Rularea scriptului cu opțiunea "Toate"
Rezultat așteptat: Fișierul mutat în Documents/lucrare.pdf

ID Test: T12
Categorie: Fișiere fără subfolder
Condiție inițială: `film_mare.mkv` în Downloads/
Acțiune: Rularea scriptului
Rezultat așteptat: Fișierul mutat în Downloads/Movies/film_mare.mkv → urmat de procesarea lui ca film

ID Test: T13
Categorie: Fișiere necunoscute
Condiție inițială: `randomfile.xyz` în Downloads/
Acțiune: Rularea scriptului
Rezultat așteptat: Mesaj: "⚠️ Fișier necunoscut: 'randomfile.xyz' - nu s-a mutat nicăieri"

--------------------------------------------------
Toate testele se pot rula manual sau prin script automat. Rezultatele pot fi salvate în loguri sau observate în sistemul de fișiere.

