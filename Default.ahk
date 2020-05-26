;^ = Ctrl
;+ = Shift
;! = Alt
;# = Windows Key

SetTitleMatchMode RegEx ;
#SingleInstance, Force

;	Main Script


F13::									;G1

return

F14::									;G2

return

F15::									;G3

return

F16::									;G4	
return

F17::									;Log on to TSheets
If WinExist("TSheets ::"){
	WinActivate, TSheets
	WinWaitActive, TSheets
	Click, 122, 222
}
else{
	Run "https://citillctsheet.tsheets.com/page/login", , , pid
	WinWaitActive, TSheets
	WinWait, ahk_pid %pid%, , 7
	if (errorlevel) {
		;//it's good to handle timeouts in your code, so it doesn't get stuck...& you don't know why...
		if (WinExist("TSheets :: login")){
			WinActivate, TSheets :: login
			WinWait, ahk_pid %pid%, , 7
			if (errorlevel) {
				msgbox, 16, , WinWait Timeout waiting for TSheets login page. , 4
			}
			click, 1050, 433
		}
		;//msgbox, 16, , WinWait Timeout waiting for <type helpful description here> window
		else{
			msgbox, 16, , WinWait Timeout waiting for TSheets to open. , 4
		}
	}
}
return

F18::									;Log on to VPN
Run, "C:\Program Files\Fortinet\FortiClient\FortiClient.exe"
sleep, 4000
send {Tab}{Tab}{Tab}{Tab}{Tab}
sleep 300
send {Enter}
sleep 20000
WinActivate, Outlook
sleep 1000
click, 45, 225
sleep 1000
send {Enter}
sleep 1000
loop, 100
{
	send {Up}
}
sleep 1000
send {Down}
sleep 1000
click, 780, 300
sleep 10
click, 780, 300
sleep 1000
send ^c
WinActivate, FortiClient
send ^v
sleep 300
send {Enter}
sleep 300
WinActivate, Outlook
return

F19::MsgBox You pressed !
return

F20::MsgBox You pressed !
return

F21::MsgBox You pressed !
return

F22::MsgBox You pressed !
return

F23::MsgBox You pressed !
return

F24::MsgBox You pressed !
return

#o::							;Save and Run updates to Default.ahk script
send ^s
Run, C:\Users\rowdy\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Default.ahk
return

+!e:: 							;New Exspense_Report
Run, \\storage1.powerdom.net\docs\Employees\Rowdy\Exspense_Reports
FormatTime, date,, dd:MM:yyyy
sleep 1000
send z
send ^c
send ^+n
sleep 1000
send %date%
send {Enter}
sleep 1250
send {Enter}
sleep 1000
send ^v
sleep 2500
send {F2}
sleep 1000
send Milage log and expense report Rowdy Bedsaul{Space}%date%
sleep 1000
send {Enter}
sleep 1000
send {Enter}
sleep 1000
click 820, 80
return

;Keyboard Shortcut - CTRL + Alt + e			Toggle file extentions
^!e::
RegRead, HiddenFiles_Status, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideFileExt
If HiddenFiles_Status = 1
	RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideFileExt, 0
Else{
	RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideFileExt, 1)
}
send, {F5}
return

;Keyboard Shortcut - CTRL + Alt + H			Toggles hidden files/folders
^!h::
RegRead, HiddenFiles_Status, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden 
If HiddenFiles_Status = 2
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 1
Else
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 2
send {F5}
return

#t::							;TEST SCRIPT HERE

return

^+s::							;Snipping Tool to work like SnipIt in Win10
If WinExist("Snipping Tool")
{
	WinActivate, Snipping Tool
	WinWaitActive, Snipping Tool
	Send !n
	Send r
}
else
{
	Run %windir%\system32\SnippingTool.exe, , , pid
	WinActivate, Snipping Tool
	WinWait, ahk_pid %pid%, , 8
	if (errorlevel) {
		;//it's good to handle timeouts in your code, so it doesn't get stuck...& you don't know why...
		;//msgbox, 16, , WinWait Timeout waiting for <type helpful description here> window
		msgbox, 16, , WinWait Timeout waiting for Snipping Tool window
	}
	Send !n
	Send r
}
return

+Backspace:: 					;Shift Backspace to Delete
send {Delete}
return

+Delete:: 						;Shift Backspace to Delete
send {Backspace}
return

!w::							;awsd movement
send {up}
return

!a::							;awsd movement
send {left}
return

!s::							;awsd movement
send {down}
return

!d::							;awsd movement
send {right}
return

!+w::							;awsd movement
send +{up}
return

!+a::							;awsd movement
send +{left}
return

!+s::							;awsd movement
send +{down}
return

!+d::							;awsd movement
send +{right}
return

!^w::							;awsd movement
send ^{up}
return

!^a::							;awsd movement
send ^{left}
return

!^s::							;awsd movement
send ^{down}
return

!^d::							;awsd movement
send ^{right}
return

!+^w::							;awsd movement
send ^+{up}
return

!+^a::							;awsd movement
send ^+{left}
return

!+^s::							;awsd movement
send ^+{down}
return

!+^d::							;awsd movement
send ^+{right}
return

#z::Pause						;will pause a script while it is running, good if you accidently run the wrong one
return							;	and it starts to go crazy