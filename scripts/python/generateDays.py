#!/usr/bin/python

import os
import sys
from datetime import datetime, timedelta

def generate_markdown_files(target_date_str, output_folder="/home/seymen/repos/github.com/Soeky/notes/Periodic Notes/0_Daily"):
    # Ziel-Datum parsen
    target_date = datetime.strptime(target_date_str, "%Y-%m-%d")
    
    # Startdatum ist morgen
    start_date = datetime.today() + timedelta(days=1)
    
    # Ordner erstellen, falls nicht vorhanden
    os.makedirs(output_folder, exist_ok=True)
    
    # Durch die Tage iterieren und .md-Dateien erstellen
    current_date = start_date
    while current_date <= target_date:
        # Datei-Namen setzen
        file_name = f"{current_date.strftime('%Y-%m-%d')}.md"
        file_path = os.path.join(output_folder, file_name)
        
        # Falls Datei existiert, überspringen
        if os.path.exists(file_path):
            print(f"Übersprungen: {file_path} existiert bereits.")
        else:
            # Datumswerte für die Vorlage
            yesterday = (current_date - timedelta(days=1)).strftime('%Y-%m-%d')
            tomorrow = (current_date + timedelta(days=1)).strftime('%Y-%m-%d')
            
            # Markdown-Inhalt
            content = f"""
## [[{yesterday}]] - [[{tomorrow}]]

## Daily Deeds & Rituals

- [ ] um 6 aufstehen
- [ ] 3l Wasser
- [ ] Nächsten Tag Planen
- [ ]

## TODOS


## Log
""".strip()
            
            # Datei schreiben
            with open(file_path, "w", encoding="utf-8") as file:
                file.write(content)
            
            print(f"Datei erstellt: {file_path}")
        
        # Nächsten Tag setzen
        current_date += timedelta(days=1)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Verwendung: python script.py YYYY-MM-DD")
        sys.exit(1)
    
    target_date_str = sys.argv[1]
    generate_markdown_files(target_date_str)
