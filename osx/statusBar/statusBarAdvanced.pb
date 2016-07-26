; in this example we're creating a complete app with status bar icon and the ability to turn it off or on

; compile it into .app bundle,
; run as a regular app

EnableExplicit

DataSection
  icon:
  IncludeBinary "icon.png"
EndDataSection

UsePNGImageDecoder()
CatchImage(0,?icon)
CocoaMessage(0,ImageID(0),"setTemplate:",#True)

; due to somehow strange PB behavior in managing windows we will use cocoa methods to hide or show our app
Define app.i = CocoaMessage(0,0,"NSApplication sharedApplication")

OpenWindow(0,#PB_Ignore,#PB_Ignore,170,40,"Advanced status bar example",#PB_Window_SystemMenu|#PB_Window_ScreenCentered)
StickyWindow(0,#True)
CheckBoxGadget(0,10,10,150,20,"enable status bar icon")
SetGadgetState(0,#PB_Checkbox_Checked)

Procedure advancedStatusBar()
  Static statusBar.i,statusItem.i
  Shared app.i
  Protected itemLength.CGFloat = 24
  If GetGadgetState(0) = #PB_Checkbox_Checked
    If Not statusBar
      statusBar = CocoaMessage(0,0,"NSStatusBar systemStatusBar")
    EndIf
    If Not statusItem
      statusItem = CocoaMessage(0,CocoaMessage(0,statusBar,"statusItemWithLength:",itemLength),"retain")
    EndIf
    CreatePopupMenu(0)
    MenuItem(0,"Window")
    MenuBar()
    MenuItem(1,"Quit")
    CocoaMessage(0,statusItem,"setHighlightMode:",@"YES")
    CocoaMessage(0,statusItem,"setLength:@",@itemLength)
    CocoaMessage(0,statusItem,"setImage:",ImageID(0))
    CocoaMessage(0,statusItem,"setMenu:",CocoaMessage(0,MenuID(0),"firstObject"))
  Else
    If statusBar And statusItem
      CocoaMessage(0,statusBar,"removeStatusItem:",statusItem)
    EndIf
    statusItem = 0
    If IsMenu(0) : FreeMenu(0) : EndIf
  EndIf
EndProcedure

advancedStatusBar()

Repeat
  Select WaitWindowEvent()
    Case #PB_Event_Gadget
      advancedStatusBar()
    Case #PB_Event_Menu
      Select EventMenu()
        Case 0
          CocoaMessage(0,app,"activateIgnoringOtherApps:",#YES)
        Case 1
          Break
      EndSelect
    Case #PB_Event_CloseWindow
      If GetGadgetState(0) = #PB_Checkbox_Unchecked
        MessageRequester("",~"You're closing the main window without active status bar icon.\n\nThe app will still run in background.\n\nYou'll be able to open the main window again if you have a valid .app by launching the same .app again.")
      EndIf
      CocoaMessage(0,app,"hide:")
  EndSelect
ForEver

; IDE Options = PureBasic 5.42 LTS (MacOS X - x64)
; Folding = -
; EnableUnicode
; EnableXP
; Executable = sba.app