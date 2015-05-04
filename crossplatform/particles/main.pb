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
;OpenWindow(1,0,0,DesktopW,DesktopH,"particles!",#PB_Window_BorderLess|#PB_Window_ScreenCentered|#PB_Window_Maximize)
;SetActiveWindow(1)
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

Procedure DoPhysics()
  
  For i=0 To numParticles
    
    ; adding some chaos
    If Random(10) > 2
      
      ; if the particle in the force radius
      If Pow(forceR,2) >= Pow(ParticleCoordsX(i)-mX,2) + Pow(ParticleCoordsY(i)-mY,2)
        
        ; if distance to the cursor is smaller by y-axis
        If Pow(mX-ParticleCoordsX(i),2) >= Pow(mY-ParticleCoordsY(i),2)
          ; right
          If mX > ParticleCoordsX(i)
            ; +2 or -2 pixels based on the force type
            If PointerMode = 0 : ParticleCoordsX(i)+2 : Else : ParticleCoordsX(i)-2 : EndIf
            If mY > ParticleCoordsY(i)
              If PointerMode = 0 : ParticleCoordsY(i)+1 : Else : ParticleCoordsY(i)-1 : EndIf
            ElseIf mY = ParticleCoordsY(i)
            Else
              If PointerMode = 0 : ParticleCoordsY(i)-1 : Else : ParticleCoordsY(i)+1 : EndIf
            EndIf
          ; nothing to do if we're already there
          ElseIf mX = ParticleCoordsX(i)
          ; left
          Else
            If PointerMode = 0 : ParticleCoordsX(i)-2 : Else : ParticleCoordsX(i)+2 : EndIf
            If mY > ParticleCoordsY(i)
              If PointerMode = 0 : ParticleCoordsY(i)+1 : Else : ParticleCoordsY(i)-1 : EndIf
            ElseIf mY = ParticleCoordsY(i)
            Else
              If PointerMode = 0 : ParticleCoordsY(i)-1 : Else : ParticleCoordsY(i)+1 : EndIf
            EndIf
          EndIf
        ; if distance to the cursor is smaller by x-axis
        Else 
          If mY > ParticleCoordsY(i)
            If PointerMode = 0 : ParticleCoordsY(i)+2 : Else : ParticleCoordsY(i)-2 : EndIf
            If mX > ParticleCoordsX(i)
              If PointerMode = 0 : ParticleCoordsX(i)+1 : Else : ParticleCoordsX(i)-1 : EndIf
            ElseIf mX = ParticleCoordsX(i)
            Else
              If PointerMode = 0 : ParticleCoordsX(i)-1 : Else : ParticleCoordsX(i)+1 : EndIf
            EndIf
          ElseIf mY = ParticleCoordsY(i)
          Else
            If PointerMode = 0 : ParticleCoordsY(i)-2 : Else : ParticleCoordsY(i)+2 : EndIf
            If mX > ParticleCoordsX(i)
              If PointerMode = 0 : ParticleCoordsX(i)+1 : Else : ParticleCoordsX(i)-1 : EndIf
            ElseIf mX = ParticleCoordsX(i)
            Else
              If PointerMode = 0 : ParticleCoordsX(i)-1 : Else : ParticleCoordsX(i)+1 : EndIf
            EndIf
          EndIf
        EndIf
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
    DrawText(4,DesktopH-40,"Free vmem: " + Str(Round(AvailableScreenMemory()/1024/1024,#PB_Round_Nearest)))
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
  
;   If IsScreenActive() = 0
;     OpenWindow (0,1,1,1,1, "particles!" , #PB_Window_Minimize|#PB_Window_BorderLess )
;     CloseScreen()
;     Repeat
;       Event=WaitWindowEvent() 
;       If Event = #WM_CLOSE
;         ExitProg = 1
;         Break
;       EndIf
;     Until Event = #WM_PAINT
;     
;     If ExitProg = 0
;       CloseWindow(0)
;       OpenScreen(DesktopW,DesktopH,DesktopD,"particles!",#PB_Screen_SmartSynchronization,DesktopF)
;     Else
;       End
;     EndIf
;   EndIf
  
Until KeyboardPushed(#PB_Key_Escape)