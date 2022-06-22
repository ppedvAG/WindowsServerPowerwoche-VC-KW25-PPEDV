##Cluster erstellen
New-Cluster –Name Cluster2 –Node m19-1,m19-2 –NoStorage -StaticAddress 192.168.100.105

##Zeuge erstellen
Set-ClusterQuorum -FileShareWitness "\\DC19.sample.LOCAL\zeuge"

##RegKey für S2D erstellen
New-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Services\ClusSvc\Parameters" -Name S2D -Value 1 -PropertyType DWORD -Force

##S2D aktivieren
Enable-ClusterStorageSpacesDirect –CimSession Cluster2

##StoragePool erstellen
New-Volume -StoragePoolFriendlyName "S2D*" -FriendlyName Volume01 -FileSystem CSVFS_ReFS -Size 10GB