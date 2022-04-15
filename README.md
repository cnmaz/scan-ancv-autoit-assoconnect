# Gestion de ANCV par code barre

## Notebook `barcode_reader.ipynb`

Contient le code python qui va lire les codes depuis le lecteur de code barre (port COM) et lance les outils d'automatisation qui vont interagir avec le navigateur.

### Script de saisie des ANCV.
S'utilise sur la saisie d'un paiement sur une transaction.

Il faut être dans la popup de paiement. Cliquer sur "Ajouter un paiement", puis sélectionner le champ date du paiement à saisir (obligatoire). Le datepicker doit être visuellement ouvert pour que ça fonctionne.

Ensuite scanner le chèque.

Par défaut le montant est de 10€. 

Scanner un des codes montants (M10, M20, M50) permet de changer le montant en cours de route. 

Scanner le code STOP pour arrêter le script.

NB : les codes barres des ANCV ne contiennent pas le montant ! Il faut controller à la main chaque chèque : montant, cachet sur la zone commerçant.

### Script de coche des ANCV.
S'utlise sur l'écran de remise de chèque d'assoconnect. Lors du scan d'un ANCV, va faire une recherche pour cocher le chèque.

## Script auto-it

Fichier `*.au3` à compiter avec Auto-It / Scite sous forme d'executables .exe