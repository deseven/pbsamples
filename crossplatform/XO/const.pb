; XO constants

#name = "XO"

#wnd = 0
#wndW = 300
#wndH = 300
#wndP = #PB_Window_SystemMenu|#PB_Window_MinimizeGadget|#PB_Window_SizeGadget|#PB_Window_ScreenCentered

#font = 0
#xs = "X"
#os = "O"
#sW = 300
#sF = $ffffff
#sB = $000000
#gridF = $cccccc

#ext_x = "x.png"
#ext_o = "o.png"

Enumeration messageTypes
  #m_info
  #m_error
  #m_question
EndEnumeration

Enumeration XO
  #none
  #x
  #o
  #grid
  #cursor
EndEnumeration

Enumeration gameModes
  #sp
  #mp
EndEnumeration

Enumeration players
  #none
  #player1
  #player2
  #draw
EndEnumeration

Enumeration states
  #Normal
  #animation
EndEnumeration