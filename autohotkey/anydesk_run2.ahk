;Run C:\Users\unimap\Desktop\AnyDesk.exe

Run C:\Users\dell\Desktop\AnyDesk.exe
Count := 0
SetTimer CheckText, 100000 ; Each second (1000ms)
Return
CheckText:
    Count ++
    If (Count <= 10)
    {
        IfWinExist AnyDesk, Akceptuj
        {
            SetTimer CheckText, Off
            GoSub TextFound
        }
    } Else {
            SetTimer CheckText, Off
            GoSub TextNotFound
    }
Return

TextFound:
ControlClick, Akceptuj, AnyDesk
Return

TextNotFound:
; Your code here in case of timeout
Return