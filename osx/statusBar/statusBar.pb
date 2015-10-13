; this one shows how to work with OS X status bar (tray) including dark mode support

UsePNGImageDecoder()
OpenWindow(0,0,0,0,0,"statusBar",#PB_Window_Invisible)
CreatePopupMenu(0)
MenuItem(0,"Exit")
If LoadImage(0,"icon.png")
  icon = ImageID(0)
Else
  MessageRequester("statusBar","Failed to load icon.")
  End
EndIf
CocoaMessage(0,icon,"setTemplate:",#True)

itemLength.CGFloat = 32
statusBar.i = CocoaMessage(0,0,"NSStatusBar systemStatusBar")
statusItem.i = CocoaMessage(0,CocoaMessage(0,statusBar,"statusItemWithLength:",-2),"retain")
CocoaMessage(0,statusItem,"setHighlightMode:",#True)
CocoaMessage(0,statusItem,"setLength:@",@itemLength)
CocoaMessage(0,statusItem,"setImage:",icon)
CocoaMessage(0,statusItem,"setMenu:",CocoaMessage(0,MenuID(0),"firstObject"))

Repeat
  ev = WaitWindowEvent()
  If ev = #PB_Event_Menu
    ev = #PB_Event_CloseWindow
  EndIf
Until ev = #PB_Event_CloseWindow