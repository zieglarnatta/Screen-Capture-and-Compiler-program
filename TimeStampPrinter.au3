#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.4.0
 Software Version: 1.9
 Date: Nov 10 2010
 Author:         Roy Yap

 Script Function:
	Prints out the time stamp interlaced between pictures

	Changess made: Initial version


#ce ----------------------------------------------------------------------------

Global $timeStamp

;module debugging
;$imgloc = "C:\Users\zieglarnatta\Documents\screen_capture\test_folder001"
;$wdname = "regession"
;$imgcounte = 2
;TimeStampPrinter ()

Func TimeStampPrinter ()

	$timeStamp = FileOpen($imgloc & "\" & $wdname & ".log", 0)

	; Check if file opened for reading OK
	If $timeStamp = -1 Then
		MsgBox(0, "Error", "Unable to open file.")
		Exit
	EndIf

	;read by using $imnum to go from $imgcounte,...,$imnum (1)
	$line = FileReadLine($timeStamp,$imgcounte)

		;module debugging
		;run the notepad to dump values
		;Run("Notepad.exe", "", @SW_MAXIMIZE)
		;WinWaitActive("Untitled - Notepad")

	Send ($line)

EndFunc