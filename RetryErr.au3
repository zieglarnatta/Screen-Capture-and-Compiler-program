#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.2.12.1
 Software Version: 1.0
 Date: Nov 7 2008
 Author:         Roy Yap

 Script Function:
	Retry Error function AutoIt script.

#ce ----------------------------------------------------------------------------

Global $termRE

;choice to terminate or retry on error
Func RetryErr ()
	$termRE = MsgBox ( 4, "Error Occurred","Click Yes to terminate script, No to retry")
		If $termRE = 6 Then
			Exit 0
		EndIF
EndFunc