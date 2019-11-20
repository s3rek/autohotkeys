counter:=0
Loop Files, %A_ScriptDir%\*.jpg
{
	InputBox, folder, numer operatu, Podaj numer z okładki operatu (pieczątki)
	MsgBox, 4, , Czy jest mapa?
	IfMsgBox Yes
		folder = %folder%_mapa
	FileCreateDir, %A_ScriptDir%\%folder%
	FileMove, %A_ScriptDir%\*.jpg, %A_ScriptDir%\%folder%\
}
Loop, %A_ScriptDir%\%folder%\*.*
{
	counter++
}
FileMoveDir, %A_ScriptDir%\%folder%, %A_ScriptDir%\%folder%_(%counter%) ,R
