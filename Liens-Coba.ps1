#Script pour la création des liens Coba

#Fonction pour créer des raccourcis
Function raccourci {
 param ([string]$lien,[string]$chemin)

   $objShell = New-Object -ComObject WScript.Shell
   $lnk = $objShell.CreateShortcut("$lien")
   $lnk.TargetPath = "$chemin"
   $lnk.Save() 
   }

#Tableau associatif 
$raccourci_Coba = @{
#Coba Test
"$HOME\Desktop\Coba-Test.lnk" = "F:\Coba-test\fin\logiciel\COBMNU32.EXE";
#Coba Fondation
"$HOME\Desktop\COBA Fondation.lnk" = "F:\Coba\fon\logiciel\COBMNU32.EXE";
#Coba Corpo
"$HOME\Desktop\COBA Corpo.lnk" = "F:\Coba\cor\logiciel\COBMNU32.EXE";
# Coba college
"$HOME\Desktop\COBA Collège.lnk" = "F:\Coba\fin\logiciel\COBMNU32.EXE";

}


# Recherche des partages et leur associer des racourcis
foreach($raccour in $raccourci_Coba.Keys){
$chemin = $raccourci_Coba[$raccour]
    if (([System.IO.File]::Exists($chemin)) -and (!(Test-Path  '$raccourci'))){
                      
     raccourci $raccour $chemin
                
     }
} 
