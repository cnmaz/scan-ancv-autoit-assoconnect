#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Run_Stop_OnError=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <GUIConstants.au3>

Func saisie_cheque($montant, $numero)
	WinActivate("Transaction n")
	WinWaitActive("Transaction n")
	Sleep(100)
	Send("{F12}")
	Sleep(1200)
	Send("document.getElementById('addPaymentButton').click(){ENTER}")
	Sleep(1800)
	Send('$("input.dateInput:visible").first().focus(){ENTER}')
	Sleep(100)
	Send("{F12}")
	Sleep(500)
	Send("{ENTER}{TAB}")
	Send($montant)
	Send("{TAB}")
	Send("ANCV")
	Sleep(300)
	Send("{TAB}")
	Send($numero)
EndFunc

Func validate()
	WinActivate("Transaction n")
	WinWaitActive("Transaction n")
	Sleep(100)
	Send("{F12}")
	Sleep(1200)
	Send("$(`.button.buttonOrange:contains('Enregistrer'):visible`).first().click(){ENTER}")
	Sleep(300)
	Send("{F12}")
EndFunc


Func Start_GUI()
	Local $hGUI = GUICreate("Scan ANCV", 250, 90)

	Local $idOK = GUICtrlCreateButton("Exit",50,66,85,25)
	Local $idNext = GUICtrlCreateButton("Next",10,66,40,25)
	Local $idCheque = GUICtrlCreateInput("", 10, 10, 150, 25)
;~ 	Local $idMode = GUICtrlCreateCheckbox("Zero initial", 160, 10, 80, 25)
	Local $idMontant = GUICtrlCreateCombo( "Montant", 10, 35)
	GUICtrlSetData($idMontant, "10|20|50", "10")

	GUISetState(@SW_SHOW, $hGUI)

	GUICtrlSetState($idCheque, $GUI_FOCUS)

	Local $idMsg
	Do
		$idMsg = GUIGetMsg()
		If (StringLen(GUICtrlRead($idCheque)) >= 13) Then
			Sleep(500)
			Local $montant =GuiCtrlRead($idMontant)
			Local $cheque = ""
;~ 			If (GuiCtrlRead($idMode)==$GUI_CHECKED ) Then
				$cheque = StringMid(GuiCtrlRead($idCheque), StringLen(GuiCtrlRead($idCheque))-12, 9)
;~ 			Else
;~ 				$cheque = StringMid(GuiCtrlRead($idCheque), StringLen(GuiCtrlRead($idCheque))-12, 10)
;~ 			EndIf
			ConsoleWrite( "Montant"&$montant&"/")
			ConsoleWrite( "Cheque"&$cheque&@CRLF)

			saisie_cheque($montant, $cheque)
			GUICtrlSetData($idCheque,"")
		EndIf
	Until ($idMsg = $GUI_EVENT_CLOSE) Or ($idMsg = $idOK)



	GUIDelete($hGUI)

EndFunc


If ($CmdLine[0] < 2) Then
	Start_GUI()
Else
	If ($CmdLine[0] == 3 ) and $CmdLine[3] == "--confirm" Then
		validate()
	Else
		saisie_cheque($CmdLine[1], $CmdLine[2])
	EndIf
EndIf