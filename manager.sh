#!/bin/bash

# OMDb API Key
API_KEY="PUNE_AICI_CHEIA_TA_OMDB"

# Căi
DOWNLOADS_MOVIES="./Downloads/Movies"
DOWNLOADS_SERIES="./Downloads/Series"
DOWNLOADS_MUSIC="./Downloads/Music"
DOWNLOADS_DOCS="./Downloads/Documents"
DOWNLOADS_EXE="./Downloads/Executables"

MEDIA_MOVIES="./Media/Movies"
MEDIA_SERIES="./Media/Series"
MEDIA_MUSIC="./Media/Music"
DOCUMENTS_DIR="./Documents"
EXECUTABLES_DIR="./Executables"

# =============== ZENITY MENIU ===============
opt=$(zenity --list --title="Gestiune Descărcări" \
  --text="Ce tip de fișiere vrei să procesezi?" \
  --radiolist --column "Selectat" --column "Categorie" \
  TRUE "Toate" \
  FALSE "Filme" \
  FALSE "Seriale" \
  FALSE "Muzică" \
  FALSE "Documente" \
  FALSE "Executabile")

if [[ $? -ne 0 ]]; then
  zenity --warning --text="Operația a fost anulată."
  exit 1
fi

# =============== FILME ===============
if [[ "$opt" == "Toate" || "$opt" == "Filme" ]]; then
  echo "🎬 Filme: $DOWNLOADS_MOVIES"
  for file in "$DOWNLOADS_MOVIES"/*; do
    if [[ -f "$file" ]]; then
      filename=$(basename -- "$file")
      extension="${filename##*.}"
      name_without_ext="${filename%.*}"

      if [[ "$name_without_ext" =~ _[0-9]{4}$ ]]; then
        movie_name=$(echo "$name_without_ext" | cut -d'_' -f1)
        movie_year=$(echo "$name_without_ext" | cut -d'_' -f2)
      else
        movie_name="$name_without_ext"
        query=$(echo "$movie_name" | sed 's/ /+/g')
        response=$(curl -s "http://www.omdbapi.com/?t=$query&apikey=$API_KEY")
        movie_year=$(echo "$response" | jq -r '.Year')
        if [[ "$movie_year" == "null" || -z "$movie_year" ]]; then
          movie_year="Unknown"
        fi
      fi

      target_dir="$MEDIA_MOVIES/$movie_year/$movie_name"
      echo "📦 Mut '$filename' → '$target_dir'"
      mkdir -p "$target_dir"
      mv "$file" "$target_dir/$filename"
    fi
  done
fi

# =============== SERIALE ===============
if [[ "$opt" == "Toate" || "$opt" == "Seriale" ]]; then
  echo "📺 Seriale: $DOWNLOADS_SERIES"
  for file in "$DOWNLOADS_SERIES"/*; do
    if [[ -f "$file" ]]; then
      filename=$(basename -- "$file")
      extension="${filename##*.}"
      name_without_ext="${filename%.*}"

      if [[ "$name_without_ext" =~ ^(.+)_S([0-9]{2})E([0-9]{2})$ ]]; then
        serial_name="${BASH_REMATCH[1]}"
        season="Season ${BASH_REMATCH[2]}"
        episode="Episode ${BASH_REMATCH[3]}"

        target_dir="$MEDIA_SERIES/$serial_name/$season/$episode"
        echo "📦 Mut '$filename' → '$target_dir'"
        mkdir -p "$target_dir"
        mv "$file" "$target_dir/$filename"
      else
        echo "⚠️ Format invalid serial: '$filename'"
      fi
    fi
  done
fi

# =============== MUZICĂ ===============
if [[ "$opt" == "Toate" || "$opt" == "Muzică" ]]; then
  echo "🎵 Muzică: $DOWNLOADS_MUSIC"
  for file in "$DOWNLOADS_MUSIC"/*; do
    if [[ -f "$file" ]]; then
      filename=$(basename -- "$file")
      extension="${filename##*.}"
      name_without_ext="${filename%.*}"

      if [[ "$name_without_ext" =~ ^(.+)_([^_]+)$ ]]; then
        artist="${BASH_REMATCH[1]}"
        song="${BASH_REMATCH[2]}"

        target_dir="$MEDIA_MUSIC/$artist/$song"
        echo "📦 Mut '$filename' → '$target_dir'"
        mkdir -p "$target_dir"
        mv "$file" "$target_dir/$filename"
      else
        echo "⚠️ Format invalid melodie: '$filename'"
      fi
    fi
  done
fi

# =============== DOCUMENTE ===============
if [[ "$opt" == "Toate" || "$opt" == "Documente" ]]; then
  echo "📄 Documente: $DOWNLOADS_DOCS"
  for file in "$DOWNLOADS_DOCS"/*; do
    if [[ -f "$file" ]]; then
      filename=$(basename -- "$file")
      extension="${filename##*.}"

      case "$extension" in
        pdf|doc|docx|txt|odt)
          mkdir -p "$DOCUMENTS_DIR"
          mv "$file" "$DOCUMENTS_DIR/$filename"
          echo "📄 Mut '$filename' → '$DOCUMENTS_DIR'"
          ;;
        *)
          echo "⚠️ '$filename' nu e document valid"
          ;;
      esac
    fi
  done
fi

# =============== EXECUTABILE ===============
if [[ "$opt" == "Toate" || "$opt" == "Executabile" ]]; then
  echo "⚙️ Executabile: $DOWNLOADS_EXE"
  for file in "$DOWNLOADS_EXE"/*; do
    if [[ -f "$file" ]]; then
      filename=$(basename -- "$file")
      extension="${filename##*.}"

      case "$extension" in
        exe|msi|sh|deb|AppImage)
          mkdir -p "$EXECUTABLES_DIR"
          mv "$file" "$EXECUTABLES_DIR/$filename"
          echo "⚙️ Mut '$filename' → '$EXECUTABLES_DIR'"
          ;;
        *)
          echo "⚠️ '$filename' nu e executabil valid"
          ;;
      esac
    fi
  done
fi

zenity --info --text="✅ Mutarea fișierelor a fost finalizată!"

