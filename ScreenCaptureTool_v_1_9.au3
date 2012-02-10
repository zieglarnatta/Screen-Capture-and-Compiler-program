#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.4.0
 Software Version: 1.9
 Date: Nov 17 2010
 Author:         Roy Yap

 Script Function:
	Main Screen Shot Capture and Compile AutoIt script.

	Changes made: Have user select which hotkey to capture screen shots


#ce ----------------------------------------------------------------------------

;aug 30 2009
#include <CreateFolder.au3>
;May 29 2010
#include <FullScreen.au3>
#include <HighestNumber.au3>
#include <ImageLocation.au3>
;aug 21 2009
#include <JumpScenario.au3>
#include <Kill.au3>
#include <Pause.au3>
;April 30 2010
#include <Quality.au3>
#include <Retry.au3>
#include <RetryErr.au3>
#include <Scapture.au3>
#include <ScreenCapture.au3>
#include <ScreenCompiler.au3>
#include <SScapture.au3>
#include <Misc.au3>
#include <WordDocName.au3>


;Global variables used are declared (April 30 2010 add var for jpg %)
;May 29 added $activewindowcap as 1 = default
Global $imnum, $hGUI, $dll, $imgloc, $imgcounts, $imgcounte, $ssc, $sssc, $term, $jpgqualityoption, $jpgquality, $activewindowcap, $fileSizeDefined

;capture Pause and pause script
;Global $imgcounts , $imgcounte , $imgext , $imgloc , $imgname
HotKeySet("{PAUSE}", "TogglePause")

;capture Alt+ S and kill script Kill.au3
HotKeySet("!s", "Terminate")

;Aug 21 2009
;capture Alt+ C and ask to jump to new / old scenario, as needed create a new folder else read the highest image number to continue JumpScenario.au3
HotKeySet("!c", "JumpScenario")

;June 30 2010 retiring this functionality since Alt C jump scenario / folder selection and F9 will do the same
;Aug 31 2009;recompile moves as Alt+r
;HotKeySet("!r", "Recompile")

;Apr 30 2010 change jpg quality Alt+q
HotKeySet("!q", "Quality")

;May 29 2010 change from active Window to whole screen Alt+w
HotKeySet("!w", "FullScreen")

;capture Print Screen key to capture image
HotKeySet("{PRINTSCREEN}", "Scapture")

;capture F10 screen capture
;HotKeySet("{F10}", "Scapture")

;capture ALT + Print Screen to compile
HotKeySet("!{PRINTSCREEN}", "SScapture")

;capture F9 quit screen capture
;HotKeySet("{F9}", "SScapture")

;introduction message boxes (April 30 2010 change wording for jpg quality.
MsgBox ( 64, "Welcome to the Screen Shot Capture, Compiler and Redumper V1.9!    Developed by Roy Yap royyap1@gmail.com Nov 19 2010 ", "Based on Certified virus " & _
"free V1.6: http://www.softpedia.com/progClean/Screen-Capture-and-Image-Dumper-Clean-135784.html " & _
"This software is governed under the GNU license included with the installation. This program will attempt to " & _
"capture screenshots sequentially, open a word document, save it to your file and folder name of your choice, and then start " & _
"compiling your images into the word doc and save it up. To capture images, make sure window is active and in front then press Print Screen, to compile images into word doc " & _
"press Alt+Print Screen, Alt+c changes to another folder (new or existing) and also to redump via Alt+Print Screen, Alt+q changes jpg picture quality (default is 80%).  " & _
"Alt+w Toggles to full screen capture mode (default is active window only)" & _
"The program can be killed with Alt+s to exit")
;MsgBox ( 0, "Introduction 2", "This program will attempt to capture screenshots sequentially, open a word document, " & _
;"save it to your file and folder name of choice, and then start dumping your images into the word doc and save it up. " & _
;"To capture images press F10 and to compile images into word doc, press F9 " & _
;"The program can be killed with the cancel button when there is a dialogue box, " & _
;"else while running, press Alt+s to exit")


;initiate JPG quality as 80
$jpgquality = 80

;initiate active window only 1 as default capture mode
$activewindowcap = 1

;Nov 20 2010 Initiate 1048576 as the default 1MB file size
$fileSizeDefined = 1048576

;Start program here

;Collect file names and locations
;Call to ask for image save location / create folder, ImageLocation.au3
Imgloc()

;remind user of the magic buttons
MsgBox ( 0, "We shall begin!", "Image capturing Print Screen button (make sure screen is active and in front), once done, Alt+Print Screen button to compile, " & _
"at any time Alt+S (or Cancel button when available) " & _
"to kill Script, Alt+c Jumps to a different scenario / folder (and also to recompile via Alt+Print Screen button), Alt+q changed jpg quality, Alt+w Toggles to full screen " & _
"capture mode (default is active window only)")

;Start looking out for F10 presses to capture screen and save and F9 to start compiling
	$dll = DllOpen("user32.dll")
		While 1
			Sleep ( 250 )
			;Nov 21 2010 change to Print Screen
			;If _IsPressed("79", $dll) Then
			If _IsPressed("{PRINTSCREEN}", $dll) Then
				Scapture ()
			;Nov 21 2010 change to Alt+Print Screen
			;ElseIf _IsPressed("78", $dll) Then
			ElseIf _IsPressed("!{PRINTSCREEN}", $dll) Then
				SScapture ()
				ExitLoop
			EndIf
		WEnd
	DllClose($dll)
Exit