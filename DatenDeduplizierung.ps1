##Erst Dateiserverrolle/Datendeduplizierung installieren
##Volume muss NTFS sein
##Vor Aktivierung prüfen

##Verzeichniss prüfen
C:\windows\system32\ddpeval.exe h:\S4B

##manueller Start (oder im AdminCenter auf Speicherdienste und auf Volumes die Settings vornehmen)
Start-DedupJob -Type Optimization -Volume g: