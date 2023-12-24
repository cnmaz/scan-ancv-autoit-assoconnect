#include <MsgBoxConstants.au3>

; Selection de cheque

;~ Func check_cheque($numero)
;~ 	WinActivate("AssoConnect")
;~ 	WinWaitActive("AssoConnect")
;~ 	Send("{CTRLDOWN}{HOME}{CTRLUP}{ESC}")
;~ 	Sleep(300)
;~ 	Send("{F10}{SPACE}R")
;~ 	Sleep(100)
;~ 	Send($numero)
;~ 	Send("{ENTER}")
;~ 	Sleep(300)
;~ 	Send("{ESC}")
;~ 	Send("{SHIFTDOWN}{TAB}{SHIFTUP}")
;~ 	Sleep(300)
;~ 	Send("{SPACE}{^HOME}")
;~ 	Send("{F10}{SPACE}R")
;~ 	Send("Rapprochement")
;~ 	Send("{ESC}")
;~ EndFunc


;~ Ancienne méthode pour les anciens écrans
;~ Func check_cheque($numero)
;~ 	WinActivate("Remise de chèques")
;~ 	WinWaitActive("Remise de chèques")
;~ 	Send("{^HOME}")
;~ 	Send("{F10}{SPACE}R")
;~ 	Send("Rapprochement")
;~ 	Send("{ESC}")
;~ 	Send("{CTRLDOWN}{HOME}{CTRLUP}{ESC}")
;~ 	Sleep(300)
;~ 	Send("{F10}{SPACE}R")
;~ 	Sleep(100)
;~ 	Send($numero)
;~ 	Send("{ENTER}")
;~ 	Sleep(300)
;~ 	Send("{ESC}")
;~ 	Send("{SHIFTDOWN}{TAB}{SHIFTUP}")
;~ 	Sleep(300)
;~ 	Send("{SPACE}")
;~ EndFunc

Func check_cheque($numero)
	WinActivate("Remise de chèques")
	WinWaitActive("Remise de chèques")
	;~ Se positionner sur numéro de chèque
	Send("{F10}{SPACE}RR")
	Send("Numéro de chèq")
	Send("{ESC}")
;~ 	Send("{CTRLDOWN}{HOME}{CTRLUP}{ESC}")
	Sleep(300)
;~ 	Send("{F10}{SPACE}R")
	Send("{TAB}")
	Sleep(100)
	Send($numero)
	Sleep(2000)
	Send("{TAB 3}")
	Sleep(300)
;~ 	Send("{ESC}")
;~ 	Send("{SHIFTDOWN}{TAB}{SHIFTUP}")
;~ 	Sleep(300)
	WinWaitActive("Remise de chèques")
	Send("{SPACE}")
EndFunc


If ($CmdLine[0] == 0) Then
	MsgBox($MB_SYSTEMMODAL, "Saisie-cheque", "Usage : binary cheque-number")
Else
	check_cheque($CmdLine[1])
EndIf

;~ check_cheque("6041202")
;~ check_cheque("7488232")
;~ check_cheque("3216506")
;~ check_cheque("3102149")
;~ check_cheque("7012779")
;~ check_cheque("2290717")