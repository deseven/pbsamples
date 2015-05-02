
Procedure createGraphics()
  Protected symbolW.l,symbolH.l,symbolX.l,symbolY.l
  
  If Not LoadFont(#font,"Arial",piece-10,#PB_Font_HighQuality)
    ProcedureReturn #False
  EndIf
  
  CreateImage(#x,piece,piece)
  StartDrawing(ImageOutput(#x))
  DrawingFont(FontID(#font))
  symbolW = TextWidth(#xs)
  symbolH = TextHeight(#xs)
  symbolX = piece/2 - symbolW/2
  symbolY = piece/2 - symbolH/2
  DrawText(symbolX,symbolY,#xs,#sF,#sB)
  StopDrawing()
  
  CreateImage(#o,piece,piece)
  StartDrawing(ImageOutput(#o))
  DrawingFont(FontID(#font))
  symbolW = TextWidth(#os)
  symbolH = TextHeight(#os)
  symbolX = piece/2 - symbolW/2
  symbolY = piece/2 - symbolH/2
  DrawText(symbolX,symbolY,#os,#sF,#sB)
  StopDrawing()
  
  CreateImage(#grid,curWW,curWH)
  StartDrawing(ImageOutput(#grid))
  Box(piece,0,10,curWH,#gridF)
  Box(piece*2+10,0,10,curWH,#gridF)
  Box(0,piece,curWW,10,#gridF)
  Box(0,piece*2+10,curWW,10,#gridF)
  StopDrawing()
EndProcedure

Procedure init()
  ; maybe we'll do something else here later
  createGraphics()
  ProcedureReturn #True
EndProcedure

; x-platform messages
Procedure Message(message.s,type = #m_info)
  CompilerIf #PB_Compiler_OS = #PB_OS_Windows
    Select type
      Case #m_error
        MessageBox_(#wnd,message,#name,#MB_OK|#MB_ICONERROR)
      Case #m_question
        If Not MessageBox_(#wnd,message,#name,#MB_YESNO|#MB_ICONQUESTION) = #IDYES
          ProcedureReturn #False
        EndIf
      Default
        MessageBox_(#wnd,message,#name,#MB_OK|#MB_ICONINFORMATION)
    EndSelect
  CompilerElse
    Select type
      Case #m_question
        If Not MessageRequester(#name,message,#PB_MessageRequester_YesNo)
          ProcedureReturn #False
        EndIf
      Default
        MessageRequester(#name,message)
    EndSelect
  CompilerEndIf
  ProcedureReturn #True
EndProcedure

Procedure sizeWindow()
  deltaWX = Abs(curWW - WindowWidth(#wnd))
  deltaWY = Abs(curWH - WindowHeight(#wnd))
  If deltaWX > deltaWY
    curWW = WindowWidth(#wnd)
    curWH = WindowWidth(#wnd)
  Else
    curWW = WindowHeight(#wnd)
    curWH = WindowHeight(#wnd)
  EndIf
  ResizeWindow(#wnd,#PB_Ignore,#PB_Ignore,curWW,curWH)
  ResizeGadget(#wnd,#PB_Ignore,#PB_Ignore,curWW,curWH)
  piece = (curWW-20)/3
  createGraphics()
EndProcedure

Procedure drawXO()
  Protected i.b,cur.b
  For i = 0 To 2
    cur = XO(i)
    If cur : DrawImage(ImageID(cur),piece*i+10*i,0) : EndIf
  Next
  For i = 3 To 5
    cur = XO(i)
    If cur : DrawImage(ImageID(cur),piece*(i-3)+10*(i-3),piece+10) : EndIf
  Next
  For i = 6 To 8
    cur = XO(i)
    If cur : DrawImage(ImageID(cur),piece*(i-6)+10*(i-6),piece*2+20) : EndIf
  Next
EndProcedure

Procedure hit(x.l,y.l,w.l,h.l,xh.l,yh.l)
  If (xh >= x) And (xh < x+w) And (yh >= y) And (yh < y+h)
    ProcedureReturn #True
  EndIf
  ProcedureReturn #False
EndProcedure

Procedure insertXO(x.l,y.l)
  Protected i.b,insert.b
  For i=0 To 8
    If Not XO(i)
      Select i
        Case 0 To 2
          If hit(piece*i+10*i,0,piece,piece,x,y) : insert = #True : EndIf
        Case 3 To 5
          If hit(piece*(i-3)+10*(i-3),piece+10,piece,piece,x,y) : insert = #True : EndIf
        Case 6 To 8
          If hit(piece*(i-6)+10*(i-6),piece*2+20,piece,piece,x,y) : insert = #True : EndIf
      EndSelect
      If insert
        If currentTurn = #player1
          XO(i) = #x
        Else
          XO(i) = #o
        EndIf
        ProcedureReturn #True
      EndIf
    EndIf
  Next
  ProcedureReturn #False
EndProcedure

Procedure insertRandom()
  Protected i.b
  If Random(1)
    For i = 0 To 8
      If XO(i) = #none
        If currentTurn = #player1 : XO(i) = #x : Else : XO(i) = #o : EndIf
        Break
      EndIf
    Next
  Else
    For i = 8 To 0 Step -1
      If XO(i) = #none
        If currentTurn = #player1 : XO(i) = #x : Else : XO(i) = #o : EndIf
        Break
      EndIf
    Next
  EndIf
EndProcedure

Procedure startGame(mode.b = #sp)
  Protected i.b
  For i = 0 To 8 : XO(i) = #none : Next
  gameType = mode
  currentTurn = #player1
  If mode = #sp 
    If Random(1)
      humanControlled = #False
    EndIf
  EndIf
EndProcedure

Procedure winConditions()
  Protected i.b,winner.b
  ; draw
  For i = 0 To 8
    If XO(i) = #none
      Break
    ElseIf i = 8
      winner = #draw
    EndIf
  Next
  ; vertical
  For i = 0 To 2
    If XO(i) = XO(i+3) And XO(i+3) = XO(i+6) And XO(i) <> #none
      If XO(i) = #x : winner = #player1 : Else : winner = #player2 : EndIf
      Break
    EndIf
  Next
  ; horizontal
  For i = 0 To 8 Step 3
    If XO(i) = XO(i+1) And XO(i+1) = XO(i+2) And XO(i) <> #none
      If XO(i) = #x : winner = #player1 : Else : winner = #player2 : EndIf
      Break
    EndIf
  Next
  ; diagonal
  If XO(0) = XO(4) And XO(4) = XO(8) And XO(0) <> #none
    If XO(0) = #x : winner = #player1 : Else : winner = #player2 : EndIf
  EndIf
  If XO(2) = XO(4) And XO(4) = XO(6) And XO(2) <> #none
    If XO(2) = #x : winner = #player1 : Else : winner = #player2 : EndIf
  EndIf
  If winner = #player1
    Message("Player 1 wins!")
  ElseIf winner = #player2
    Message("Player 2 wins!")
  ElseIf winner = #draw
    Message("Draw!")
  Else
    ProcedureReturn #False
  EndIf
  ProcedureReturn #True
EndProcedure
