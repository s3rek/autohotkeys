counter:=0
Loop Files, %A_ScriptDir%\*.pdf
{
	InputBox, folder, numer operatu, Podaj numer z okładki operatu (pieczątki)
	MsgBox, 4, , Czy jest mapa?
	IfMsgBox Yes
		folder = %folder%_mapa
	Gui, Add, Button, x15 y50 w50 gInfo, Info
	Gui, Add, Button, x+20 w50 gName, Name
	FileCreateDir, %A_ScriptDir%\%folder%
	FileMove, %A_ScriptDir%\*.pdf, %A_ScriptDir%\%folder%\
}
Loop, %A_ScriptDir%\%folder%\*.*
{
	counter++
}
FileMoveDir, %A_ScriptDir%\%folder%, %A_ScriptDir%\%folder%_(%counter%) ,R
