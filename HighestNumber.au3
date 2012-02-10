#cs ----------------------------------------------------------------------------

 Software Version: 1.9
 AutoIt Version: 3.3.4.0
  Date: Nov 20 2010
 Author:         Roy Yap

 Script Function:
	Cleaned up coding for unnecessary coding from the past

#ce ----------------------------------------------------------------------------

Global $imnum, $imnumcheck, $file, $imgloc

;module testing
;$imgloc = "C:\temp\regression018"
;HighestNumber ()

Func HighestNumber ()

		$search = FileFindFirstFile($imgloc & "\" & "*.jpg")

		; Check if the search was successful
		If $search = -1 Then
			;use mouse tool tip to inform the user that there's no image and will start with 1
			$pos = MouseGetPos()
			ToolTip("No images found, will start with 1.jpg",$pos[0],$pos[1],"",1,7)
			;wait quickly for 1 second
			Sleep(2000)
			;close up the tool tip
			ToolTip("")
			;set $imnum as 1
			$imnum = 1

		Else
			While 1
				$file = FileFindNextFile($search)
				If @error Then ExitLoop
				;module testing
				;MsgBox(4096, "File:", $file)

				;increment the file count and convert into number
				$imnum = Int(StringTrimRight ($file,4)) + 1
				;module testing
				;MsgBox(4096, "$imnum:", $imnum)
			WEnd
			; Close the search handle
			FileClose($search)

			;use mouse tool tip to inform the user that there's no image and will start with 1
				$pos = MouseGetPos()
				ToolTip("Some images found, will continue with " & $imnum & ".jpg",$pos[0],$pos[1],"",1,7)
				;wait quickly for 1 second
				Sleep(2000)
				;close up the tool tip
				ToolTip("")
		EndIf

;Sept 1 2009 Assign $imgcounte with $imnum as the current highest image numbering
$imgcounte = $imnum - 1
;return the variable values to main program
Return $imnum
Return $imgcounte
EndFunc
