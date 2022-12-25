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
	WinActivate("https://cnmaz.assoconnect.com/organization/134216/accounting/check-remittance")
	WinWaitActive("https://cnmaz.assoconnect.com/organization/134216/accounting/check-remittance")
	;~ Se positionner sur numéro de chèque
	Send("{F10}{SPACE}R")
	Send("Numéro de chèq")
	Send("{ESC}")
;~ 	Send("{CTRLDOWN}{HOME}{CTRLUP}{ESC}")
	Sleep(300)
;~ 	Send("{F10}{SPACE}R")
	Send("{TAB}")
	Sleep(100)
	Send($numero)
	Sleep(2000)
	Send("{TAB 2}")
	Sleep(300)
;~ 	Send("{ESC}")
;~ 	Send("{SHIFTDOWN}{TAB}{SHIFTUP}")
;~ 	Sleep(300)
	WinWaitActive("https://cnmaz.assoconnect.com/organization/134216/accounting/check-remittance")
	Send("{SPACE}")
EndFunc


;~ check_cheque("0000118")
;~ check_cheque("0001134")
;~ check_cheque("6502896")
;~ check_cheque("3850461")
;~ check_cheque("0000443")




;~ check_cheque("6194602")
;~ check_cheque("4171487")
;~ check_cheque("0000255")

;~ check_cheque("0002445")




If ($CmdLine[0] == 0) Then
	MsgBox($MB_SYSTEMMODAL, "Saisie-cheque", "Usage : binary cheque-number")
Else
	check_cheque($CmdLine[1])
EndIf