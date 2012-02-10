#include <Date.au3>
$pos = WinGetPos("[active]")
;$pos = MouseGetPos()
				ToolTip("Timestamp:" &_NowDate() & _NowTime(),$pos[0]+500,$pos[1]+10,"",1,6)
				;wait quickly for 1 second
				Sleep(2000)
				;close up the tool tip
				ToolTip("")
