#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.2.12.1
 Software Version: 1.0
 Date: Nov 7 2008
 Author:         Roy Yap

 Script Function:
	Word Doc Save function AutoIt script.

#ce ----------------------------------------------------------------------------
#include <ScreenCapture.au3>


Global $dumpsuccesscheck

Func ScreenSuccess ()
	Do
		$dumpsuccesscheck = MsgBox ( 4, "Successful Image Dump and Word Doc save?","Click Yes to KillScipt, No to redump")
			If $dumpsuccesscheck = 6 Then
					MsgBox ( 0, "End program, Successful image dumping", "Script has been killed. Thanks for using my program -Roy-.",5)
					Exit 0
			ElseIf $dumpsuccesscheck = 7 Then
					ScreenCompiler()
			EndIf
	Until $dumpsuccesscheck = 6
EndFunc