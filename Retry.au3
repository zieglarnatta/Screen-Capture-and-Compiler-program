#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.4.0
 Software Version: 1.8
 Date: May 31 2010
 Author:         Roy Yap

 Script Function:
	Retry function AutoIt script.
	Changes: Changed the way the program exits

#ce ----------------------------------------------------------------------------

Global $termR

;choice to terminate or retry on cancel or close

Func Retry ()
	$termR = ""
	$termR = MsgBox ( 4, "Exit current mode?","Cancel was pressed. Click Yes to End current mode, No to retry")
		;Yes aka 6 was pressed
		If $termR = 6 Then
			$pos = MouseGetPos()
			ToolTip("Prior Mode Exited. Prior Mode has been exited",$pos[0],$pos[1],"",1,7)
			;wait quickly for 1 second
			Sleep(5000)
			;close up the tool tip
			ToolTip("")
		;if no aka 7
		ElseIf $termR = 7 Then
			$pos = MouseGetPos()
			ToolTip("Retry current mode",$pos[0],$pos[1],"",1,7)
			;wait quickly for 1 second
			Sleep(2000)
			;close up the tool tip
			ToolTip("")
		EndIF
	Return $termR
EndFunc
