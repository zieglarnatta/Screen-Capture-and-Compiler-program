#cs ----------------------------------------------------------------------------

 AutoIt Version: v3.3.4.0
 Software Version: 1.8
 Date: June 30 2010
 Author:         Roy Yap

 Script Function:
	Word Doc Name function AutoIt script.
	Changes: added module testing

#ce ----------------------------------------------------------------------------

Global $wdname, $wdsave, $imgcounte


;module testing June 30 2010
;#include <Retry.au3>

;ask for file name and location to save word doc
Func Wdname ()
	Do
		$wdname = InputBox("Word Document Name?","Input your word document file name here. Pressing the Alt+s terminates the script","_US_SHIFT_")
		;$imgcounte = InputBox("$imgcounte","$imgcounte")
		If @error = 1 Then
			;commented out the retry and use direct dialog box
			Retry ()
			If $termR = 6 Then
					MsgBox ( 0, "Please save Word Doc Manually", "Since word doc was not named automatically through this tool")
					ExitLoop
				ElseIf $termR = 7 Then
			EndIf
		;check for null input
		ElseIf $wdname = "" Then
			MsgBox ( 0, "Null Input!","Your null (empty) input is not valid! Please enter something other than a blank space")
		;InputBox Failed to Open error occured due to bad arguments
		ElseIf @error = 3 Then
			MsgBox ( 0, "Error","An ;InputBox Failed to Open error occured due to bad arguments, please contact Roy Yap the developer")
			Exit
		EndIf
	Until $wdname <> ""
$termR = 0
EndFunc

;module testing
;Wdname ()
;#include <RetryErr.au3>
;MsgBox (0,"Module testing","$wdname is " & $wdname)
