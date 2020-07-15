#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance Force
#Warn  ; Enable warnings to assist with detecting common errors.

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^!t::
if FileExist("D:\Dropbox\Temp Hosting\temp.txt")
{
    Run D:\Dropbox\Temp Hosting\temp.txt
}
else {
    FileAppend Temporary Text:, D:\Dropbox\Temp Hosting\temp.txt
    Run D:\Dropbox\Temp Hosting\temp.txt
}
return

^!d::

FormatTime, CurrentDateTime,, yyyy_MM_dd
if FileExist("D:\Dropbox\Documents\Dailies\" CurrentDateTime ".txt")
{
    Run D:\Dropbox\Documents\Dailies\%CurrentDateTime%.txt
}
else
{
    FileAppend ,To-Do List for %CurrentDateTime%: 
    
    
    , D:\Dropbox\Documents\Dailies\%CurrentDateTime%.txt
    Run D:\Dropbox\Documents\Dailies\%CurrentDateTime%.txt
}
return

; Esc::ExitApp 
