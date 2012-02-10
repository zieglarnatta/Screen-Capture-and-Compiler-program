#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.0.0
 Software Version: 1.5
 Date: June 17 2009
 Author:         Roy Yap

 Script Function:
	Screen Checker AutoIt script.
	Changes made: Changing the manual image insertion to UDF _WordDocAddPicture ()

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

;debug module
;#include <Kill.au3>
;$imgloc = "c:\temp"
;$wdname = "module_testing"
;$imgcounte = 4
;ScreenCompiler()


#include <Word.au3>

Global $imgloc, $imgcounts, $imgcounte, $dumpsuccess, $dumpsuccesscheck, $wdname, $oWordApp, $saveit

Func ScreenChecker()
;$imgcounts = 1

Do
	$sssc = MsgBox ( 4, "Did it Compile correctly?","Click Yes exit, No to recompile, make sure you delete prior word doc. Make sure everything else is minimized")
			If $sssc = 7 Then
				; Collect file names and locations
				
				;reset the imgcounts variable
				$imgcounts = 1
				
				;save the word doc WordDocSave.au3
				;Wdlaunch ()
				$oWordApp = _WordCreate ()
				$oDoc = _WordDocGetCollection ($oWordApp, 0)
				;gives focues to the word doc
				WinActivate ("Document","")
				
				WinWaitActive ("Document","",2)
				;resize the word doc WordDocResize.au3
				;Wdresize ()
				
				
				;save the word doc WordDocSave.au3
				;Wdsave ()
					
				

				;perform do loop
				Do
					_WordDocAddPicture ($oDoc, $imgloc & "\" & $imgcounte & "." & "jpg", 0, 1)
					;WinActivate ("Document","")
					;WinWaitActive ("Document","",2)
					;Send ("{ALT}")
					;Send ("I")
					;WinWaitActive ("","",1)
					;Send ("P")
					;WinWaitActive ("","",1)
					;Send ("F")
					;WinWaitActive ("Insert Picture","",3)
					;send the location, start count sequence name and extension
					;Send ($imgloc & "\" & $imgcounts & "." & "gif")
					;Send ($imgname)
					;start count
					WinWaitActive ("Document","",1)
					;press enter to insert the file
					;Send ("{ENTER}")
					;press enter to go to next line
					;Send ("{ENTER}")
					;WinWaitActive ("Document","",1)
					$imgcounte = $imgcounte - 1
				;do loop keep importing pictures into word doc
				;Do
					;Send ("{ALT}")
					;Send ("I")
					;WinWaitActive ("","",1)
					;Send ("P")
					;WinWaitActive ("","",1)
					;Send ("F")
					;WinWaitActive ("Insert Picture","",1)
					;put in just the image name since prior folder should be auto remembered
					;start count
					;Send ($imgcounts & "." & "gif")
					;Send (".")
					;Send ("gif")
					;WinWaitActive ("Insert Picture","",1)
					;Send ("{ENTER}")
					;Send ("{ENTER}")
					;WinWaitActive ("Document","",1)
					;$imgcounts = $imgcounts + 1
				Until $imgcounte = $imgcounts - 1
				
				;modult testing
				;MsgBox (0,"$imgcounte value","$imgcounte is: " & $imgcounte)
				;MsgBox (0,"$sssc value","$sssc is: " & $sssc)
				
				;save the word doc WordDocSave.au3
				;Wdsave()
				;combine the string of image location and word doc name
				;$saveit = $imgloc & "\" & $wdname
				_WordDocSaveAs ($oDoc, $imgloc & "\" & $wdname)
			ElseIf $sssc = 6 Then
				MsgBox ( 0, "Script Killed", "Script has been killed since Yes button was clicked for successful compile.")
				Terminate()
			EndIf
Until $sssc = 6

EndFunc