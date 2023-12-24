#Region ;***à* Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Run_Stop_OnError=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <GUIConstants.au3>

Func saisie_cheque($montant, $numero)
	WinActivate("Transaction n")
	WinWaitActive("Transaction n")
	Sleep(100)
	Send("^+{i}")
	Sleep(1200)
;~ 	Send("document.getElementById('addPaymentButton').click(){ENTER}")
;~ 	Opt("SendKeyDelay",0)
	ClipPut("function clickPaymentButton() { if ($('#sparkTemplateLoading').length == 0 && document.getElementById('addPaymentButton')) { document.getElementById('addPaymentButton').click(); document.title='Nouveau Paiement'; } else {setTimeout(clickPaymentButton, 1000)}}; clickPaymentButton();")
	Send("^{v}")
;~ 	Opt("SendKeyDelay",5)
	Send("{ENTER}")
	WinWaitActive("Nouveau Paiement")
	Sleep(300)
;~ 	Opt("SendKeyDelay",0)
	ClipPut('function openDatePicker() { if ($("input.dateInput:visible").length >= 1) {$("input.dateInput:visible").first().focus(); document.title="Nouvel ANCV"; } else {setTimeout(openDatePicker, 1000);} }; openDatePicker()')
	Send("^{v}")
;~ 	Opt("SendKeyDelay",5)
;~ 	Send('$("input.dateInput:visible").first().focus(){ENTER}')
	Send('{ENTER}')
	Sleep(100)
	Send("{F12}")
	WinWaitActive("Nouvel ANCV")
	Send("{ENTER}{TAB}")
	Send($montant)
	Send("{TAB}")
	Send("ANCV")
	Sleep(1000)
	Send("{TAB}")
	Send($numero)
	WinWaitActive("Nouvel ANCV")
	Sleep(300)
	Send("{F12}")
	Sleep(1200)
	WinWaitActive("Nouvel ANCV")
;~ 	Opt("SendKeyDelay",0)
	ClipPut('function validateAncv() { if ($(`input[name="BuyPackerAccountingEntryOptionOtherCheckNumber"][value]:visible`).length >= 1 && $(`input[name="BuyPackerAccountingEntryOptionOtherCheckNumber"][value]:visible`)[0].value =="'&$numero&'") { $(`.button.buttonOrange:contains("Enregistrer"):visible`).first().click(); document.title="Transaction n"; } else {setTimeout(validateAncv, 1000);} }; validateAncv()')
	Send("^{v}")
	Sleep(300)
;~ 	Opt("SendKeyDelay",5)
	Send('{ENTER}')
	;- Send("$(`.button.buttonOrange:contains('Enregistrer'):visible`).first().click(); document.title='Transaction n'; {ENTER}")
	Sleep(300)
	Send("{F12}")
	Sleep(3000)

	;- function validateAncv() { if ($(`input[name="BuyPackerAccountingEntryOptionOtherCheckNumber"][value]:visible`).length >= 1 && $(`input[name="BuyPackerAccountingEntryOptionOtherCheckNumber"][value]:visible`)[0].value =="'&$numero&'") { $(`.button.buttonOrange:contains('Enregistrer'):visible`).first().click(); document.title='Transaction n'; } else {setTimeout(validateAncv, 1000);} }; validateAncv()
EndFunc

Func validate()
	WinActivate("Nouvel ANCV")
	WinWaitActive("Nouvel ANCV")
	Sleep(100)
	Send("{F12}")
	Sleep(1200)
	;-Send('function validateAncv() { if ($(`input[name="BuyPackerAccountingEntryOptionOtherCheckNumber"][value]:visible`).length >= 1 && $(`input[name="BuyPackerAccountingEntryOptionOtherCheckNumber"][value]:visible`)[0].value =="'&$numero&'") { $(`.button.buttonOrange:contains("Enregistrer"):visible`).first().click(); document.title="Transaction n"; } else {setTimeout(validateAncv, 1000);} }; validateAncv()')
	Send("$(`.button.buttonOrange:contains('Enregistrer'):visible`).first().click(); document.title='Transaction n'; {ENTER}")
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


;~ saisie_cheque(50,"012345678")
;~ saisie_cheque(40,"912345678")

If ($CmdLine[0] < 2) Then
	Start_GUI()
Else
	If ($CmdLine[0] == 3 ) and $CmdLine[3] == "--confirm" Then
		validate()
	Else
		saisie_cheque($CmdLine[1], $CmdLine[2])
	EndIf
EndIf