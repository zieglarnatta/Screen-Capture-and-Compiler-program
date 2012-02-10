#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.4.0
 Software Version: 1.8
 Date: June 4 2010
 Author:         Roy Yap

 Script Function:
	Word Doc Save function AutoIt script.

	Changes made: message box to say exit from image compilation mode

#ce ----------------------------------------------------------------------------
#include <ScreenChecker.au3>

Global $ssc

;function to stop current screen shot capture
Func SScapture()
	;correction v1.6 to check for null image and prevent dumping
	If $imnum < 1 Then
		MsgBox ( 0, "No Image Captured Yet", "Please capture at least 1 image before proceeding to dump the images")
	ElseIf $imnum >= 1 Then
		$ssc = MsgBox ( 4, "Begin picture Compilation?","Click Yes to begin auto dumping of picture for folder " & $imgloc & _
		", No to compile later. Make sure everything else is minimized")
		If $ssc = 6 Then
			;ScreenCompiler.au3
			ScreenCompiler()
			;ScreenChecker()

		ElseIf $ssc = 7 Then
			$pos = MouseGetPos()
				ToolTip("Screen Compilation mode exited, Default back to capture mode on current folder",$pos[0],$pos[1],"",1,7)
				;wait quickly for 1 second
				Sleep(2000)
				;close up the tool tip
				ToolTip("")
		EndIf
	EndIf
EndFunc
