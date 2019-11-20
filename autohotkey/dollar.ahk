+LButton::
if WinActive("ahk_class MStnChild")
{
Send {LButton 2}
Send {Left}
SendInput, {$}
Click, 40,270
}
