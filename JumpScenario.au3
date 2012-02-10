#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.4.0
 Software Version: 1.8
 Date: May 29 2010
 Author:         Roy Yap

 Script Function:
	Initial version
	Changes: capability to check for image numbers

#ce ----------------------------------------------------------------------------


Global $jump, $skip

;module testing
;#include <HighestNumber.au3>
;#include <Retry.au3>
;#include <ImageLocation.au3>
;#include <CreateFolder.au3>
;JumpScenario()
;MsgBox (0,"Jump status","Jump YES = 6, NO = 7    $jump =  " & $jump)
;MsgBox ( 0, "$imgloc1, $imgloc2, $imgloc $skip","Location to create folder $imgloc1 = " & $imgloc1 & " ,     Folder Name $imgloc2 = " & $imgloc2 & " ,     Complete folder path $imgloc = " & $imgloc & " ,     Create new folder YES = 6, NO = 7    $skip = " & $skip & " ,     Highest Image Number    $imnum = " & $imnum)


Func JumpScenario()
	;confirm if they want to jump scenarios
	$jump = MsgBox(4,"Do you want to change folders?","Click YES to go an existing folder folder / create new folder, NO go back to screen capture mode")

		;if Yes aka 6, call the ImageLocation.au3
		If $jump = 6 Then
			Imgloc()
		ElseIf $jump = 7 Then
			$pos = MouseGetPos()
			ToolTip("Jump Folder mode exited successfully!",$pos[0],$pos[1],"",1,7)
			;wait quickly for 1 second
			Sleep(2000)
			;close up the tool tip
			ToolTip("")
		Endif
	Return $imnum
EndFunc
