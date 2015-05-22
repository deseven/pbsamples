#width = 800
#height = 600

Enumeration
  #wnd
  #canvas
  #toolbar
EndEnumeration

Enumeration buttons
  #add
  #delete
  #move
  #above
EndEnumeration

Enumeration type
  #circle
  #ellipse
  #box
  #roundbox
  #quadrilateral
EndEnumeration

Enumeration drawMode
  #normal
  #selection
EndEnumeration

selectedObject.l = -1
mode.b = #add
Define offsetX.w,offsetY.w,buttonPressed.b

Structure color
  r.a
  g.a
  b.a
  a.a
EndStructure

Structure obj
  type.b
  x.w
  y.w
  w.w
  h.w
  color.color
EndStructure

NewList all.obj()

Procedure isInRect(x.w,y.w,x1.w,y1.w,x2.w,y2.w)
  If x >= x1 And x <= x2 And y >= y1 And y <= y2
    ProcedureReturn #True
  EndIf
  ProcedureReturn #False
EndProcedure

Procedure createButtons()
  CreateImage(#add,16,16)
  StartDrawing(ImageOutput(#add))
  Box(0,0,16,16,$ffffff)
  Box(6,2,4,12,$00cc00)
  Box(2,6,12,4,$00cc00)
  StopDrawing()
  CreateImage(#delete,16,16)
  StartDrawing(ImageOutput(#delete))
  Box(0,0,16,16,$ffffff)
  Box(2,6,12,4,$0000cc)
  StopDrawing()
  CreateImage(#move,16,16)
  StartDrawing(ImageOutput(#move))
  Box(0,0,16,16,$ffffff)
  Box(6,2,4,12,$cc0000)
  Box(2,6,12,4,$cc0000)
  Box(4,2,8,1,$cc0000)
  Box(4,13,8,1,$cc0000)
  Box(2,4,1,8,$cc0000)
  Box(13,4,1,8,$cc0000)
  StopDrawing()
  CreateImage(#above,16,16)
  StartDrawing(ImageOutput(#above))
  Box(0,0,16,16,$ffffff)
  Box(6,2,8,8,$cc0000)
  Box(2,6,8,8,$00cc00)
  StopDrawing()
EndProcedure

Procedure addObj(type.b,x.w,y.w,w.w,h.w,r.a,g.a,b.a,a.a = 255)
  Shared all()
  AddElement(all())
  all()\type = type
  all()\x = x
  all()\y = y
  all()\w = w
  all()\h = h
  all()\color\r = r
  all()\color\g = g
  all()\color\b = b
  all()\color\a = a
EndProcedure

Macro addRandomObj()
  addObj(Random(3),Random(#width-50,50),Random(#height-ToolBarHeight(#toolbar)-50,50),Random(150,50),Random(150,50),Random(255,50),Random(255,50),Random(255,50),150)
EndMacro

Procedure Quadrilateral(x1,y1,x2,y2,x3,y3,x4,y4,color.l,fill.b = #True)
  LineXY(x1,y1,x2,y2,color)
  LineXY(x2,y2,x3,y3,color)
  LineXY(x3,y3,x4,y4,color)
  LineXY(x4,y4,x1,y1,color)
EndProcedure

Procedure drawObj(*obj.obj,drawMode.b = #normal)
  Protected color.l = RGBA(0,0,0,255)
  If drawMode = #normal
    DrawingMode(#PB_2DDrawing_AlphaBlend)
    color.l = RGBA(*obj\color\r,*obj\color\g,*obj\color\b,*obj\color\a)
  Else
    If mode = #move ;troubles
      DrawingMode(#PB_2DDrawing_Outlined)
    EndIf
  EndIf
  Select *obj\type
    Case #circle
      Circle(*obj\x+*obj\w/2,*obj\y+*obj\h/2,*obj\w/2,color)
    Case #ellipse
      Ellipse(*obj\x+*obj\w/2,*obj\y+*obj\h/2,*obj\w/2,*obj\h/2,color)
    Case #box
      Box(*obj\x,*obj\y,*obj\w,*obj\h,color)
    Case #roundbox
      RoundBox(*obj\x,*obj\y,*obj\w,*obj\h,*obj\h/10,*obj\h/10,color)
    Case #quadrilateral
      ;comming soon
    EndSelect
EndProcedure

Procedure drawAll()
  Shared all(),selectedObject.l
  StartDrawing(CanvasOutput(#canvas))
  DrawingMode(#PB_2DDrawing_AlphaBlend)
  Box(0,0,800,#height-ToolBarHeight(#toolbar),$ffffffff)
  ForEach all()
    drawObj(@all())
    If ListIndex(all()) = selectedObject
      drawObj(@all(),#PB_2DDrawing_Outlined)
    EndIf
  Next
  StopDrawing()
EndProcedure

OpenWindow(#wnd,#PB_Ignore,#PB_Ignore,#width,#height,"canvasElements",#PB_Window_ScreenCentered|#PB_Window_SystemMenu)
CreateToolBar(#toolbar,WindowID(#wnd))
createButtons()
ToolBarImageButton(#add,ImageID(#add))
ToolBarImageButton(#delete,ImageID(#delete))
ToolBarImageButton(#move,ImageID(#move))
ToolBarSeparator()
ToolBarImageButton(#above,ImageID(#above))
SetToolBarButtonState(#toolbar,#add,1)
CanvasGadget(#canvas,0,ToolBarHeight(#toolbar),#width,#height-ToolBarHeight(#toolbar))

For i = 0 To 10
  addRandomObj()
Next
drawAll()

Procedure canvasLMBD()
  Shared buttonPressed.b,mode.b,selectedObject.l,offsetX,offsetY,all()
  mX.w = GetGadgetAttribute(#canvas,#PB_Canvas_MouseX)
  mY.w = GetGadgetAttribute(#canvas,#PB_Canvas_MouseY)
  If Not buttonPressed
    buttonPressed = #True
    If mode = #add
      addRandomObj()
      SelectElement(all(),ListSize(all())-1)
      all()\x = mX - all()\w/2
      all()\y = mY - all()\h/2
      Debug "added element [" + Str(all()\type) + "," + Str(all()\x) + "," + Str(all()\y) + "," + Str(all()\w) + "," + Str(all()\h) + "]"
    Else
      For i = ListSize(all())-1 To 0 Step -1
        SelectElement(all(),i)
        If isInRect(mX,mY,all()\x,all()\y,all()\x+all()\w,all()\y+all()\h)
          Debug "touched element [" + Str(all()\type) + "," + Str(all()\x) + "," + Str(all()\y) + "," + Str(all()\w) + "," + Str(all()\h) + "]"
          offsetX = mX - all()\x
          offsetY = mY - all()\y
          If GetToolBarButtonState(#toolbar,#above) = 1
            MoveElement(all(),#PB_List_Last)
            selectedObject = ListSize(all())-1
          Else
            selectedObject = i
          EndIf
          If mode = #delete
            Debug "deleted element [" + Str(all()\type) + "," + Str(all()\x) + "," + Str(all()\y) + "," + Str(all()\w) + "," + Str(all()\h) + "]"
            DeleteElement(all())
          EndIf
          Break
        EndIf
      Next
    EndIf
    drawAll()
  EndIf
EndProcedure

Procedure canvasMove()
  Shared mode.b,buttonPressed.b,selectedObject.l,offsetX,offsetY,all()
  mX.w = GetGadgetAttribute(#canvas,#PB_Canvas_MouseX)
  mY.w = GetGadgetAttribute(#canvas,#PB_Canvas_MouseY)
  If buttonPressed And selectedObject > -1 And mode = #move
    SelectElement(all(),selectedObject)
    all()\x = mX - offsetX
    all()\y = mY - offsetY
    drawAll()
  EndIf
EndProcedure

Procedure canvasLMBU()
  Shared buttonPressed.b,selectedObject.l
  If buttonPressed
    buttonPressed = #False
    selectedObject = -1
    drawAll()
  EndIf
EndProcedure

BindGadgetEvent(#canvas,@canvasLMBD(),#PB_EventType_LeftButtonDown)
BindGadgetEvent(#canvas,@canvasMove(),#PB_EventType_MouseMove)
BindGadgetEvent(#canvas,@canvasLMBU(),#PB_EventType_LeftButtonUp)

Repeat
  ev = WaitWindowEvent(300)
  If ev = #PB_Event_Menu
    Select EventMenu()
      Case #add, #delete, #move
        EventGadget = EventGadget()
        For Gadget = #add To #move
          If Gadget = EventGadget
            SetToolBarButtonState(#toolbar,Gadget,1)
          Else
            SetToolBarButtonState(#toolbar,Gadget,0) ; unset the state of all other gadgets
          EndIf
        Next Gadget          
        mode = EventGadget 

      Case #above
        If GetToolBarButtonState(#toolbar,#above)
          SetToolBarButtonState(#toolbar, #above, 0)
        Else
          SetToolBarButtonState(#toolbar, #above, 1)
        EndIf
        
    EndSelect
  EndIf
Until ev = #PB_Event_CloseWindow
