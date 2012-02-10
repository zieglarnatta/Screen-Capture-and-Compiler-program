#cs ----------------------------------------------------------------------------

 Software Version: 1.7
 AutoIt Version: 3.3.0.0
  Date: Aug 21 2009
 Author:         Roy Yap

 Script Function:
	Image Location function AutoIt script.
	Changes made: Adding capability to create folders on the fly

#ce ----------------------------------------------------------------------------

Global $imgloc, $skip, $termR

;module testing
;Imgloc ()
;#include <Retry.au3>
;#include <CreateFolder.au3>
;#include <HighestNumber.au3>
;MsgBox (0,"Module testing","$imgloc is " & $imgloc)

;ask for image location
Func Imgloc ()
	;check if folder needs to be created
	$skip = MsgBox(4,"Do you need a new folder?","Click YES for automatic folder creation, NO to specify existing folder")
	;if Yes aka 6, call the CreateFolder.au3
	If $skip = 6 Then
		CreateFolder()
		;check incase folder creation / selection was not done successfully send warning message
		If $imgloc = "" Then
			MsgBox ( 0, "Directory selection / creation not complete","Please create / select directory by using Alt+c to jump to create or jump to folder",6)
		EndIf
	;else if No aka 7, ask user to select the already existing folder
	ElseIf $skip = 7 Then
		Do
			$imgloc = FileSelectFolder("Location to save images in existing folder?", "", 4)
			If @error = 1 Then
				Retry ()
				If $termR = 6 Then
					MsgBox ( 0, "Please press Alt+c", "Please press Alt+c if you have exited from choosing / creating a valid folder for the first time as there will not be a defaulted folder at this point")
					ExitLoop
				ElseIf $termR = 7 Then
					$imgloc = ""
				EndIf
			EndIf
			;call and check if there already is an image in folder
			HighestNumber ()
		Until $imgloc <> ""
	EndIf

	;Nov 20 moved the word doc naming here
	;ask for word doc name, WordDocName.au3
	Wdname()

	Return $skip
	Return $imgloc
EndFunc

