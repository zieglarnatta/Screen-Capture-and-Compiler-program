#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.4.0
 Software Version: 1.8
 Date: June 30 2010
 Author:         Roy Yap

 Script Function:
	Checks if the user already / only wants to recompile prior pictures
	Changes: Retiring this functionality as of June 30 2010 to use Alt C / select folder and then F9
	changing message box information and 7 / yes to recompile

#ce ----------------------------------------------------------------------------


Global $recompile, $imgcounte, $imgcounttrack, $imnumcheck

;module testing
;#include <Retry.au3>
;#include <ScreenCompiler.au3>
;#include <Kill.au3>
;$wdname = "test"
;$imgloc = "C:\Users\zieglarnatta\Documents\autoit"
;Recompile()
;MsgBox (0,"Module Testing","$recompile (6 for Yes, 7 for No) = " & $recompile & " $imgcounte = " & $imgcounttrack)

;function to stop current screen shot capture
Func Recompile()
	$recompile = MsgBox ( 4, "Recompile Mode?","Click Yes to proceed to recompile mode, No go into screen capture mode.")
	If $recompile = 6 Then
		Do
			;ask for the highest image Number
			$imgcounte = InputBox ("Highest sequential JPG","Type in the highest JPG image number to dump until:","")
			;module testing to capture $imgcounte
			;$imgcounttrack = $imgcounte
			If @error = 1 Then
				Retry ()
			;check for null input
			ElseIf $imgcounte = "" Then
				MsgBox ( 0, "Null Input!","Your null (empty) input is not valid! Please enter something other than a blank space",3)
			ElseIf $imgcounte < 1 Then
				MsgBox ( 0, "Image value less than 1 Input!","Your input: " & $imgcounte & " is not valid! Please enter a Number greater than 0 (Zero)",3)
			;Aug 31 2009 check if the jpg file # exists
			Elseif $imgcounte <> "" and $imgcounte > 0 Then
				$imnumcheck = FileExists ($imgloc & "\" & $imgcounte & ".jpg")
				If $imnumcheck = 1  Then
				;show a tool tip dialog baloon
					$pos = MouseGetPos()
					ToolTip("Highest JPG image " & $imgcounte & ".jpg verified successfully in the folder " & $imgloc & "!",$pos[0],$pos[1],"",1,7)
					;wait quickly for 1 second
					Sleep(2000)
					;close up the tool tip
					ToolTip("")
				ElseIf $imnumcheck = 0  Then
					MsgBox ( 0, "Highest Image value not found!","Your highest JPG image number input: " & $imgcounte & " was not found in the folder " & $imgloc & " Please try again",3)
				EndIf
			EndIf
			;corrections to capture highest number reset for when redoing the redumping pass #2 and higher
			$imnum = $imgcounte + 1
		Until $imgcounte <> "" And $imgcounte > 0 and $imnumcheck = 1
		;ScreenCompiler.au3
		ScreenCompiler()
	;if no aka 7
	ElseIf $recompile = 7 Then
		;show a tool tip dialog baloon
		$pos = MouseGetPos()
		ToolTip("Recompile Mode Exited!",$pos[0],$pos[1],"",1,7)
		;wait quickly for 1 second
		Sleep(2000)
		;close up the tool tip
		ToolTip("")
	EndIf
EndFunc
