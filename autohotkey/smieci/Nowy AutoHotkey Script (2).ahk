Pwb				:= ComObjCreate( "InternetExplorer.Application" )													; Creates the ComObj
Pwb.Navigate("https://mail.google.com/mail/u/0/#inbox")																					; Navigates to AutoHotkey.com
Pwb.Visible 		:= True																							; Shows the IE app

While ( Pwb.Busy || Pwb.ReadyState != 4 )																			; Waits for the webpage to finish loading
	Sleep 10																										;	|


value 				:= ""																							; Creates the variable ( not needed )

While ( value <> "UTWÓRZ KONTO" )																				; Loops through the elements, until its innerText matches.
	value 			:= Pwb.document.getElementsByTagName( "a")[ A_Index - 1].innerText, index := A_Index -1			; Gets the value, and stores the Index

Pwb.document.getElementsByTagName( "a")[ index].Click()	