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
	WinActivate("AssoConnect")
	WinWaitActive("AssoConnect")
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



If ($CmdLine[0] == 0) Then
	MsgBox($MB_SYSTEMMODAL, "Saisie-cheque", "Usage : binary cheque-number")
Else
	check_cheque($CmdLine[1])
EndIf