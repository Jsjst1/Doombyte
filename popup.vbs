' Irritante pop-up script
Set WshShell = CreateObject("WScript.Shell")

' Functie om de pop-up te tonen
Sub ShowAnnoyingPopup()
    Do
        ' Toon een pop-up die de muis volgt
        WshShell.Popup "Vul een wachtwoord in!", 1, "Wachtwoord Vereist", 64
        WScript.Sleep 5 Wacht een halve seconde
    Loop
End Sub

' Start de pop-up in een aparte thread
ShowAnnoyingPopup