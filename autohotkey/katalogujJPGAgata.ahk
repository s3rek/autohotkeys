Gui, Add, Button, x15 y50 w50 ggmina1, Dabrowa
Gui, Add, Button, x+20 w50 ggmina2, Suchowola
Gui, Add, Button, x+20 w50 ggmina3, Sokółka
Gui, Font, s11 cRed, Verdana
Gui, Add, Text, x50 y15, wybierz gmine.
Gui, Show, w250 h80, Test
Return


gmina1:
  gmina =Dabrowa
  counter:=0
  Loop Files, %A_ScriptDir%\*.jpg
  {
	InputBox, obreb, numer obrebu, Podaj numer obrebu
	InputBox, folder, numer operatu, Podaj numer z okładki operatu (pieczątki)
	MsgBox, 4, , Czy jest mapa?
	IfMsgBox Yes
		folder = %folder%_mapa
	FileCreateDir, %A_ScriptDir%\%gmina%\%obreb%\%folder%
	FileMove, %A_ScriptDir%\*.jpg, %A_ScriptDir%\%gmina%\%obreb%\%folder%
  }
  Loop, %A_ScriptDir%\%gmina%\%obreb%\%folder%\*.*
  {
	counter++
  }
  FileMoveDir, %A_ScriptDir%\%gmina%\%obreb%\%folder%, %A_ScriptDir%\%gmina%\%obreb%\%folder%_(%counter%) ,R
Return

gmina2:
  gmina =Suchowola
  counter:=0
  Loop Files, %A_ScriptDir%\*.jpg
  {
	InputBox, obreb, numer obrebu, Podaj numer obrebu
	InputBox, folder, numer operatu, Podaj numer z okładki operatu (pieczątki)
	MsgBox, 4, , Czy jest mapa?
	IfMsgBox Yes
		folder = %folder%_mapa
	FileCreateDir, %A_ScriptDir%\%gmina%\%obreb%\%folder%
	FileMove, %A_ScriptDir%\*.jpg, %A_ScriptDir%\%gmina%\%obreb%\%folder%
  }
  Loop, %A_ScriptDir%\%gmina%\%obreb%\%folder%\*.*
  {
	counter++
  }
  FileMoveDir, %A_ScriptDir%\%gmina%\%obreb%\%folder%, %A_ScriptDir%\%gmina%\%obreb%\%folder%_(%counter%) ,R
Return

gmina3:
  gmina=Sokółka
  counter:=0
  Loop Files, %A_ScriptDir%\*.jpg
  {
	InputBox, obreb, numer obrebu, Podaj numer obrebu
	InputBox, folder, numer operatu, Podaj numer z okładki operatu (pieczątki)
	MsgBox, 4, , Czy jest mapa?
	IfMsgBox Yes
		folder = %folder%_mapa
	FileCreateDir, %A_ScriptDir%\%gmina%\%obreb%\%folder%
	FileMove, %A_ScriptDir%\*.jpg, %A_ScriptDir%\%gmina%\%obreb%\%folder%
  }
  Loop, %A_ScriptDir%\%gmina%\%obreb%\%folder%\*.*
  {
	counter++
  }
  FileMoveDir, %A_ScriptDir%\%gmina%\%obreb%\%folder%, %A_ScriptDir%\%gmina%\%obreb%\%folder%_(%counter%) ,R
Return

GuiClose:
  ExitApp
Return