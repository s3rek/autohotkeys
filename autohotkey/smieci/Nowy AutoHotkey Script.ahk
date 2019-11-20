^d::
WinWaitActive, ahk_exe firefox.exe
MouseMove, 391,554
send, {LButton down}
MouseClickDrag, Left, 391, 554, 1329, 554
return




!d::
send, {F5}
Sleep 2000
Click, 709, 446
SendInput % tab[0]
Click, 831, 448
SendInput {Raw}1266
Click,916,447
SendInput {Raw}8(SendInput)
Click 717,527 

Click, 636, 446
Click, rel, 95, 0

return

!s::
counter:=0
Loop, read, C:\Users\Dell\Desktop\txt.txt
{
	Click, 290,150
	Loop 5
	{
	Click Tab
	}
	Loop, parse, A_LoopReadLine, %A_Space%
	{
	Click Tab
	SendInput, %A_LoopField%
	}
	Click Tab
	Click, 719,532
	KeyWait, r, D
	Loop 3
	{
	Click Tab
	}
	Click {Enter}


	Sleep 7000
	Click, 1150,812
	Sleep 10000
	send, ^s
	Sleep, 2000
	counter:=counter +1
	SendInput %counter%
	send, {Enter}
	Sleep, 3000
	Click, 326, 61
	SendInput, {Raw} https://przegladarka-ekw.ms.gov.pl/eukw_prz/KsiegiWieczyste/wyszukiwanieKW?komunikaty=true&kontakt=true&okienkoSerwisowe=false
	send, {Enter}
	Sleep 10000
}
return


!f::
ControlSend,GeckoFPSandboxChildWindow1,{Tab},ahk_exe firefox.exe
ControlClick,WYSZUKAJ KSIĘGĘ,ahk_exe firefox.exe
return


!g::
Click, 1149,659
return



