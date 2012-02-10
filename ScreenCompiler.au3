#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.4.0
 Software Version: 1.9
 Date: Nov 9 2010
 Author:         Roy Yap

 Script Function:
	Screen Shot capture AutoIt script.
	Changes made: opens generic testing.docx, and inserts time stamps, saves up the docx periodically to check for file size

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

;module testing
;$imgloc = "C:\temp\regression001"
;$wdname = "module_testing"
;$imgcounte = 5
;#include <WordDocName.au3>
;ScreenCompiler()
;#include <Kill.au3>

;#include <WordDocLaunch.au3>
;#include <WordDocResize.au3>
;#include <WordDocSave.au3>
#include <Word.au3>
#include <TimeStampPrinter.au3>
#include <WordDocSaveAndCheck.au3>



Global $imgloc, $imgcounts, $imgcounte, $dumpsuccess, $dumpsuccesscheck, $wdname, $oWordApp, $saveit, $imnum, $sssc, $deletepics



$imgcounts = 1

;start the screen compiler
Func ScreenCompiler()
	;perform screen checker loop
	Do
		;launch Word Doc
		$oWordApp = _WordCreate ("")
		;open up the generic testing.doc
		$oDoc = _WordDocOpen ($oWordApp, @ScriptDir & "\testing.doc")
		;$oDoc = _WordDocGetCollection ($oWordApp, 0)
		;gives focues to the word doc
		WinActivate ("testing","")

		WinWaitActive ("testing","",2)

		;perform sequential dumping do loop
		While $imgcounte <> 0
			TimeStampPrinter ()
			_WordDocAddPicture ($oDoc, $imgloc & "\" & $imgcounte & "." & "jpg", 0, 1)
			;Sept 2 2009 changing to $imnum instead of $imgcounte
			;_WordDocAddPicture ($oDoc, $imgloc & "\" & $imgcounte & "." & "jpg", 0, 1)

			WinWaitActive ("testing","",1)

			$imgcounte = $imgcounte - 1

			;Nov 20 2010 saves up the word doc and checks the size
			WordDocSaveAndCheck()

		WEnd
		;Until $imgcounte = $imgcounts - 1

		;modult testing
		;MsgBox (0,"$imgcounte value","$imgcounte is: " & $imgcounte)

		;Nov 20 moving this module to the CreateFolder functionality since docx will be broken into <1MB pieces or as specified
		;Aug 21 2009 moved this functionality from main to dumerp
		;ask for word doc name, WordDocName.au3
		;Wdname()

		;Nov 20 moving the word save into the above image dumping to save up word doc and check the size <1MB or as specified
		;Aug 21 2009 added this comment: save up the word doc
		;_WordDocSaveAs ($oDoc, $imgloc & "\" & $wdname)

		; check if the dump was successful
		$sssc = MsgBox ( 4, "Did it Compile correctly?","Click Yes exit compile mode, No to recompile, make sure you delete prior word doc. Make sure everything else is minimized")
		;if it's a no aka 7, reset the $imgcounte to $imgcounttrack and redo the dumping
		If $sssc = 7 Then
			;close the word doc
			_WordDocClose ($oDoc)
			;quit the word doc
			_WordQuit ($oWordApp)
			;reset the $imgcounte to original #
			$imgcounte = $imnum - 1
		;June 4 2010 added the option to delete all pictures from folder upon successful picture compilation, 6 aka yes
		ElseIf $sssc = 6 Then
			$deletepics = MsgBox ( 4, "Do you want to delete all pictures?","Click Yes to delete, No to leave pictures in folder")
			;if it's a yes aka 6, delete all the pictures
			If $deletepics = 6 Then
				;Do
				;June 30 2010 just delete all jpgs without counting
					FileDelete ($imgloc & "\*.jpg")

					;check for successful deletion of pictures
					$search = FileFindFirstFile($imgloc & "\" & "*.jpg")
						; Check if the search was successful
						If $search = -1 Then
							;use mouse tool tip to inform the user that there's no image and will start with 1
							$pos = MouseGetPos()
							ToolTip("All images have been deleted succesfully",$pos[0],$pos[1],"",1,7)
							;wait quickly for 1 second
							Sleep(2000)
							;close up the tool tip
							ToolTip("")
						EndIf
					;$imgcounte = $imgcounte - 1
				;Until $imgcounte < $imnum
			ElseIf $deletepics = 7 Then
				$pos = MouseGetPos()
					ToolTip("Image will be left in folder",$pos[0],$pos[1],"",1,7)
					;wait quickly for 1 second
					Sleep(2000)
					;close up the tool tip
					ToolTip("")
			EndIf
		EndIf
	Until $sssc = 6
	;test if it recompiled correctly then proceed to terminate script, Kill.au3
	;If $sssc = 6 Then
	;EndIf
EndFunc
