#cs ----------------------------------------------------------------------------

 AutoIt Version: v3.3.4.0
 Software Version: 1.9
 Date: Nov 20 2010
 Author:         Roy Yap

 Script Function:
	Initial function to save up the word doc and check it's size is <1MB or as specified


#ce ----------------------------------------------------------------------------

Global $docNum, $fileSize, $fileSizeDefined

Func WordDocSaveAndCheck()
	;initiate $docNum as 1
	$docNum = 1

	;Nov 20 moving the word save into the above image dumping to save up word doc and check the size <1MB or as specifieddDocSaveAndCheck()
	_WordDocSaveAs ($oDoc, $imgloc & "\" & $wdname & "_" & $docNum)

	;get the size of the word doc
	$fileSize = FileGetSize($imgloc & "\" & $wdname & "_" & $docNum & ".docx")

	;test if the file size is greater than 1MB or as specified
	If $fileSize > $fileSizeDefined Then
		$docNum = $docNum + 1
		;check on the logic about file name increment


EndFunc