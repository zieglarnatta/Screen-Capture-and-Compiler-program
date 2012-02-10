#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.4.0
 Software Version: 1.8
 Date: Nov 10 2010
 Author:         Roy Yap

 Script Function:
	Word Doc Save function AutoIt script.

	Changess made: Added time stamping capability


#ce ----------------------------------------------------------------------------
#include <ScreenCapture.au3>
#include <TimeStamper.au3>

;Sept 2 2009 introduce moduel testing
;module testing
;$imgloc = "C:\temp"
;$imnum = "quality_and_capture"
;WinWait("","",5)
;Scapture()

; Apr 30 2010 added the $jpgquality as a varible
Global $imnum, $imgcount, $imgloc, $pos, $jpgquality, $activewindowcap

;function to call capture current screen shot and save the file sequentially
Func Scapture()
	;Grab the time stamp Nov 10 2010
	TimeStamper()
	;April 30 2010 change quality to variable, default should be 80
	_ScreenCapture_SetJPGQuality($jpgquality)

	If $activewindowcap = 1 Then
		$handle = WinGetHandle("[active]")
		_ScreenCapture_CaptureWnd ($imgloc & "\" & $imnum & ".jpg", $handle)
	ElseIf $activewindowcap = 2 Then
		_ScreenCapture_Capture ($imgloc & "\" & $imnum & ".jpg")
	EndIf
	;show a tool tip in almost middle of screen
	$pos = MouseGetPos()
	ToolTip("Screen Image " & $imnum & " has been captured in " & $imgloc & " location",$pos[0],$pos[1],"",1,7)
	;wait quickly for 1 second
	Sleep(500)
	;close up the tool tip
	ToolTip("")
	;MsgBox (64, "Success","Screen " & $imnum & " Captured",1)
	$imnum = $imnum + 1
	;allocate last variable as the upper most image number
	$imgcounte = $imnum - 1
	Return $imnum
	Return $imgcounte
EndFunc
