#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.2.12.1
 Software Version: 1.0
 Date: Nov 7 2008
 Author:         Roy Yap

 Script Function:
	Pause function AutoIt script.

#ce ----------------------------------------------------------------------------

Global $Paused

;function to capture pause key
Func TogglePause()
    $Paused = NOT $Paused
    While $Paused
        sleep(100)
        ToolTip('Script is "Paused"',0,0)
    WEnd
    ToolTip("")
EndFunc