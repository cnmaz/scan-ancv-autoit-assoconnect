from argparse import ArgumentParser
from dataclasses import dataclass
from typing import Callable
import serial
import queue
import os
import threading
import PySimpleGUI as sg
from .actions import saisir_cheque, cocher_cheque


port = "COM9"


def main():
    parser = ArgumentParser()
    parser.add_argument("--com", help="Port COM", choices=[
                        f'COM{x}' for x in range(10)], default="COM9")
    args = parser.parse_args()
    globals()['port'] = args.com
    thread_scanner = threading.Thread(
        target=read_barcodes, daemon=True)
    thread_scanner.start()
    ui()


@dataclass
class Cheque:
    montant: float
    numero: str

    def __str__(self):
        return f"{self.montant:4>}€  {self.numero}"


codes = {}
montant = 10


def ui():
    layout = [
        [sg.Button('Quitter'), sg.Button('Effacer tout'),
         sg.Button('Saisir paiement', button_color='red'),
         sg.Button('Remise de chèques', button_color='brown')],
        [sg.Button(f'{m}€') for m in [10, 20, 25, 50, 75]],
        [info_cheques := sg.Text('-')],
        [list_box := sg.Listbox(
            [], select_mode=sg.LISTBOX_SELECT_MODE_MULTIPLE, size=(50, 15))]
    ]
    window = sg.Window("ANCV", layout, location=(0, 300))
    while True:
        event, value = window.read(timeout=300)
        if list_box.get() != list(globals()['codes'].values())[::-1]:
            list_box.update(list(globals()['codes'].values())[::-1])
        info_cheques.update(f'{len(globals()['codes'])} chèques / Total {
                            sum([x.montant for x in globals()["codes"].values()])}€ / Montant en cours de saisie {globals()["montant"]}€')
        if event == sg.WINDOW_CLOSED or event == 'Quitter':
            break
        elif event == "Effacer tout":
            if sg.popup('Supprimer tout ?', title="Confirmer la suppression ? ", button_type=sg.POPUP_BUTTONS_YES_NO):
                globals()['codes'] = {}
        elif event.endswith('€') and event.replace('€', '').isnumeric():
            globals()['montant'] = int(event.replace('€', ''))
        elif event == 'Remise de chèques':
            for item in globals()['codes'].values():
                ret = select(item.numero, item.montant)
        elif event == 'Saisir paiement':
            for item in globals()['codes'].values():
                ret = saisir(item.numero, item.montant)


def read_code():
    code = ""
    car = ''
    with serial.Serial(port) as ser:
        while car != b'\r':
            car = ser.read()
            code = code + car.decode('utf-8')
        return code


def saisir(code, amount):
    # os.system(f"auto_saisie_ancv.exe {amount} {code}")
    saisir_cheque(amount, code)


def select(code, amount):
    # os.system(f"select_cheque.exe {code}")
    cocher_cheque(code)


def read_barcodes():
    def read_and_select_code_grouped():
        if globals()['codes'] == None:
            globals()['codes'] = {}
        code = read_code().strip()
        if code == 'STOP':
            return code
        if code.startswith('M'):
            new_montant = int(code[1:])
            globals()['montant'] = new_montant
            print(f"  --> Montant: {new_montant} €")
            return code
        else:
            code_sans_annee = code[:-4]
            code = code_sans_annee[-9:]
            globals()['codes'][code] = Cheque(montant=montant, numero=code)
            print(f"{code} {montant}€ Total : {sum([x.montant for x in globals()['codes'].values()])}€ {
                  len(globals()['codes'])} chèque{'s' if len(globals()['codes']) > 1 else ''}")
        return code

    while read_and_select_code_grouped() != 'STOP':
        pass


if __name__ == "__main__":
    main()
