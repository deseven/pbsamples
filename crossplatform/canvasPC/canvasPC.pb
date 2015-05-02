#myName = "Canvas PC"

Enumeration
  #wnd
  #canvas
  #pc
  #work
  #workSel
  #text
  #textSel
  #drink
  #drinkSel
EndEnumeration

UsePNGImageDecoder()

CatchImage(#pc,?imgPC)
CatchImage(#work,?imgWork)
CatchImage(#workSel,?imgWorkSel)
CatchImage(#text,?imgText)
CatchImage(#textSel,?imgTextSel)
CatchImage(#drink,?imgDrink)
CatchImage(#drinkSel,?imgDrinkSel)

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
  If sel = #work
    DrawAlphaImage(ImageID(#workSel),180,80)
  Else
    DrawAlphaImage(ImageID(#work),180,80)
  EndIf
  If sel = #text
    DrawAlphaImage(ImageID(#textSel),280,80)
  Else
    DrawAlphaImage(ImageID(#text),280,80)
  EndIf
  If sel = #drink
    DrawAlphaImage(ImageID(#drinkSel),380,80)
  Else
    DrawAlphaImage(ImageID(#drink),380,80)
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
        selection = #drink
      Else
        selection = 0
      EndIf
    ElseIf EventType() = #PB_EventType_LeftDoubleClick
      Select selection
        Case #work
          MessageRequester(#myName,"У вас нет работы, вы нищий бесполезный алкоголик.")
        Case #text
          MessageRequester(#myName,"Вы не умеете писать, зачем пытаться?")
        Case #drink
          MessageRequester(#myName,"Вы успешно нажрались, как обычно.")
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
  imgWorkSel:
  IncludeBinary "img/work_selected.png"
  imgText:
  IncludeBinary "img/text.png"
  imgTextSel:
  IncludeBinary "img/text_selected.png"
  imgDrink:
  IncludeBinary "img/drink.png"
  imgDrinkSel:
  IncludeBinary "img/drink_selected.png"
EndDataSection
