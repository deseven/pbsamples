; filling resizable window with buttons

#max_buttons = 500
#buttonW = 80
#buttonH = 30
#buttonCap = "button"
#buttonOffset = 10

Procedure arrangeButtons()
  winW = WindowWidth(0)
  winH = WindowHeight(0)
  If WinW => #buttonW + #buttonOffset*2 And WinH => #buttonH + #buttonOffset*2
    horButtons = (WinW-10)/(#buttonW + #buttonOffset)
    verButtons = (WinH-10)/(#buttonH + #buttonOffset)
    For i=0 To verButtons-1
      For j=0 To horButtons-1
        curButton + 1
        If curButton > #max_buttons : Break 2 : EndIf
        buttonX = #buttonOffset + (#buttonW + #buttonOffset)*j
        buttonY = #buttonOffset + (#buttonH + #buttonOffset)*i
        If IsGadget(curButton)
          ResizeGadget(curButton,buttonX,buttonY,#PB_Ignore,#PB_Ignore)
        Else
          ButtonGadget(curButton,buttonX,buttonY,#buttonW,#buttonH,#buttonCap + Str(curButton))
        EndIf
      Next
    Next
    For i=curButton+1 To #max_buttons
      If IsGadget(i)
        FreeGadget(i)
      EndIf
    Next
  EndIf
EndProcedure

Procedure wndCallback(hWnd,uMsg,wParam,lParam)      
  If uMsg = #WM_SIZE
    arrangeButtons()
  EndIf
  ProcedureReturn #PB_ProcessPureBasicEvents
EndProcedure

OpenWindow(0,#PB_Ignore,#PB_Ignore,550,410,"arrangeButtons",#PB_Window_SystemMenu|#PB_Window_SizeGadget|#PB_Window_ScreenCentered|#PB_Window_MaximizeGadget)
CompilerIf #PB_Compiler_OS = #PB_OS_Windows : SetWindowCallback(@wndCallback(),wnd) : CompilerEndIf

arrangeButtons()
Repeat
  ev = WaitWindowEvent()
  If ev = #PB_Event_SizeWindow
    CompilerIf #PB_Compiler_OS <> #PB_OS_Windows : arrangeButtons() : CompilerEndIf
  EndIf
Until ev = #PB_Event_CloseWindow
