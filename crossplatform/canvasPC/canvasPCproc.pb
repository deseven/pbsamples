#myName = "Canvas PC proc"

Enumeration
  #wnd
  #canvas
  #pc
  #work
  #text
  #drink
  #font
  #mask
EndEnumeration

CatchImage(#work,?imgWork)
CatchImage(#text,?imgText)
CatchImage(#drink,?imgDrink)

OpenWindow(#wnd,#PB_Ignore,#PB_Ignore,800,600,#myName,#PB_Window_ScreenCentered|#PB_Window_SystemMenu)
CanvasGadget(#canvas,0,0,800,600)
LoadFont(#font,"Arial",12,#PB_Font_HighQuality)

Procedure isInRect(x.w,y.w,x1.w,y1.w,x2.w,y2.w)
  If x >= x1 And x <= x2 And y >= y1 And y <= y2
    ProcedureReturn #True
  EndIf
  ProcedureReturn #False
EndProcedure

Procedure genTextures(mp.b = 1)
  CreateImage(#pc,800*mp,600*mp)
  StartDrawing(ImageOutput(#pc))
  BackColor($444444)
  FrontColor($ffffff)
  Box(0,0,800*mp,600*mp)
  FrontColor($000000)
  DrawingMode(#PB_2DDrawing_Gradient)
  LinearGradient(400*mp,0,400*mp,600*mp)
  
  ; display outer
  RoundBox(150*mp,20*mp,500*mp,300*mp,10*mp,10*mp)
  DrawingMode(#PB_2DDrawing_Default)
  
  ; bottom
  Line(150*mp,320*mp,500*mp,1)
  Line(100*mp,520*mp,600*mp,1)
  LineXY(150*mp,320*mp,100*mp,520*mp)
  LineXY(650*mp,320*mp,700*mp,520*mp)
  DrawingMode(#PB_2DDrawing_Gradient)
  FillArea(151*mp,321*mp,$000000)
  
  ; diplay inner
  DrawingMode(#PB_2DDrawing_Default)
  BackColor($666666)
  FrontColor($cccccc)
  LinearGradient(400*mp,0,400*mp,300*mp)
  RoundBox(160*mp,30*mp,480*mp,280*mp,10*mp,10*mp)
  FrontColor($333333)
  RoundBox(100*mp,510*mp,601*mp,30*mp,8*mp,8*mp)
  
  ; holes
  FrontColor($aaaaaa)
  Circle(120*mp,524*mp,6*mp)
  Circle(140*mp,524*mp,6*mp)
  Circle(160*mp,524*mp,6*mp)
  
  ; powerup indicator
  FrontColor($119911)
  Box(675*mp,516*mp,8*mp,24*mp)
  
  ; touchpad
  FrontColor($444444)
  Line(320*mp,440*mp,160*mp,1)
  Line(312*mp,490*mp,176*mp,1)
  LineXY(320*mp,440*mp,312*mp,490*mp)
  LineXY(480*mp,440*mp,488*mp,490*mp)
  FillArea(321*mp,441*mp,$444444)
  
  ; keyboard - todo keys
  Line(160*mp,330*mp,480*mp,1)
  Line(135*mp,430*mp,530*mp,1)
  LineXY(160*mp,330*mp,135*mp,430*mp)
  LineXY(640*mp,330*mp,665*mp,430*mp)
  FillArea(161*mp,331*mp,$444444)
  
  StopDrawing()
  
  If mp > 1 : ResizeImage(#pc,800,600,#PB_Image_Smooth) : EndIf
  
EndProcedure

Procedure drawPC(sel.b = 0)
  
  StartDrawing(CanvasOutput(#canvas))
  
  DrawImage(ImageID(#pc),0,0)
  
  ; work
  FrontColor($aaaaaa)
  DrawingMode(#PB_2DDrawing_Default)
  DrawingFont(FontID(#font))
  DrawImage(ImageID(#work),180,50)
  tW.w = TextWidth("Работа")
  DrawText(180+(40-tW/2),130,"Работа",$000000,$cccccc)
  
  ; text
  DrawImage(ImageID(#text),280,50)
  tW.w = TextWidth("Текст")
  DrawText(280+(40-tW/2),130,"Текст",$000000,$cccccc)
  
  ; drink
  DrawImage(ImageID(#drink),380,50)
  tW.w = TextWidth("Бухать")
  DrawText(380+(40-tW/2),130,"Бухать",$000000,$cccccc)
  
  DrawingMode(#PB_2DDrawing_AlphaBlend)
  FrontColor($99994444)
  If sel = #work
    RoundBox(180,50,80,100,10,10)
  EndIf
  If sel = #text
    RoundBox(280,50,80,100,10,10)
  EndIf
  If sel = #drink
    RoundBox(380,50,80,100,10,10)
  EndIf
  
  StopDrawing()
EndProcedure

genTextures(2)
drawPC()

selection.b = 0

Repeat
  ev = WindowEvent()
  If ev And EventGadget() = #canvas
    mX.w = GetGadgetAttribute(#canvas,#PB_Canvas_MouseX)
    mY.w = GetGadgetAttribute(#canvas,#PB_Canvas_MouseY)
    If EventType() = #PB_EventType_LeftClick
      If isInRect(mX,mY,180,50,260,150)
        selection = #work
      ElseIf isInRect(mX,mY,280,50,360,150)
        selection = #text
      ElseIf isInRect(mX,mY,380,50,460,150)
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
  imgWork:
  IncludeBinary "img/work.bmp"
  imgText:
  IncludeBinary "img/text.bmp"
  imgDrink:
  IncludeBinary "img/drink.bmp"
EndDataSection