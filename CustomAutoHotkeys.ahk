#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #SingleInstance Force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^!t::
FileAppend Temporary Text: `n, C:\Users\123mi\Desktop\temp.txt
Run C:\Users\123mi\Desktop\temp.txt 
return

^!d::

FormatTime, CurrentDateTime,, yyyy_MM_dd
if FileExist("C:\Users\123mi\Dropbox\Documents\Dailies\" CurrentDateTime ".txt")
{
    ; MsgBox Exists!
    Run C:\Users\123mi\Dropbox\Documents\Dailies\%CurrentDateTime%.txt
}
else
{
    FileAppend ,To-Do List for %CurrentDateTime%: 
    
    
    , C:\Users\123mi\Dropbox\Documents\Dailies\%CurrentDateTime%.txt
    Run C:\Users\123mi\Dropbox\Documents\Dailies\%CurrentDateTime%.txt
 
    ; MsgBox C:\Users\123mi\Dropbox\Documents\Dailies\%CurrentDateTime%.txt Doesn't Exist, created!
}
return

; Esc::ExitApp 