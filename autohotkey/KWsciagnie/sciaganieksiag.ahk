global aString
FileSelectFile, path
web_browser := ComObjCreate("InternetExplorer.Application")
web_browser.Visible := true
AHKin:=nic
try
{
Loop, read, %path%
{
	Sleep 200
	web_browser.Navigate("https://przegladarka-ekw.ms.gov.pl/eukw_prz/KsiegiWieczyste/wyszukiwanieKW?komunikaty=true&kontakt=true&okienkoSerwisowe=false")
	While ( web_browser.Busy || web_browser.ReadyState != 4 )
	{
	Sleep 50
	}
	counter:=0
	aString := StrSplit(A_LoopReadLine, "_")
	kodwyd := web_browser.document.getElementById("kodWydzialuInput")
	kodwyd.value := aString.1
	kodwyd.Focus()
	nrKW:=web_browser.document.getElementById("numerKsiegiWieczystej")
	nrKW.value:= aString.2
	cyfra:=web_browser.document.getElementById("cyfraKontrolna")
	cyfra.value:= aString.3
	
	;MsgBox %AHKin%
	;commands=(join& python "C:\Users\Dell\Source\Repos\HTM2PDF\Htm2pdf\dist\Htm2pdf.exe" "%AHKin%")
	;Run, C:\Users\Dell\Source\Repos\HTM2PDF\Htm2pdf\dist\Htm2pdf.exe %AHKin%
	RunWait "Htm2pdf.exe" "%AHKin%"
	;MsgBox, 0, df, %clipboard%
	lama=%clipboard%
	;MsgBox, 0, df2, %lama%
	web_browser.document.getElementById("captchaBean.reCaptcha2Bean.recaptchaResponse").value:=lama
	
	;schowek:=%clipboard%
	;token:=web_browser.document.getElementById("captchaBean.reCaptcha2Bean.recaptchaResponse") 
	;token.value:= %schowek%
	
	;KeyWait, space, D	
	web_browser.document.getElementById("wyszukaj").click()
	
	
	While ( web_browser.Busy || web_browser.ReadyState != 4 )
	{
	Sleep 10
	}
	web_browser.document.getElementById("wyszukaj").click()
	
	
	While ( web_browser.Busy || web_browser.ReadyState != 4 )
	{
	Sleep 10
	}
	;web_browser.document.getElementById("przyciskWydrukZupelny").click()
	;web_browser.document.getElementById("przyciskWydrukZwykly").click()
	web_browser.document.getElementById("przyciskWydrukDotychczasowy").click()
	
	While ( web_browser.Busy || web_browser.ReadyState != 4 )
	{
	Sleep 10
	}
	send, ^s
	WinWait, Zapisywanie strony sieci Web
	SendInput %A_LoopReadLine%%counter%
	send, {Enter}
	WinWaitClose, Zapisz jako
	Sleep 10
	value:= ""
	
	;listarozdz = Dział I-O|Dział I-Sp|Dział II|Dział III|Dział IV
	;listarozdz = Dział I-Sp|Dział II|Dział III|Dział IV
	listarozdz = Dział I-O|Dział I-Sp|Dział II|Dział III|Dział IV
	
	Loop, parse, listarozdz, |
	{
	counter :=counter+1
	;MsgBox %A_LoopField%
	While ( value <> A_LoopField )
	{
		value := web_browser.document.getElementsByTagName( "input")[ A_Index - 1].value, index := A_Index - 1
			While ( web_browser.Busy || web_browser.ReadyState != 4 )
			{
			Sleep 10
			}
	}
	web_browser.document.getElementsByTagName("input")[index].click()
	While ( web_browser.Busy || web_browser.ReadyState != 4 )
	{
	Sleep 10
	}
	send, ^s
	WinWait, Zapisywanie strony sieci Web
	SendInput %A_LoopReadLine%%counter%
	AHKin = %A_LoopReadLine%
	send, {Enter}
	WinWaitClose, Zapisz jako
	Sleep, 10
	}
}
	Run "Htm2pdf.exe" "%AHKin%"
}
return
