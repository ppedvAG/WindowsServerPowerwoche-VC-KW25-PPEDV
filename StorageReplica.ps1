## 2 Laufwerke anlegen (z.B. SCSI min. 9GB; ReFS/NTFS) Laufwerksbuchstaben gleich!


##Topologytest
Test-SRTopology -SourceComputerName m19-1 -SourceVolumeName E: -SourceLogVolumeName F: -DestinationComputerName m19-2 -DestinationVolumeName E: -DestinationLogVolumeName F: -DurationInMinutes 0 -ResultPath C:\temp

##neue Partnerschaft anlegen
New-SRPartnership -SourceComputerName m19-1 -SourceRGName rgm19-1 -SourceVolumeName E: -SourceLogVolumeName F: -DestinationComputerName m19-2 -DestinationRGName rgm19-2 -DestinationVolumeName E: -DestinationLogVolumeName F:

##Replikationsstatus prüfen
Get-SrGroup

##Richtung ändern
Set-SRPartnership -NewSourceComputerName m19-2 -SourceRGName rgm19-2 -DestinationComputerName m19-1 -DestinationRGName rgm19-1

##um im Fehlerfall die Partnerschaft aufzuheben...dann werden auf dem noch laufenden Server die Daten angezeigt!
Remove-SRPartnership 