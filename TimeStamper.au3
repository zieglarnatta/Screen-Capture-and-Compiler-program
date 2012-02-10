#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.4.0
 Software Version: 1.9
 Date: Nov 9 2010
 Author:         Roy Yap

 Script Function:
	Saves a copy of the time stamp in a temp log file

	Changess made: Initial version


#ce ----------------------------------------------------------------------------

#include <File.au3>
#include <Date.au3>


Global $tempTime, $timeStamp, $imgloc, $wdname, $testLog

;module debugging
;$imgloc = "C:\Users\zieglarnatta\Documents\screen_capture\test_folder001"
;$wdname = "regession"

;TimeStamp()
;MsgBox(4096, "The time stamp taken is:", $tempTime)
;TimeStamp()
;MsgBox(4096, "The time stamp taken is:", $tempTime)
;TimeStamp()
;MsgBox(4096, "The time stamp taken is:", $tempTime)

Func TimeStamper ()
	;check if time stamp log doesnt exist, then create it
	;$testLog = FileExists($imgloc & "\" & $wdname & ".log")
	If Not FileExists($imgloc & "\" & $wdname & ".log") Then
		;$testLog = 0 Then
		;create the log file in scenario folder
		;_FileCreate($imgloc & "\" & $wdname & ".log")
		If Not _FileCreate($imgloc & "\" & $wdname & ".log") Then
			MsgBox(4096,"Error", " Error Creating/Resetting log.      error:" & @error)
		EndIf
	;get the time stamp
		$tempTime = _NowCalcDate() & " " & _NowTime()

			;open up the time stap log file and start writing time stamps
			$timeStamp = FileOpen($imgloc & "\" & $wdname & ".log", 1)

			; Check if file opened for writing OK
			If $timeStamp = -1 Then
				MsgBox(0, "Error", "Unable to open time stamp log file.")
				Exit
			EndIf

			;Write the time stamp as a new line
			FileWriteLine($timeStamp, $tempTime)
			FileClose($timeStamp)
	;check if time stamp log already exists
	Else
		;get the time stamp
		$tempTime = _NowCalcDate() & " " & _NowTime()

			;open up the time stap log file and start writing time stamps
			$timeStamp = FileOpen($imgloc & "\" & $wdname & ".log", 1)

			; Check if file opened for writing OK
			If $timeStamp = -1 Then
				MsgBox(0, "Error", "Unable to open time stamp log file.")
				Exit
			EndIf

			;Write the time stamp as a new line
			FileWriteLine($timeStamp, $tempTime)
			FileClose($timeStamp)
	EndIf
EndFunc