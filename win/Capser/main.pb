; Capser
; simple tool to write LiKe tHaT xD
; also shows how to send keys via winapi

#myname = "Capser"
#key_pressed = -32767
appname.s = GetFilePart(ProgramFilename())
Global n.INPUT
n\type = #INPUT_KEYBOARD
#num_stuff = 10
Global stuff.s = " ^__^ | *~~^__^~~* | :-* | xD | <3 | :) |!!1 |!?? |))) |. "

Procedure toggleCaps()
  n\ki\wVk = #VK_CAPITAL : n\ki\dwFlags = 0
  SendInput_(1,@n,SizeOf(n))
  n\ki\dwFlags = #KEYEVENTF_KEYUP
  SendInput_(1,@n,SizeOf(n))
EndProcedure

Procedure pasteStuff()
  SetClipboardText(StringField(stuff,Random(#num_stuff,1),"|"))
  n\ki\wVk = #VK_BACK : n\ki\dwFlags = 0
  SendInput_(1,@n,SizeOf(n))
  n\ki\dwFlags = #KEYEVENTF_KEYUP
  SendInput_(1,@n,SizeOf(n))
  n\ki\wVk = #VK_CONTROL : n\ki\dwFlags = 0
  SendInput_(1,@n,SizeOf(n))
  n\ki\wVk = #VK_V
  SendInput_(1,@n,SizeOf(n))
  n\ki\dwFlags = #KEYEVENTF_KEYUP
  SendInput_(1,@n,SizeOf(n))
  n\ki\wVk = #VK_CONTROL
  SendInput_(1,@n,SizeOf(n))
EndProcedure

Procedure keyPressed()
  If GetAsyncKeyState_(#VK_SPACE) = #key_pressed : ProcedureReturn 1 : EndIf
  For i=48 To 90
    If GetAsyncKeyState_(i) = #key_pressed : ProcedureReturn 2 : EndIf
  Next
  ProcedureReturn #False
EndProcedure

Procedure capser(dummy)
  Repeat
    Select keyPressed()
      Case 1
        If Random(100) > 40 : pasteStuff() : EndIf
      Case 2
        If Random(100) > 40 : toggleCaps() : EndIf
      Default
        Delay(10)
    EndSelect
  ForEver
EndProcedure

OpenWindow(0,1,1,1,1,#myname,#PB_Window_Invisible)
icon = ExtractIcon_(WindowID(0),appname,0)
AddSysTrayIcon(1,WindowID(0),icon)
SysTrayIconToolTip(1,#myname)
CreatePopupMenu(0)
MenuItem(1,#myname)
DisableMenuItem(0,1,1)
MenuBar()
MenuItem(2,"Exit")
capserThread = CreateThread(@capser(),dummy)

Repeat
  ev = WaitWindowEvent()
  If ev = #PB_Event_SysTray And EventType() = #PB_EventType_RightClick
    DisplayPopupMenu(0,WindowID(0))
  ElseIf ev = #PB_Event_Menu And EventMenu() = 2
    Break
  EndIf
Until ev = #PB_Event_CloseWindow

KillThread(capserThread)
