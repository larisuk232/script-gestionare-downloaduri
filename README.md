# Proiect Practică: Script automat pentru gestionarea fișierelor descărcate 

##  Descriere generală

Acest proiect a fost realizat ca parte a stagiului de practică și are scopul de a automatiza organizarea fișierelor descărcate într-un sistem Linux. Am dezvoltat un script Bash cu interfață grafică folosind `Zenity`, care sortează automat fișierele media și documentele în directoare bine structurate, în funcție de categoria acestora.

Scriptul recunoaște și procesează:
-  Filme
-  Seriale
-  Muzică
-  Documente
-  Executabile

În plus, scriptul este capabil să identifice fișierele aflate direct în folderul principal `Downloads/` și să le mute în directoarele corespunzătoare pe baza extensiei.

---

##  Ce am implementat

-  Interfață grafică interactivă cu `zenity` pentru alegerea tipului de fișiere
-  Parsare automată pentru filme (cu sau fără an în nume)
-  Integrare cu API-ul OMDb pentru obținerea automată a anului de apariție al filmelor
-  Structurare automată a serialelor pe sezoane și episoade (ex: `Serial_S01E02`)
-  Organizarea melodiilor pe baza artistului și titlului (`Artist_Melodie`)
-  Detectarea și sortarea fișierelor document (`pdf`, `doc`, etc.)
-  Detectarea și sortarea executabilelor (`.sh`, `.exe`, `.deb`, etc.)
-  Recunoaștere fișiere din `Downloads/` și mutarea lor automată în subfoldere pentru procesare ulterioară
-  Plan de testare complet pentru validarea funcționalităților

---

##  Ce am învățat

 Utilizarea comenzilor avansate Bash (variabile, `for`, `if`, `case`)  
 Manipularea fișierelor și directoarelor în Linux  
 Lucrul cu API-uri externe (OMDb API + `curl` + `jq`)  
 Utilizarea expresiilor regulate în Bash  
 Crearea de interfețe grafice simple cu `zenity`  
 Documentarea corectă a unui proiect și încărcarea pe GitHub

---

##  Structura aplicației

Downloads/
├── Movies/
├── Series/
├── Music/
├── Documents/
├── Executables/
└── [alte fișiere neordonate]

Media/
├── Movies/An/NumeFilm/
├── Series/Nume/Season X/Episode Y/
├── Music/Artist/Melodie/

Documents/
Executables/


---

##  Plan de testare

Am inclus un fișier dedicat [`plan_testare.txt`](./plan_testare.txt), care conține scenarii de test pentru fiecare categorie de fișiere și fiecare caz logic din aplicație (inclusiv erori).

---

##  Tehnologii folosite

- Bash scripting
- Zenity (UI grafică simplă)
- jq (parsare JSON)
- curl (interogare API-uri web)
- Git (versiune și management cod)
- GitHub (hosting cod sursă)

---

##  Autor

**Larisa Opinca**  
Studentă în anul 2, Academia Tehnică Militară "Ferdinand I"  
Proiect de practică – Gestiunea fișierelor descărcate


