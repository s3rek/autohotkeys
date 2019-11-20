#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 3
onexit, ende

FileSelectFolder,WorkingFolder,,0,Seleccionar carpeta con los PDFs
Sleep,200
if workingfolder =
{
	message = No files selected
	exitapp
}
if ErrorLevel
{
	message = No files selected
	exitapp
}
run pdfversion.exe,,, pid
WinWait,PDF Version Converter 1.0,, 3
if ErrorLevel
{
    MsgBox, PDF version program not found
    return
}
settimer, block, 10000
BlockInput, on
Teller:=0
Loop %workingfolder%\*.htm,,1
{
	inputcount++
	file := a_loopfilename
	path := a_loopfilefullpath
	stringtrimright, newpath, a_loopfilefullpath, 4
	newpath .= "_v14.pdf"
	ifexist, % newpath
	{
		pdf_already++
		continue
	}
	fileread, data, % a_loopfilefullpath
	stringleft, pdf, data, 8
	if (pdf = "%PDF-1.4")
	{
		pdf14++
		continue
	}
	if (pdf = "%PDF-1.6")
	{
		pdf16++
		continue
	}
	WinWaitActive,PDF Version Converter 1.0
	
	ControlClick,TButton5,PDF Version Converter 1.0
	goon("Open PDF","TButton5")
	WinWaitActive,Open PDF
	ControlSetText,Edit1,%A_LoopFileFullPath%
	ControlClick,Button2,Open PDF
	check("Open PDF","TButton5")
	goon("Open","Button2","Open PDF")
	WinWaitClose,Open PDF
	
	WinWaitActive,PDF Version Converter,, 3
	if ErrorLevel = 0
	{
		WinActivate,PDF Version Converter
		Errors .= A_LoopFileName "`n"
		errorcount++
		ControlClick, Button1, PDF Version Converter
		goon("OK","Button1","PDF Version Converter")
		continue
	}
	goon2()
	ControlClick,TButton4,PDF Version Converter 1.0
	goon("Save PDF","TButton4")
	WinWaitActive,Save PDF
	ControlSetText,Edit1,%newpath%
	ControlClick,Button2,Save PDF
	check("Save PDF","TButton4")
	goon("Store","Button2","Save PDF")
	WinWaitClose,Save PDF
	
	WinWaitActive,PDF Version Converter 1.0
back:
	ControlFocus,TGroupButton2,PDF Version Converter 1.0
	ControlClick,TGroupButton2,PDF Version Converter 1.0
	ControlClick,TButton3,PDF Version Converter 1.0
	goon("Convert","TButton2")
	
	WinWait,PDF Version Converter,, 3
	if ErrorLevel
	{
	    MsgBox, Problems converting document %A_LoopFileFullPath%
	    Exit
	}
	ControlClick,TButton1,PDF Version Converter
	if ErrorLevel
		goto back
	goon("OK","TButton1","PDF Version Converter")
	goon2()
	Teller++1
}
sleep,100
ende:
WinActivate,PDF Version Converter 1.0
ControlClick,Tbutton1,PDF Version Converter 1.0
sleep,100
if message =
{
	if errorcount > 0
	{
		message = Converted %Teller% of %inputcount% PDF-files with %errorcount% Errors - see filnames below.
		message = %message%`n%pdf_already% already converted by this application
		message = %message%`n%pdf14% not converted, already version 1.4`n%pdf16% not converted, unsupported version 1.6
		message .= "`nErrors:`n-------`n" errors
	}
	else
	{
		message = Converted %Teller% PDF-files without Errors.
		message = %message%`n%pdf_already% already converted by this application
		message = %message%`n%pdf14% not converted, already version 1.4`n%pdf16% not converted, unsupported version 1.6
	}
}
msgbox, % message
exitapp


check(key,button,screen="PDF Version Converter 1.0")
{
	if errolevel =
		return
	ControlClick,%button%,%screen%
}

goon(key,button,screen="PDF Version Converter 1.0")
{
	global
	zkey := key
	zbutton := button
	zscreen := screen
	settimer, buttons, 10000
	timer_buttons = yes
	return
}

goon2()
{
	global zkey =
	settimer, running, 60000
	timer_running = yes
	settimer, buttons, off
	timer_buttons =
	return
}

running:
	if zkey <>
	{
		controlClick,%zbutton%,%zscreen%
		zkey =
	}
	else
	{
		Process, close, % pid
		msgbox, PDF Version Converter cannot process`n`n`t%path%`n`nPlease rename/remove this file and start the application again !
		exitapp
	}
	return

buttons:
	controlClick,%zbutton%,%zscreen%
	settimer, buttons, off
	timer_buttons =
	return

block:
	ifwinexist, Adobe Acrobat
	{
		controlclick, Button2, Adobe Acrobat
	}
	settimer, block, off
	blockinput, off
	return