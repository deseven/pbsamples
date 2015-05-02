; simple example of how to create desktop-like shortcuts
; by using CanvasGadget

#myName = "Canvas PC"

Enumeration
  #wnd
  #canvas
  #pc
  #work
  #text
  #fun
  #mask
EndEnumeration

UsePNGImageDecoder()

CatchImage(#pc,?imgPC)
CatchImage(#work,?imgWork)
CatchImage(#text,?imgText)
CatchImage(#fun,?imgFun)
CatchImage(#mask,?imgMask)

OpenWindow(#wnd,#PB_Ignore,#PB_Ignore,800,600,#myName,#PB_Window_ScreenCentered|#PB_Window_SystemMenu)
CanvasGadget(#canvas,0,0,800,600)

Procedure isInRect(x.w,y.w,x1.w,y1.w,x2.w,y2.w)
  If x >= x1 And x <= x2 And y >= y1 And y <= y2
    ProcedureReturn #True
  EndIf
  ProcedureReturn #False
EndProcedure

Procedure drawPC(sel.b = 0)
  StartDrawing(CanvasOutput(#canvas))
  Box(0,0,800,600,$ffffff)
  DrawingMode(#PB_2DDrawing_AlphaBlend)
  DrawAlphaImage(ImageID(#pc),0,0)
  DrawAlphaImage(ImageID(#work),180,80)
  DrawAlphaImage(ImageID(#text),280,80)
  DrawAlphaImage(ImageID(#fun),380,80)
  If sel = #work
    DrawAlphaImage(ImageID(#mask),180,80)
  ElseIf sel = #text
    DrawAlphaImage(ImageID(#mask),280,80)
  ElseIf sel = #fun
    DrawAlphaImage(ImageID(#Mask),380,80)
  EndIf
  StopDrawing()
EndProcedure

drawPC()

selection.b = 0

Repeat
  ev = WindowEvent()
  If ev And EventGadget() = #canvas
    mX.w = GetGadgetAttribute(#canvas,#PB_Canvas_MouseX)
    mY.w = GetGadgetAttribute(#canvas,#PB_Canvas_MouseY)
    If EventType() = #PB_EventType_LeftClick
      If isInRect(mX,mY,180,80,260,180)
        selection = #work
      ElseIf isInRect(mX,mY,280,80,360,180)
        selection = #text
      ElseIf isInRect(mX,mY,380,80,460,180)
        selection = #fun
      Else
        selection = 0
      EndIf
    ElseIf EventType() = #PB_EventType_LeftDoubleClick
      Select selection
        Case #work
          MessageRequester(#myName,"Action1")
        Case #text
          MessageRequester(#myName,"Action2")
        Case #fun
          MessageRequester(#myName,"Action3")
      EndSelect
    EndIf
    drawPC(selection)
  Else
    Delay(10)
  EndIf
Until ev = #PB_Event_CloseWindow

DataSection
  imgPC:
  IncludeBinary "img/pc.png"
  imgWork:
  IncludeBinary "img/work.png"
  imgText:
  IncludeBinary "img/text.png"
  imgFun:
  IncludeBinary "img/fun.png"
  imgMask:
  IncludeBinary "img/mask.png"
EndDataSection
