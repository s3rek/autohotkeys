global aString
FileSelectFile, path
web_browser := ComObjCreate("InternetExplorer.Application")
web_browser.Visible := true

Loop, read, %path%
{
	web_browser.Navigate("https://przegladarka-ekw.ms.gov.pl/eukw_prz/KsiegiWieczyste/wyszukiwanieKW?komunikaty=true&kontakt=true&okienkoSerwisowe=false")
	While ( web_browser.Busy || web_browser.ReadyState != 4 )
	{
	Sleep 10
	}
	counter:=0
	;MsgBox %A_LoopReadLine%
	aString := StrSplit(A_LoopReadLine, "_")
	kodwyd := web_browser.document.getElementById("kodWydzialuInput")
	kodwyd.value := aString.1
	nrKW:=web_browser.document.getElementById("numerKsiegiWieczystej")
	nrKW.value:= aString.2
	cyfra:=web_browser.document.getElementById("cyfraKontrolna")
	cyfra.value:= aString.3
	KeyWait, space, D	
	;web_browser.document.getElementById("wyszukaj").click()
	While ( web_browser.Busy || web_browser.ReadyState != 4 )
	{
	Sleep 10
	}
	web_browser.document.getElementById("przyciskWydrukZupelny").click()
	While ( web_browser.Busy || web_browser.ReadyState != 4 )
	{
	Sleep 10
	}
	send, ^s
	WinWait, Zapisywanie strony sieci Web
	SendInput %A_LoopReadLine%%counter%
	send, {Enter}
	Sleep 500
	value:= ""
	listarozdz = Dział I-O|Dział I-Sp|Dział II|Dział III|Dział IV
	Loop, parse, listarozdz, |
	{
	counter :=counter+1
	;MsgBox %A_LoopField%
	While ( value <> A_LoopField )
	{
		value := web_browser.document.getElementsByTagName( "input")[ A_Index - 1].value, index := A_Index - 1
	}
	While ( web_browser.Busy || web_browser.ReadyState != 4 )
	{
	Sleep 10
	}
	send, ^s
	WinWait, Zapisywanie strony sieci Web
	SendInput %A_LoopReadLine%%counter%
	send, {Enter}
	Sleep, 400
	}	
}

return
