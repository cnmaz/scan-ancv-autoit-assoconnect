import autoit
import time

WinActivate = autoit.win_activate
WinWaitActive = autoit.win_wait_active


def Sleep(t):
    time.sleep(t/1000)


Send = autoit.send
ClipPut = autoit.clip_put


def saisir_cheque(montant, numero):
	WinActivate("Transaction n")
	WinWaitActive("Transaction n")
	Sleep(100)
	Send("^+{i}")
	Sleep(1200)
	ClipPut("function clickPaymentButton() { if ($('#sparkTemplateLoading').length == 0 && document.getElementById('addPaymentButton')) { document.getElementById('addPaymentButton').click(); document.title='Nouveau Paiement'; } else {setTimeout(clickPaymentButton, 1000)}}; clickPaymentButton();")
	Send("^{v}")
	Send("{ENTER}")
	WinWaitActive("Nouveau Paiement")
	Sleep(300)
	ClipPut('function openDatePicker() { if ($("input.dateInput:visible").length >= 1) {$("input.dateInput:visible").first().focus(); document.title="Nouvel ANCV"; } else {setTimeout(openDatePicker, 1000);} }; openDatePicker()')
	Send("^{v}")
	Send('{ENTER}')
	Sleep(100)
	Send("{F12}")
	WinWaitActive("Nouvel ANCV")
	Send("{ENTER}{TAB}")
	Send(str(montant))
	Send("{TAB}")
	Send("ANCV")
	Sleep(1000)
	Send("{TAB}")
	Send(numero)
	WinWaitActive("Nouvel ANCV")
	Sleep(300)
	Send("{F12}")
	Sleep(1200)
	WinWaitActive("Nouvel ANCV")
	ClipPut('function validateAncv() { if ($(`input[name="BuyPackerAccountingEntryOptionOtherCheckNumber"][value]:visible`).length >= 1 && $(`input[name="BuyPackerAccountingEntryOptionOtherCheckNumber"][value]:visible`)[0].value =="' + str(
	    numero) + '") { $(`.button.buttonOrange:contains("Enregistrer"):visible`).first().click(); document.title="Transaction n"; } else {setTimeout(validateAncv, 1000);} }; validateAncv()')
	Send("^{v}")
	Sleep(300)
	Send('{ENTER}')
	Sleep(300)
	Send("{F12}")
	Sleep(3000)


def cocher_cheque(numero):
	WinActivate("Remise de chèques")
	WinWaitActive("Remise de chèques")
	Send("{F10}{SPACE}RR")
	Send("Numéro de chèq")
	Send("{ESC}")
	Sleep(300)
	Send("{TAB}")
	Sleep(100)
	Send(str(numero))
	Sleep(2000)
	Send("{TAB 3}")
	Sleep(300)
	WinWaitActive("Remise de chèques")
	Send("{SPACE}")
