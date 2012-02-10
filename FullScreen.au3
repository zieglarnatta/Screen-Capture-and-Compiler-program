#cs ----------------------------------------------------------------------------

 Software Version: 1.8
 AutoIt Version: 3.3.4.0
  Date: May 29 2010
 Author:         Roy Yap

 Script Function:
	Toggle to fulls creen function AutoIt script.
	Changes made: Initial Version

#ce ----------------------------------------------------------------------------

;modul testing
;FullScreen()

Global $activewindowcap, $fullscreenyesno

Func FullScreen()
	;Confirm to change to fulls creen mode
	$fullscreenyesno = MsgBox(4,"Full Screen Mode?","Click YES to capture full screen, NO continue to capture active window only")
	;if Yes aka 6, call set the $activewindowcap = 2
	If $fullscreenyesno = 6 Then
		$activewindowcap = 2
	ElseIf $fullscreenyesno = 7 Then
		$activewindowcap = 1
		$pos = MouseGetPos()
		ToolTip("Capture will be deafaulted to active window only!",$pos[0],$pos[1],"",1,7)
		;wait quickly for 1 second
		Sleep(2000)
		;close up the tool tip
		ToolTip("")
	EndIf
Return $activewindowcap
EndFunc
