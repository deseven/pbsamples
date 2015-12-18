; simple splash screen

; this is a procedure created by netmaestro
; it helps to use PNG images in winapi
; for more info, see http://www.forums.purebasic.com/english/viewtopic.php?f=12&t=52884
Procedure PreMultiply(image)
  StartDrawing(ImageOutput(image))
    DrawingMode(#PB_2DDrawing_AllChannels)
    For j=0 To ImageHeight(image)-1
      For i=0 To ImageWidth(image)-1
        color = Point(i,j)
        Plot(i,j, RGBA(Red(color)   & $FF * Alpha(color) & $FF / $FF,
                       Green(color) & $FF * Alpha(color) & $FF / $FF,
                       Blue(color)  & $FF * Alpha(color) & $FF / $FF,
                       Alpha(color)))
      Next
    Next
  StopDrawing()
EndProcedure

; loading our image
UsePNGImageDecoder()
If Not LoadImage(0,"splash.png")
  MessageRequester("Error!","Can't load image!")
  End 1
EndIf
PreMultiply(0)

; creating a new window, making it sticky and setting the WS_EX_LAYERED flag
OpenWindow(0,#PB_Ignore,#PB_Ignore,ImageWidth(0),ImageHeight(0),"",#PB_Window_ScreenCentered|#PB_Window_BorderLess|#PB_Window_NoGadgets|#PB_Window_NoActivate)
StickyWindow(0,#True)
SetWindowLongPtr_(WindowID(0),#GWL_EXSTYLE,GetWindowLongPtr_(WindowID(0),#GWL_EXSTYLE)|#WS_EX_LAYERED)

; drawing our background
hDC = StartDrawing(ImageOutput(0))
Define size.SIZE,cn.POINT,blend.BLENDFUNCTION
size\cx = ImageWidth(0)
size\cy = ImageHeight(0)
blend\SourceConstantAlpha = 255
blend\AlphaFormat = 1
UpdateLayeredWindow_(WindowID(0),0,0,@size,hDC,@cn,0,@blend,2)
StopDrawing()

; it's important to process window events
startTime = ElapsedMilliseconds()
Repeat
  ev = WaitWindowEvent(10)
Until ElapsedMilliseconds() - startTime > 3000
; IDE Options = PureBasic 5.40 LTS (Windows - x86)
; Folding = -
; EnableUnicode
; EnableXP