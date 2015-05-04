; window with perfectly rounded corners

; background image
UsePNGImageDecoder()
BgImg = CatchImage(#PB_Any,?Background)
BgImgID = ImageID(BgImg)
DataSection
  Background:
  IncludeBinary "bg.png"
EndDataSection

Global wnd = OpenWindow(#PB_Any,#PB_Ignore,#PB_Ignore,0,0,"realRoundedCorners",#PB_Window_BorderLess|#PB_Window_ScreenCentered|#PB_Window_Invisible)
Global wndID = WindowID(wnd)

; adding the WS_EX_LAYERED flag to the window
SetWindowLong_(wndID,#GWL_EXSTYLE,GetWindowLong_(wndID,#GWL_EXSTYLE)|#WS_EX_LAYERED)

; painting background with an alpha-channel
DC.l = CreateCompatibleDC_(#Null)
imgObject.l = SelectObject_(DC,BgImgID)
wndSize.Size
wndSize\cx = ImageWidth(BgImg)
wndSize\cy = ImageHeight(BgImg)
Point.Point
Blend.BLENDFUNCTION
Blend\SourceConstantAlpha = 255
Blend\AlphaFormat = 1
UpdateLayeredWindow_(wndID,0,0,@wndSize,DC,@Point,0,@Blend,2)
SelectObject_(DC,imgObject)
DeleteDC_(DC)

; layered window doesn't support gadget creation, so we are creating another child window inside of the first one, always on top
Global wnd2 = OpenWindow(#PB_Any,WindowX(wnd)+30,WindowY(wnd)+30,WindowWidth(wnd)-140,WindowHeight(wnd)-70,"rc_in",#PB_Window_BorderLess)
Global wnd2ID = WindowID(wnd2)
SetWindowLong_(wnd2ID,#GWL_HWNDPARENT,wndID)
SetWindowColor(wnd2,$ffffff)
StickyWindow(wnd2,1)

; adding callback to move the child window with the parent
Procedure wndCallback(hWnd,uMsg,wParam,lParam)     
   Select uMsg               
     Case #WM_SIZE, #WM_MOVE, #WM_PAINT
       ResizeWindow(wnd2,WindowX(wnd)+30,WindowY(wnd)+30,#PB_Ignore,#PB_Ignore)
     Case #WM_LBUTTONDOWN
       SendMessage_(wndID,#WM_NCLBUTTONDOWN,#HTCAPTION,0)
   EndSelect
   ProcedureReturn #PB_ProcessPureBasicEvents 
EndProcedure
SetWindowCallback(@wndCallback(),wnd)

HideWindow(wnd,0)

ButtonGadget(1,0,0,100,20,"exit")

Repeat
  ev = WaitWindowEvent(100)
  If EventGadget() = 1 And EventType() = #PB_EventType_LeftClick
    ev = #PB_Event_CloseWindow
  EndIf
Until ev = #PB_Event_CloseWindow