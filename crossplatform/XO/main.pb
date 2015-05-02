
EnableExplicit

IncludeFile "const.pb"

Global curWW.l = #wndW
Global curWH.l = #wndH
Global deltaWX.l,deltaWY.l
Global Dim XO.b(8)
Global piece.l = (curWW-20)/3
Global currentTurn = #player1
Global humanControlled = #True
Global gameType.b
Define ev.i

IncludeFile "proc.pb"

If Message("Do you want to play with the computer?",#m_question) : startGame(#sp) : Else : startGame(#mp) : EndIf
OpenWindow(#wnd,#PB_Ignore,#PB_Ignore,#wndW,#wndH,#name,#wndP)
CanvasGadget(#wnd,0,0,#wndW,#wndH)
If Not init() : Message("Can't init graphics",#m_error) : End 1 : EndIf

Repeat
  ev = WaitWindowEvent()
  If ev = #PB_Event_SizeWindow
    sizeWindow()
  EndIf
  
  If gameType = #sp And Not humanControlled
    insertRandom()
    If currentTurn = #player1 : currentTurn = #player2 : Else : currentTurn = #player1 : EndIf
    humanControlled = #True
  EndIf
  
  If EventType() = #PB_EventType_LeftButtonUp And (humanControlled Or gameType = #mp)
    If insertXO(GetGadgetAttribute(#wnd,#PB_Canvas_MouseX),GetGadgetAttribute(#wnd,#PB_Canvas_MouseY))
      If currentTurn = #player1 : currentTurn = #player2 : Else : currentTurn = #player1 : EndIf
      humanControlled = #False
    EndIf
  EndIf
  
  StartDrawing(CanvasOutput(#wnd))
  Box(0,0,curWW,curWH,$000000)
  DrawImage(ImageID(#grid),0,0)
  drawXO()
  StopDrawing()
  
  If winConditions()
    If Message("Do you want to start a new game?",#m_question) : startGame(gameType) : Else : End : EndIf
  EndIf
  
Until ev = #PB_Event_CloseWindow