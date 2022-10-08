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
Func check_cheque($numero)
	WinActivate("Remise de chèques")
	WinWaitActive("Remise de chèques")
	Send("{^HOME}")
	Send("{F10}{SPACE}R")
	Send("Rapprochement")
	Send("{ESC}")
	Send("{CTRLDOWN}{HOME}{CTRLUP}{ESC}")
	Sleep(300)
	Send("{F10}{SPACE}R")
	Sleep(100)
	Send($numero)
	Send("{ENTER}")
	Sleep(300)
	Send("{ESC}")
	Send("{SHIFTDOWN}{TAB}{SHIFTUP}")
	Sleep(300)
	Send("{SPACE}")
EndFunc

;~ check_cheque("0000118")
check_cheque("0000456")
check_cheque("3850452")
check_cheque("0594540")
check_cheque("0923959")
check_cheque("0000139")
check_cheque("7197542")
check_cheque("0000433")
check_cheque("0190749")
check_cheque("1957228")
check_cheque("0000575")
check_cheque("6070607")
check_cheque("0002432")



check_cheque("0000361")
check_cheque("1720029")
check_cheque("0594539")
check_cheque("4702702")
check_cheque("0161403")
check_cheque("0455007")

check_cheque("4615853")

check_cheque("3194747")
check_cheque("0106806")
check_cheque("1185843")
check_cheque("5701876")
check_cheque("5181362")
check_cheque("1185842")
check_cheque("3071247")
check_cheque("3895747")
check_cheque("140060")
check_cheque("0000831")
check_cheque("0000218")
check_cheque("8000453")
check_cheque("9345763")
check_cheque("5701877")

check_cheque("2933238")
check_cheque("9454700")



If ($CmdLine[0] == 0) Then
	MsgBox($MB_SYSTEMMODAL, "Saisie-cheque", "Usage : binary cheque-number")
Else
	check_cheque($CmdLine[1])
EndIf