#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.4.0
 Software Version: 1.8
 Date: April 30 2010
 Author:         Roy Yap

 Script Function:
	Sets the JPG Quality if the default of 80% is not acceptable
	Changes: New version

#ce ----------------------------------------------------------------------------


Global $jpgquality, $jpgqualityoption

;module testing
;#include <RetryErr.au3>
;Quality()
;MsgBox (0,"Module Testing","$jpgqualityoption (6 for Yes, 7 for No) = " & $jpgqualityoption & " $jpgquality = " & $jpgquality )

;function to change screen shot jpg quality
Func Quality()
	$jpgqualityoption = MsgBox ( 4, "JPG Quality Change? Default is 80","Click Yes to proceed to Change Quality, No return exit from Quality Change. Valid values are 1 to 100")
	If $jpgqualityoption = 6 Then
		;Apr 30 2010 start do loop asking for jpg quality dialog box
		Do
			;ask for the jpg quality valid values are 1 - 100
			$jpgquality = InputBox ("JPG Quality","Type in the JPG quality (Valid values are 1 - 100)","80")
			;Start test of value input
			If @error = 1 Then
				Retry()
			;check for null input
			ElseIf $jpgquality = "" Then
				MsgBox ( 0, "Null Input!","Your null (empty) input is not valid! Please enter something other than a blank space",3)
			ElseIf $jpgquality < 1 Then
				MsgBox ( 0, "Image Quality is less than 1 / Invalid Input!","Your input: " & $jpgquality & " is not valid! Please enter a Number between 1 to 100",3)
			ElseIf $jpgquality > 100 Then
				MsgBox ( 0, "Image Quality is greater than 100 Input!","Your input: " & $jpgquality & " is not valid! Please enter a Number between 1 to 100",3)
			EndIf
		Until $jpgquality <> "" and $jpgquality > 0 and $jpgquality < 101
		MsgBox ( 0, "Image Quality Updated!","JPG Quality is now set at: " & $jpgquality ,3)
	;apr 30 2010 if no was selected then exit from loop
	ElseIf $jpgqualityoption = 7 Then
		$jpgquality = 80
		MsgBox ( 0, "JPG Quality Change exited","Quality will remain at 80%",3)
	EndIf
EndFunc
