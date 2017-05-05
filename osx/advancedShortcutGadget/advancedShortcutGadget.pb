; nice-looking (and working) shortcut gadget
; also shows how to handle inbound keypresses correctly

EnableExplicit

Dim keys.s($FF)
keys($00) = "A"
keys($01) = "S"
keys($02) = "D"
keys($03) = "F"
keys($04) = "H"
keys($05) = "G"
keys($06) = "Z"
keys($07) = "X"
keys($08) = "C"
keys($09) = "V"
keys($0B) = "B"
keys($0C) = "Q"
keys($0D) = "W"
keys($0E) = "E"
keys($0F) = "R"
keys($10) = "Y"
keys($11) = "T"
keys($12) = "1"
keys($13) = "2"
keys($14) = "3"
keys($15) = "4"
keys($16) = "6"
keys($17) = "5"
keys($18) = "="
keys($19) = "9"
keys($1A) = "7"
keys($1B) = "-"
keys($1C) = "8"
keys($1D) = "0"
keys($1E) = "]"
keys($1F) = "O"
keys($20) = "U"
keys($21) = "["
keys($22) = "I"
keys($23) = "P"
keys($25) = "L"
keys($26) = "J"
keys($27) = "'"
keys($28) = "K"
keys($29) = ";"
keys($2A) = ""
keys($2B) = ","
keys($2C) = "/"
keys($2D) = "N"
keys($2E) = "M"
keys($2F) = "."
keys($32) = "`"
keys($24) = "↩"
keys($30) = "Tab"
keys($31) = "Space"
keys($35) = "⎋"
keys($39) = "CAPS"
keys($7A) = "F1"
keys($78) = "F2"
keys($63) = "F3"
keys($76) = "F4"
keys($60) = "F5"
keys($61) = "F6"
keys($62) = "F7"
keys($64) = "F8"
keys($65) = "F9"
keys($6D) = "F10"
keys($67) = "F11"
keys($6F) = "F12"
keys($69) = "F13"
keys($6B) = "F14"
keys($71) = "F15"
keys($6A) = "F16"
keys($40) = "F17"
keys($4F) = "F18"
keys($50) = "F19"
keys($5A) = "F20"
keys($73) = "Home"
keys($77) = "End"
keys($74) = "PgUp"
keys($79) = "PgDown"
keys($0A) = "§"
keys($33) = "Del"

ImportC ""
  sel_registerName(str.p-ascii)
  class_addMethod(class, selector, imp, types.p-ascii)
EndImport

Define app.i = CocoaMessage(0,0,"NSApplication sharedApplication")
Define placeholder.s = "press keys"
Define activeSelector.i = -1

#pressInvite = "press to set"
#enterInvite = "enter keys"

OpenWindow(0,#PB_Ignore,#PB_Ignore,150,175,"Advanced shortcut gadget",#PB_Window_SystemMenu|#PB_Window_ScreenCentered)

ButtonGadget(0,25,25,100,30,#pressInvite)
ButtonGadget(1,25,75,100,30,#pressInvite)
ButtonGadget(2,25,125,100,30,#pressInvite)
CocoaMessage(0,GadgetID(0),"setBezelStyle:",10)
CocoaMessage(0,GadgetID(1),"setBezelStyle:",10)
CocoaMessage(0,GadgetID(2),"setBezelStyle:",10)

ButtonGadget(3,105,25,16,30,"✖")
CocoaMessage(0,GadgetID(3),"setButtonType:",2)
CocoaMessage(0,GadgetID(3),"setBezelStyle:",15)
CocoaMessage(0,GadgetID(3),"setBordered:",0)

ButtonGadget(4,105,75,16,30,"✖")
CocoaMessage(0,GadgetID(4),"setButtonType:",2)
CocoaMessage(0,GadgetID(4),"setBezelStyle:",15)
CocoaMessage(0,GadgetID(4),"setBordered:",0)

ButtonGadget(5,105,125,16,30,"✖")
CocoaMessage(0,GadgetID(5),"setButtonType:",2)
CocoaMessage(0,GadgetID(5),"setBezelStyle:",15)
CocoaMessage(0,GadgetID(5),"setBordered:",0)

HideGadget(3,#True)
HideGadget(4,#True)
HideGadget(5,#True)

Define previousHotkey.s = ""

Macro activateSelector(gadget)
  If activeSelector <> -1
    deactivateSelector()
  EndIf
  activeSelector = gadget
  Select activeSelector
    Case 0
      HideGadget(3,#True)
    Case 1
      HideGadget(4,#True)
    Case 2
      HideGadget(5,#True)
  EndSelect
  If GetGadgetText(activeSelector) <> #pressInvite
    previousHotkey = GetGadgetText(activeSelector)
  EndIf
  CocoaMessage(0,GadgetID(activeSelector),"highlight:",1)
  SetGadgetText(activeSelector,#enterInvite)
EndMacro

Macro deactivateSelector(hotkey = "")
  If activeSelector <> -1
    CocoaMessage(0,GadgetID(activeSelector),"highlight:",0)
    If Len(hotkey)
      SetGadgetText(activeSelector,hotkey)
    ElseIf Len(previousHotkey)
      SetGadgetText(activeSelector,previousHotkey)
    Else
      SetGadgetText(activeSelector,#pressInvite)
    EndIf
    If GetGadgetText(activeSelector) <> #pressInvite
      Select activeSelector
        Case 0
          HideGadget(3,#False)
        Case 1
          HideGadget(4,#False)
        Case 2
          HideGadget(5,#False)
      EndSelect
    EndIf
    activeSelector = -1
    previousHotkey = ""
  EndIf
EndMacro

ProcedureC keyHandler(sender,sel,event)
  Shared activeSelector
  Shared previousHotkey
  Shared keys()
  Protected result = #YES  
  Protected currentHtk.s
  Static currentMod.s
  If event
    Select CocoaMessage(0,event,"type")
      Case #NSKeyDown
        Define keyCode = CocoaMessage(0,event,"keyCode")
        If keyCode <= $FF
          If Len(keys(keyCode))
            currentHtk + keys(keyCode)
          EndIf
        EndIf
      Case #NSFlagsChanged
        currentMod = ""
        Protected modifierFlags = CocoaMessage(0, event, "modifierFlags")
        If modifierFlags & #NSShiftKeyMask     : currentMod + "⇧" : EndIf
        If modifierFlags & #NSControlKeyMask   : currentMod + "⌃" : EndIf
        If modifierFlags & #NSAlternateKeyMask : currentMod + "⌥" : EndIf
        If modifierFlags & #NSCommandKeyMask   : currentMod + "⌘" : EndIf
    EndSelect
    If activeSelector <> -1
      If Len(currentMod) = 0 And currentHtk = "⎋"
        deactivateSelector()
      ElseIf Len(currentMod) And Len(currentHtk)
        deactivateSelector(currentMod + currentHtk)
      ElseIf Len(currentMod)
        SetGadgetText(activeSelector,currentMod + currentHtk)
      Else
        SetGadgetText(activeSelector,#enterInvite)
      EndIf
    Else
      result = #NO
    EndIf
  EndIf
  ProcedureReturn result
EndProcedure

Define class = CocoaMessage(0,WindowID(0),"class")
Define selector = sel_registerName("performKeyEquivalent:") 
class_addMethod(class,selector,@keyHandler(),"v@:@")
selector = sel_registerName("flagsChanged:") 
class_addMethod(class,selector,@keyHandler(),"v@:@")

Repeat
  Define ev.i = WaitWindowEvent()
  If ev = #PB_Event_Gadget
    Select EventGadget()
      Case 0,1,2
        activateSelector(EventGadget())
      Case 3
        SetGadgetText(0,#pressInvite)
        HideGadget(3,#True)
      Case 4
        SetGadgetText(1,#pressInvite)
        HideGadget(4,#True)
      Case 5
        SetGadgetText(2,#pressInvite)
        HideGadget(5,#True)
      Default
        deactivateSelector()
    EndSelect
  EndIf
  If ev = #PB_Event_LeftClick
    deactivateSelector()
  EndIf
Until ev = #PB_Event_CloseWindow
; IDE Options = PureBasic 5.60 (MacOS X - x86)
; Folding = -
; EnableXP