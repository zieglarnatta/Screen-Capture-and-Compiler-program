#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.2.12.1
 Software Version: 1.1
 Date: Dec 29 2008
 Author:         Roy Yap

 Script Function:
	Main Screen Shot Capture and Compile AutoIt script.

#ce ----------------------------------------------------------------------------

#include <ScreenCompiler.au3>
#include <Misc.au3>
#include <Kill.au3>
#include <Pause.au3>
#include <Retry.au3>
#include <RetryErr.au3>
#include <WordDocName.au3>
;#include <WordDocSave.au3>
;#include <WordDocResize.au3>
#include <ImageLocation.au3>
;#include <ImageNumbering.au3>
#include <ScreenCapture.au3>
;#include <ScreenChecker.au3>
#include <WordDocLoc.au3>
#include <WordDocSave.au3>
;import the screen success
#include <ScreenSuccess.au3>
#include <Scapture.au3>
#include <SScapture.au3>

;Global variables used are declared
Global $imnum, $hGUI, $dll, $imgloc, $imgcounts, $imgcounte, $ssc, $sssc, $term, $dumpsuccesscheck

;capture Pause and pause script
;Global $imgcounts , $imgcounte , $imgext , $imgloc , $imgname
HotKeySet("{PAUSE}", "TogglePause")

;capture Escape and kill script
HotKeySet("{ESC}", "Terminate")

;capture F10 screen capture
HotKeySet("{F10}", "Scapture")

;capture shift + F10 quit screen capture
HotKeySet("{F9}", "SScapture")

;Start program here

;introduction message boxes
MsgBox ( 0, "Introduction", "Welcome to the Screen shot Capture and Compiler V1.1! Developed by Roy Yap Copyright Dec 29 2008")
MsgBox ( 0, "Introduction 2", "This program will attempt to capture screenshots sequentially, open a word document, " & _
"save it to your file and folder name of choice, and then start dumping your images into the word doc and save it up " & _ 
"For now recommended word file name is <stage>_<scenario>_<version>_<shift>.doc " & _
"To capture images press F10 and to compile images into word doc, press F9 " & _
"The program can be killed with the cancel button when there is a dialogue box, " & _
"else while running, press ESC to exit, Pause to Pause the script")

;initiate variable number to 1
$imnum = 1

; Collect file names and locations
;Call to ask for image save location ImageLocation.au3
Imgloc()
	
;ask for word doc name WordDocName.au3
Wdname()

;ask for word doc exe location WordDocLoc.au3
Wdloc()

;remind user of the magic buttons
MsgBox ( 0, "We shall begin!", "Image capturing F10, once done, F9 to compile, At any time Esc (or Cancel button when available) to kill Script, Pause to Pause script")

;Start looking out for F10 presses to capture screen and save and F9 to start compiling
	$dll = DllOpen("user32.dll")
		While 1
			Sleep ( 250 )
			If _IsPressed("79", $dll) Then
				Scapture ()
			ElseIf _IsPressed("78", $dll) Then
				SScapture ()
			EndIf
		WEnd
	DllClose($dll)
;function to redo the screen capturing if it wasn't dumped correctly
;Check if the screen dump was successful, else do it again, ScreenSuccess.au3
ScreenSuccess()
Exit