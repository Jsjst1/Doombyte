' Verberg het venster
Set WshShell = CreateObject("WScript.Shell")

' Toon waarschuwing pop-ups
Dim x
x = MsgBox("Dit is een educatieve waarschuwing. Druk op OK om verder te gaan.", vbExclamation + vbOKOnly, "Educatieve Waarschuwing")
x = MsgBox("Weet je zeker dat je verder wilt gaan? Druk op OK om te bevestigen.", vbExclamation + vbOKOnly, "Bevestiging")
x = MsgBox("Dit is een simulatie. Geen echte actie vereist.", vbInformation + vbOKOnly, "Informatie")

' Correct wachtwoord
correctPassword = "jouwWachtwoord" ' Vervang dit door het juiste wachtwoord

' Maximum aantal pogingen
maxAttempts = 3
attempts = 0
Dim passwords ' Om de ingevoerde wachtwoorden op te slaan

' Loop om meerdere wachtwoorden in te voeren
Do While attempts < maxAttempts
    ' Vraag om een wachtwoord
    password = InputBox("Voer een wachtwoord in:", "Wachtwoord Invoer")

    ' Sla het ingevoerde wachtwoord op
    If passwords = "" Then
        passwords = password
    Else
        passwords = passwords & ", " & password
    End If

    ' Controleer of het wachtwoord correct is
    If password = correctPassword Then
        MsgBox "Toegang verleend! Ga verder.", vbInformation, "Toegang"
        Exit Do
    Else
        attempts = attempts + 1
        MsgBox "Fout wachtwoord! Poging " & attempts & " van " & maxAttempts, vbCritical, "Fout"
    End If
Loop

' Controleer of het maximum aantal pogingen is bereikt
If attempts = maxAttempts Then
    ' Maak een venster in volledig scherm
    Dim objIE
    Set objIE = CreateObject("InternetExplorer.Application")
    objIE.Visible = True
    objIE.Navigate "about:blank"
    
    ' Wacht tot de pagina geladen is
    Do While objIE.Busy Or objIE.ReadyState <> 4
        WScript.Sleep 100
    Loop

    ' Volledig scherm modus
    objIE.FullScreen = True

    ' Zet de achtergrondkleur permanent op rood
    objIE.Document.body.style.backgroundColor = "red"

    ' Toon een eindboodschap
    objIE.Document.body.innerHTML = "<h1 style='color: white; text-align: center;'>Maximaal aantal pogingen bereikt! Het venster blijft nu rood.</h1><h2 style='color: white; text-align: center;'>Herstart het systeem om te ontsnappen.</h2>"

    ' Breng het rode scherm naar de voorgrond
    objIE.Visible = True
    WshShell.AppActivate(objIE.Document.title)

    ' Open meerdere Notepad-instances
    For i = 1 To 1000 ' Pas dit getal aan naar het gewenste aantal
        WshShell.Run "notepad.exe"
    Next

    ' Simuleer een vergrendeling door een oneindige loop
    Do While True
        ' Dit blokkeert de verdere interactie
        WScript.Sleep 100 ' Voorkom dat het script te veel CPU gebruikt
    Loop
End If

' Toon de verzamelde wachtwoorden
MsgBox "De ingevoerde wachtwoorden zijn:" & vbCrLf & passwords, vbInformation, "Ingevoerde Wachtwoorden"
