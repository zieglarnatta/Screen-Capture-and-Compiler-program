#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.0.0
 Software Version: Demo
 Date: July 17 2009
 Author:         Roy Yap

 Script Function:
	Main Screen Shot Capture and Compile AutoIt script.
	
	Changes made: Demo version limit to 10 images

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
#include <Scapture.au3>
#include <SScapture.au3>
#include <Recompile.au3>
;#include <ScreenChecker.au3>
;#include <ScreenReCompiler.au3>


;Global variables used are declared
Global $imnum, $hGUI, $dll, $imgloc, $imgcounts, $imgcounte, $ssc, $sssc, $term

;capture Pause and pause script
;Global $imgcounts , $imgcounte , $imgext , $imgloc , $imgname
HotKeySet("{PAUSE}", "TogglePause")

;capture Alt+ S and kill script Kill.au3
HotKeySet("!s", "Terminate")

;capture F10 screen capture
HotKeySet("{F10}", "Scapture")

;capture shift + F10 quit screen capture
HotKeySet("{F9}", "SScapture")

;introduction message boxes
MsgBox ( 0, "Introduction", "Welcome to the Screen shot Capture, Compiler and Redumper V1.6! Developed by Roy Yap July 7 2009 Under GNU license included with the installation")
MsgBox ( 0, "Introduction 2", "This program will attempt to capture screenshots sequentially, open a word document, " & _
"save it to your file and folder name of choice, and then start dumping your images into the word doc and save it up. " & _ 
"To capture images press F10 and to compile images into word doc, press F9 " & _
"The program can be killed with the cancel button when there is a dialogue box, " & _
"else while running, press Alt+s to exit")
;MsgBox ( 0, "Introduction 3", "For now recommended word file name is <stage>_<scenario>_<version>_<shift>.doc " & _
;"example: S2_R032PRV_D_OPS_US_20OCT2008_1.doc ")
;MsgBox ( 0, "Introduction 4", "To capture images press F10 and to compile images into word doc, press F9")
;MsgBox ( 0, "Kill Script", "The program can be killed with the cancel button when there is a dialogue box," & _
;"else while running, press ESC to exit, Pause to Pause the script")

;initiate variable number to 1
$imnum = 1



;Start program here

; Collect file names and locations
;Call to ask for image save location, ImageLocation.au3
Imgloc()
	
;ask for word doc name, WordDocName.au3
Wdname()

;ask if user would like to dump images only Recompile.au3
Recompile()

;remind user of the magic buttons
MsgBox ( 0, "We shall begin!", "Image capturing F10, once done, F9 to compile, at any time Alt+S (or Cancel button when available) to kill Script")

;Start looking out for F10 presses to capture screen and save and F9 to start compiling
		$dll = DllOpen("user32.dll")
			While 1
				Sleep ( 250 )
				If _IsPressed("79", $dll) Then
					Scapture ()
				ElseIf _IsPressed("78", $dll) Then
					SScapture ()
					ExitLoop
				EndIf
			WEnd
		DllClose($dll)
Exit