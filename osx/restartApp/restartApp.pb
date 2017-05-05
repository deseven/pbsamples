; restarting your app bundle when needed

Procedure restartApp(delay.i)
  Protected task = CocoaMessage(0,CocoaMessage(0,CocoaMessage(0,0,"NSTask alloc"),"init"),"autorelease")
  Protected args = CocoaMessage(0,0,"NSMutableArray arrayWithCapacity:",0)
  Protected appPath.s = PeekS(CocoaMessage(0,CocoaMessage(0,CocoaMessage(0,0,"NSBundle mainBundle"),"bundlePath"),"UTF8String"),-1,#PB_UTF8)
  Protected command.s = "sleep " + Str(delay) + ~"; open -a \"" + appPath + ~"\""
  CocoaMessage(0,args,"addObject:$",@"-c")
  CocoaMessage(0,args,"addObject:$",@command)
  CocoaMessage(0,task,"setLaunchPath:$",@"/bin/sh")
  CocoaMessage(0,task,"setArguments:",args)
  CocoaMessage(0,task,"launch")
  End
EndProcedure

OpenWindow(0,#PB_Ignore,#PB_Ignore,400,300,"restart app test",#PB_Window_SystemMenu|#PB_Window_ScreenCentered)
ButtonGadget(0,150,135,100,30,"restart")

Repeat
  ev = WaitWindowEvent()
  If ev = #PB_Event_Gadget And EventGadget() = 0
    restartApp(1)
  EndIf
Until ev = #PB_Event_CloseWindow
; IDE Options = PureBasic 5.60 (MacOS X - x86)
; Folding = -
; EnableXP