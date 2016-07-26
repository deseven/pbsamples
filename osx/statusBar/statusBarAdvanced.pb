; in this example we're creating a complete app with status bar icon and the ability to turn it off or on

; if you'll turn off the status bar icon and close the main window
; you'll still be able to access it by running the same .app again

; compile it into .app bundle,
;
; edit the Info.plist like that:
; <key>LSUIElement</key>
;	<true/>
;
; run as a regular app

#NSWindowButtonMinimize = 1
#NSWindowButtonMaximize = 2

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

OpenWindow(0,#PB_Ignore,#PB_Ignore,170,40,"statusBar",#PB_Window_SystemMenu|#PB_Window_ScreenCentered)
StickyWindow(0,#True)
CheckBoxGadget(0,10,10,150,20,"enable status bar icon")
CocoaMessage(0,CocoaMessage(0,WindowID(0),"standardWindowButton:",#NSWindowButtonMinimize),"setHidden:",#YES)
CocoaMessage(0,CocoaMessage(0,WindowID(0),"standardWindowButton:",#NSWindowButtonMaximize),"setHidden:",#YES)

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
        MessageRequester("",~"You're closing the main window without active status bar icon.\n\nThe app will still run in background.\n\nYou'll be able to open the main window if you have a valid .app by launching the same .app again.")
      EndIf
      CocoaMessage(0,app,"hide:")
  EndSelect
ForEver

; IDE Options = PureBasic 5.42 LTS (MacOS X - x64)
; Folding = -
; EnableUnicode
; EnableXP
; Executable = sba.app