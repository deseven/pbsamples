Enumeration
  #wnd
  #canvas
  #plus
  #minus
  #aNone
  #aCorner
  #aCenter
  #aSlideHor
  #aSlideVer
EndEnumeration

pointImg = 0
points.b = 5
newPoints.b = 5
isAnimating = #False

UseJPEGImageDecoder()
UsePNGImageDecoder()

Procedure drawPoints(points.b,animate.b = #False,aPlus.b = #True,aStep.b = 0)
  Shared pointImg
  StartDrawing(CanvasOutput(#canvas))
  Box(0,0,400,40,$ffffff)
  For i = 0 To points-1
    If i = points-1 And animate
      If aPlus
        If GetGadgetState(#aCorner)
          If IsImage(pointImg)
            DrawImage(ImageID(pointImg),i*40+5,5,3*aStep,3*aStep)
          Else
            Box(i*40+5,5,3*aStep,3*aStep,$ff0000)
          EndIf
        ElseIf GetGadgetState(#aCenter)
          If IsImage(pointImg)
            DrawImage(ImageID(pointImg),i*40+5+(30-3*aStep)/2,5+(30-3*aStep)/2,3*aStep,3*aStep)
          Else
            Box(i*40+5+(30-3*aStep)/2,5+(30-3*aStep)/2,3*aStep,3*aStep,RGB(255-aStep*25,255-aStep*25,255))
          EndIf
        ElseIf GetGadgetState(#aSlideHor)
          If IsImage(pointImg)
            DrawImage(ImageID(pointImg),i*40+5+(400-i*40+5)/aStep+1,5,30,30)
          Else
            Box(i*40+5+(400-i*40+5)/aStep+1,5,30,30,RGB(255-aStep*25,255-aStep*25,255))
          EndIf
        ElseIf GetGadgetState(#aSlideVer)
          If IsImage(pointImg)
            DrawImage(ImageID(pointImg),i*40+5,-25+aStep*3,30,30)
          Else
            Box(i*40+5,-25+aStep*3,30,30,RGB(255-aStep*25,255-aStep*25,255))
          EndIf
        EndIf
      Else
        If GetGadgetState(#aCorner)
          If IsImage(pointImg)
            DrawImage(ImageID(pointImg),i*40+5,5,30/aStep,30/aStep)
          Else
            Box(i*40+5,5,30/aStep,30/aStep,$ff0000)
          EndIf
        ElseIf GetGadgetState(#aCenter)
          If IsImage(pointImg)
            DrawImage(ImageID(pointImg),i*40+5+(30-30/aStep)/2,5+(30-30/aStep)/2,30/aStep,30/aStep)
          Else
            Box(i*40+5+(30-30/aStep)/2,5+(30-30/aStep)/2,30/aStep,30/aStep,RGB(aStep*25,aStep*25,255))
          EndIf
        ElseIf GetGadgetState(#aSlideHor)
          If IsImage(pointImg)
            DrawImage(ImageID(pointImg),400-(400-i*40+5)/aStep,5,30,30)
          Else
            Box(400-(400-i*40+5)/aStep,5,30,30,RGB(aStep*25,aStep*25,255))
          EndIf
        ElseIf GetGadgetState(#aSlideVer)
          If IsImage(pointImg)
            DrawImage(ImageID(pointImg),i*40+5,5+aStep*3,30,30)
          Else
            Box(i*40+5,5+aStep*3,30,30,RGB(aStep*25,aStep*25,255))
          EndIf
        EndIf
      EndIf
    ElseIf IsImage(pointImg)
      DrawImage(ImageID(pointImg),i*40+5,5,30,30)
    Else
      Box(i*40+5,5,30,30,$ff0000)
    EndIf
  Next
  StopDrawing()
EndProcedure

OpenWindow(#wnd,#PB_Ignore,#PB_Ignore,400,100,"Simple canvas indicator",#PB_Window_ScreenCentered|#PB_Window_SystemMenu)
CanvasGadget(#canvas,0,0,400,40)
ButtonGadget(#plus,0,40,200,40,"+1")
ButtonGadget(#minus,200,40,200,40,"-1")
OptionGadget(#aNone,5,80,75,20,"none")
OptionGadget(#aCorner,80,80,80,20,"corner")
OptionGadget(#aCenter,160,80,80,20,"center")
OptionGadget(#aSlideHor,240,80,80,20,"slide x")
OptionGadget(#aSlideVer,320,80,80,20,"slide y")
SetGadgetState(#aNone,#True)

drawPoints(points)

Repeat
  ev = WindowEvent()
  If ev
    If EventGadget() = #plus And points+1 <= 10 And EventType() = #PB_EventType_LeftClick
      newPoints = points + 1
      isAnimating = #True
    ElseIf EventGadget() = #minus And points-1 >= 0 And EventType() = #PB_EventType_LeftClick
      newPoints = points - 1
      isAnimating = #True
    ElseIf EventGadget() = #canvas And EventType() = #PB_EventType_LeftClick
      If IsImage(pointImg) : FreeImage(pointImg) : EndIf
      If LoadImage(pointImg,OpenFileRequester("Choose point image","","Image | *.bmp;*.jpg;*.png",0))
        If IsImage(pointImg) : ResizeImage(pointImg,30,30,#PB_Image_Smooth) : EndIf
      EndIf
      drawPoints(points)
    EndIf
  ElseIf isAnimating
    If aStep = 10
      isAnimating = #False
      aStep = 0
      points = newPoints
      drawPoints(points)
    Else
      aStep + 1
      If newPoints > points
        drawPoints(newPoints,#True,#True,aStep)
      Else
        drawPoints(points,#True,#False,aStep)
      EndIf
    EndIf
    Delay(15)
  Else
    Delay(10)
  EndIf
Until ev = #PB_Event_CloseWindow