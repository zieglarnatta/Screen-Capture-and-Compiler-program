#cs ----------------------------------------------------------------------------

 Software Version: 1.9
 AutoIt Version: 3.3.4.0
  Date: Nov 9 2010
 Author:         Roy Yap

 Script Function:
	Initial version, creates folders on the fly
	Changes made: updated $termR variable

#ce ----------------------------------------------------------------------------

;Apr 30 2010 added $checkfolder
Global $imgloc1, $imgloc2, $imgloc, $checkfolder, $folderDecision, $termR

;module testing
;#include <Retry.au3>
;#include <HighestNumber.au3>
;#include <JumpScenario.au3>
;JumpScenario()
;CreateFolder()
;MsgBox ( 0, "$imgloc1, $imgloc2, $imgloc","$imgloc1 = " & $imgloc1 & " $imgloc2 = " & $imgloc2 & " $imgloc = " & $imgloc)

Func CreateFolder()
	;Aug 31 2009: reinitiate $imnum to 1
	$imnum = 1
	Do
		;call to browse general location of where the folder should be created
		$imgloc1 = FileSelectFolder("Location to create folder?", "", 4)
		If @error = 1 Then
			Retry ()
			If $termR = 6 Then
				MsgBox ( 0, "Please press Alt+c", "Please press Alt+c if you have exited from choosing a valid folder the first time as there will not be a defaulted folder at this point")
				ExitLoop
			ElseIf $termR = 7 Then
			EndIf
		EndIf
	Until $imgloc1  <> ""
	If $termR = 7 or $imgloc1  <> "" Then
		Do
			;ask for folder name
			$imgloc2 = InputBox ("Folder Name?","Enter name of folder to be created","")
			If @error = 1 Then
				Retry ()
				If $termR = 6 Then
					MsgBox ( 0, "Please press Alt+c", "Please press Alt+c if you have exited from choosing a valid folder name " & _
					"as there will not be a defaulted folder name at this point")
					ExitLoop
				ElseIf $termR = 7 Then
				EndIf
				;big issue with the space bar pressing and ispassing as valid input
			ElseIf $imgloc2 = "" Then
				MsgBox ( 0, "Null (Empty) Folder name not allowed","Please enter a name for the folder",2)
			EndIf
		Until $imgloc2 <> ""
	;compile the location together as $imgloc
	$imgloc = $imgloc1 & "\" & $imgloc2
		;check if the current folder exists and if so exit and call JumpScenario(), else go ahead and create the folder
		If FileExists ($imgloc) = 0 Then
			;make sure the directory is created successfully
			Do
				DirCreate($imgloc)
				If DirCreate($imgloc) = 0 Then
					MsgBox ( 0, "Directory creation failed","Please press Alt+s to kill the program, and then create directory manually and contact the developer royyap1@gmail.com")
				EndIf
			Until DirCreate($imgloc) = 1
			;short note that the folder created successfully
				$pos = MouseGetPos()
				ToolTip("Directory: " & $imgloc & " was created successfully!",$pos[0],$pos[1],"",1,7)
				;wait quickly for 1 second
				Sleep(2000)
				;close up the tool tip
				ToolTip("")
			Return $imgloc
		ElseIf FileExists ($imgloc) = 1 Then
			;give the user the option to try to create folder else select alternate existing folder and jumpscenario
			$folderDecision = MsgBox ( 4, "Directory to be created found","Click YES to jump to existing scenario folder, Click NO to try and create new folder name",5)
			;If 6 aka yes then jump to existing folder
			If $folderDecision = 6 Then
				;show tool tip of the currrent existing folder which wil be used
				$pos = MouseGetPos()
				ToolTip("Directory: " & $imgloc & " will now be used!",$pos[0],$pos[1],"",1,7)
				;wait quickly for 1 second
				Sleep(3000)
				;close up the tool tip
				ToolTip("")
				;ask for the highest existing image number
				HighestNumber()
				Return $imnum
			;else 7 aka no try to create the new folder name again
			ElseIf $folderDecision  = 7 Then
				CreateFolder ()
			EndIf
		EndIf
	EndIf
Return $imgloc
EndFunc
