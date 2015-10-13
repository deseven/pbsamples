; very simple particle simulator

; getting display params
ExamineDesktops()
Global DesktopW = DesktopWidth(0)
Global DesktopH = DesktopHeight(0)
Global DesktopD = DesktopDepth(0)
Global DesktopF = DesktopFrequency(0)

; loading font to display info (optional)
If Not LoadFont(1,"Arial",12,#PB_Font_Bold)
  DisplayInfo = #False
Else
  DisplayInfo = #True
EndIf

; getting number of particles from program parameter
Global numParticles = Val(ProgramParameter())-1
If numParticles < 0
  numParticles = 9999
EndIf

If Not InitSprite() Or Not InitKeyboard() Or Not InitMouse() : End : EndIf
OpenScreen(DesktopW,DesktopH,DesktopD,"particles!",#PB_Screen_SmartSynchronization,DesktopF)

; random particle coords
Global Dim ParticleCoordsX(numParticles)
For i=0 To numParticles
  ParticleCoordsX(i) = Random(DesktopW)
Next

Global Dim ParticleCoordsY(numParticles)
For i=0 To numParticles
  ParticleCoordsY(i) = Random(DesktopH)
Next

Global mX,mY
Global PointerMode = 0
Global forceR = 200

Structure nextPoint
  x.i
  y.i
EndStructure

Define nextPoint.nextPoint

Procedure nextPoint(x1, y1, x2, y2)
  
  Shared nextPoint.nextPoint
  
  ; A general-purpose implementation of Bresenham's line algorithm.
  ; By Mark Feldman.
  
  ;deltax and deltay
  bdx = Abs(x2 - x1)
  bdy = Abs(y2 - y1)
  
  ;always 1
  bx2 = 1
  by2 = 1
  
  ;initialize vars based on which is the independent variable
  If bdx >= bdy ;x is independent variable
    bnp = bdx + 1
    bd1 = bdy << 1
    bdi = bd1 - bdx
    bd2 = (bdy - bdx) << 1
    bx1 = 1
    by1 = 0
  Else ;y is independent variable
    bnp = bdy + 1
    bd1 = bdx << 1
    bdi = bd1 - bdy
    bd2 = (bdx - bdy) << 1
    bx1 = 0
    by1 = 1
  EndIf
  
  ;make sure x and y move in the right directions
  If x1 > x2
    bx1 = -bx1
    bx2 = -bx2
  EndIf
  If y1 > y2
    by1 = -by1
    by2 = -by2
  EndIf
  
  ;start drawing at
  bxi = x1
  byi = y1
  
  bli = 2
  If bdi < 0
    bdi = bdi + bd1
    bxi = bxi + bx1
    byi = byi + by1
  Else
    bdi = bdi + bd2
    bxi = bxi + bx2
    byi = byi + by2
  EndIf
  
  nextPoint\x = bxi
  nextPoint\y = byi
  
EndProcedure

Procedure DoPhysics()
  Shared nextPoint.nextPoint
  For i=0 To numParticles
    
    ; adding some chaos
    If Random(10) > 2
      
      ; if the particle in the force radius
      If Pow(forceR,2) >= Pow(ParticleCoordsX(i)-mX,2) + Pow(ParticleCoordsY(i)-mY,2)
        If PointerMode = 0
          nextPoint(ParticleCoordsX(i),ParticleCoordsY(i),mX,mY)
        Else
          nextPoint(ParticleCoordsX(i),ParticleCoordsY(i),-mX,-mY)
        EndIf
        ParticleCoordsX(i) = nextPoint\x
        ParticleCoordsY(i) = nextPoint\y
;         ; if distance to the cursor is smaller by y-axis
;         If Pow(mX-ParticleCoordsX(i),2) >= Pow(mY-ParticleCoordsY(i),2)
;           ; right
;           If mX > ParticleCoordsX(i)
;             ; +2 or -2 pixels based on the force type
;             If PointerMode = 0 : ParticleCoordsX(i)+2 : Else : ParticleCoordsX(i)-2 : EndIf
;           ; nothing to do if we're already there
;           ElseIf mX = ParticleCoordsX(i)
;           ; left
;           Else
;             If PointerMode = 0 : ParticleCoordsX(i)-2 : Else : ParticleCoordsX(i)+2 : EndIf
;           EndIf
;         ; if distance to the cursor is smaller by x-axis
;         Else 
;           If mY > ParticleCoordsY(i)
;             If PointerMode = 0 : ParticleCoordsY(i)+2 : Else : ParticleCoordsY(i)-2 : EndIf
;           ElseIf mY = ParticleCoordsY(i)
;           Else
;             If PointerMode = 0 : ParticleCoordsY(i)-2 : Else : ParticleCoordsY(i)+2 : EndIf
;           EndIf
;         EndIf
      EndIf
    EndIf
    
    ; random fluctuations
    mov = 1
    Select Random(8)
      Case 0:
        ParticleCoordsX(i)+mov
      Case 1:
        ParticleCoordsY(i)+mov
      Case 2:
        ParticleCoordsX(i)-mov
      Case 3:
        ParticleCoordsY(i)-mov
      Case 4:
        ParticleCoordsX(i)+mov
        ParticleCoordsY(i)+mov
      Case 5:
        ParticleCoordsX(i)-mov
        ParticleCoordsY(i)-mov
      Case 6:
        ParticleCoordsX(i)+mov
        ParticleCoordsY(i)-mov
      Case 7:
        ParticleCoordsX(i)-mov
        ParticleCoordsY(i)+mov
    EndSelect
    
  Next
EndProcedure

; getting time to calculate FPS
CurTime = ElapsedMilliseconds()

; main cycle
Repeat
  mX = MouseX()
  mY = MouseY()
  
  ClearScreen($000000)
  
  DoPhysics()
  
  activeParticles = 0
  
  ; displaying particles by their coords
  activeParticles = 0
  StartDrawing(ScreenOutput())
  For i=0 To numParticles
    If ParticleCoordsX(i) < DesktopW And ParticleCoordsY(i) < DesktopH And ParticleCoordsX(i) => 0 And ParticleCoordsY(i) => 0
      ;Debug ParticleCoordsX(i)
      ;Debug ParticleCoordsY(i)
      Plot(ParticleCoordsX(i),ParticleCoordsY(i),$ffffff)
      activeParticles + 1
    EndIf
  Next
  
  mX - 1
  mY - 1
  
  For x=0 To 4
    For y=0 To 4
      If mX+x < DesktopW And mY+y < DesktopH And mX+x => 0 And mY+y => 0
        Plot(mX+x,mY+y,$aaaaaa)
      EndIf
    Next
  Next
  
  ; displaying info
  If DisplayInfo
    FPSCounter + 1
    DrawingMode(#PB_2DDrawing_Transparent)
    DrawingFont(FontID(1))
    DrawText(4,DesktopH-60,"FPS: " + Str(FPS))
    ;DrawText(4,DesktopH-40,"Free vmem: " + Str(Round(AvailableScreenMemory()/1024/1024,#PB_Round_Nearest)))
    DrawText(4,DesktopH-20,"Display: " + Str(DesktopW) + "x" + Str(DesktopH) + "@" + Str(DesktopD) + "bpp")
    If ElapsedMilliseconds() - CurTime >= 1000
      CurTime = ElapsedMilliseconds()
      FPS = FPSCounter
      FPSCounter = 0
    EndIf
    DrawText(4,4,"Particles: " + Str(activeParticles))
    If PointerMode = 0
      DrawText(4,24,"Pointer mode (m): attraction")
    Else
      DrawText(4,24,"Pointer mode (m): repulsion")
    EndIf
    DrawText(4,44,"Force radius (-/+): " + Str(forceR))
  EndIf
  
  StopDrawing()
  
  ExamineKeyboard()
  ExamineMouse()
  
  If KeyboardReleased(#PB_Key_M)
    If PointerMode = 0
      PointerMode = 1
    Else
      PointerMode = 0
    EndIf
  EndIf
  
  If KeyboardPushed(#PB_Key_Equals)
    forceR + 1
  EndIf
  
  If KeyboardPushed(#PB_Key_Minus)
    If forceR - 1 => 0
      forceR - 1
    EndIf
  EndIf
  
  FlipBuffers()
  
Until KeyboardPushed(#PB_Key_Escape)
; IDE Options = PureBasic 5.40 LTS Beta 5 (Windows - x86)
; EnableUnicode
; EnableXP
; EnableBuildCount = 0