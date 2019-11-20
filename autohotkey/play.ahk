!x::
ControlSend,GeckoFPSandboxChildWindow1,{Tab},ahk_exe firefox.exe
ControlSend,ahk_parent,{Space},ahk_exe firefox.exe
return

!z::
WinGet MMX, MinMax, ahk_exe firefox.exe
IfEqual MMX,-1, WinRestore, ahk_exe firefox.exe
IfEqual MMX,0, WinMinimize, ahk_exe firefox.exe
IfEqual MMX,1, WinMinimize, ahk_exe firefox.exe
return