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
EndEnumeration

Enumeration type
  #circle
  #ellipse
  #box
  #roundbox
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

Structure object
  type.b
  x.w
  y.w
  w.w
  h.w
  color.color
EndStructure

NewList objects.object()

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
EndProcedure

Procedure toggleButton(new.i,old.i = -1)
  If GetToolBarButtonState(#toolbar,old) : SetToolBarButtonState(#toolbar,old,#False) : EndIf
  If Not GetToolBarButtonState(#toolbar,new) : SetToolBarButtonState(#toolbar,new,#True) : EndIf
EndProcedure

Procedure addObject(type.b,x.w,y.w,w.w,h.w,r.a,g.a,b.a,a.a = 255)
  Shared objects()
  AddElement(objects())
  objects()\type = type
  objects()\x = x
  objects()\y = y
  objects()\w = w
  objects()\h = h
  objects()\color\r = r
  objects()\color\g = g
  objects()\color\b = b
  objects()\color\a = a
EndProcedure

Macro addRandomObject()
  addObject(Random(3),Random(#width-50,50),Random(#height-ToolBarHeight(#toolbar)-50,50),Random(150,50),Random(150,50),Random(255,50),Random(255,50),Random(255,50),150)
EndMacro

Procedure Quadrilateral(x1,y1,x2,y2,x3,y3,x4,y4,color.l,fill.b = #True)
  LineXY(x1,y1,x2,y2,color)
  LineXY(x2,y2,x3,y3,color)
  LineXY(x3,y3,x4,y4,color)
  LineXY(x4,y4,x1,y1,color)
EndProcedure

Procedure drawObject(*object.object,drawMode.b = #normal)
  Protected color.l = RGBA(0,0,0,255)
  If drawMode = #normal
    DrawingMode(#PB_2DDrawing_AlphaBlend)
    color.l = RGBA(*object\color\r,*object\color\g,*object\color\b,*object\color\a)
  Else
    DrawingMode(#PB_2DDrawing_Outlined)
  EndIf
  Select *object\type
    Case #circle
      Circle(*object\x+*object\w/2,*object\y+*object\h/2,*object\w/2,color)
    Case #ellipse
      Ellipse(*object\x+*object\w/2,*object\y+*object\h/2,*object\w/2,*object\h/2,color)
    Case #box
      Box(*object\x,*object\y,*object\w,*object\h,color)
    Case #roundbox
      RoundBox(*object\x,*object\y,*object\w,*object\h,*object\h/10,*object\h/10,color)
    EndSelect
EndProcedure

Procedure drawObjects()
  Shared objects(),selectedObject.l
  StartDrawing(CanvasOutput(#canvas))
  DrawingMode(#PB_2DDrawing_AlphaBlend)
  Box(0,0,800,#height-ToolBarHeight(#toolbar),$ffffffff)
  ForEach objects()
    drawObject(@objects())
    If ListIndex(objects()) = selectedObject
      drawObject(@objects(),#PB_2DDrawing_Outlined)
    EndIf
  Next
  StopDrawing()
EndProcedure

OpenWindow(#wnd,#PB_Ignore,#PB_Ignore,#width,#height,"canvasElements",#PB_Window_ScreenCentered|#PB_Window_SystemMenu)
CreateToolBar(#toolbar,WindowID(#wnd))
createButtons()
ToolBarImageButton(#add,ImageID(#add),#PB_ToolBar_Toggle)
ToolBarImageButton(#delete,ImageID(#delete),#PB_ToolBar_Toggle)
ToolBarImageButton(#move,ImageID(#move),#PB_ToolBar_Toggle)
toggleButton(#add)
CanvasGadget(#canvas,0,ToolBarHeight(#toolbar),#width,#height-ToolBarHeight(#toolbar))

For i = 0 To 10
  addRandomObject()
Next
drawObjects()

Procedure canvasLMBD()
  Shared buttonPressed.b,mode.b,selectedObject.l,offsetX,offsetY,objects()
  mX.w = GetGadgetAttribute(#canvas,#PB_Canvas_MouseX)
  mY.w = GetGadgetAttribute(#canvas,#PB_Canvas_MouseY)
  If Not buttonPressed
    buttonPressed = #True
    If mode = #add
      addRandomObject()
      SelectElement(objects(),ListSize(objects())-1)
      objects()\x = mX - objects()\w/2
      objects()\y = mY - objects()\h/2
      Debug "added element [" + Str(objects()\type) + "," + Str(objects()\x) + "," + Str(objects()\y) + "," + Str(objects()\w) + "," + Str(objects()\h) + "]"
    Else
      For i = ListSize(objects())-1 To 0 Step -1
        SelectElement(objects(),i)
        If isInRect(mX,mY,objects()\x,objects()\y,objects()\x+objects()\w,objects()\y+objects()\h)
          Debug "touched element [" + Str(objects()\type) + "," + Str(objects()\x) + "," + Str(objects()\y) + "," + Str(objects()\w) + "," + Str(objects()\h) + "]"
          offsetX = mX - objects()\x
          offsetY = mY - objects()\y
          MoveElement(objects(),#PB_List_Last)
          selectedObject = ListSize(objects())-1
          If mode = #delete
            Debug "deleted element [" + Str(objects()\type) + "," + Str(objects()\x) + "," + Str(objects()\y) + "," + Str(objects()\w) + "," + Str(objects()\h) + "]"
            DeleteElement(objects())
          EndIf
          Break
        EndIf
      Next
    EndIf
    drawObjects()
  EndIf
EndProcedure

Procedure canvasMove()
  Shared mode.b,buttonPressed.b,selectedObject.l,offsetX,offsetY,objects()
  mX.w = GetGadgetAttribute(#canvas,#PB_Canvas_MouseX)
  mY.w = GetGadgetAttribute(#canvas,#PB_Canvas_MouseY)
  If buttonPressed And selectedObject > -1 And mode = #move
    SelectElement(objects(),selectedObject)
    objects()\x = mX - offsetX
    objects()\y = mY - offsetY
    drawObjects()
  EndIf
EndProcedure

Procedure canvasLMBU()
  Shared buttonPressed.b,selectedObject.l
  If buttonPressed
    buttonPressed = #False
    selectedObject = -1
    drawObjects()
  EndIf
EndProcedure

BindGadgetEvent(#canvas,@canvasLMBD(),#PB_EventType_LeftButtonDown)
BindGadgetEvent(#canvas,@canvasMove(),#PB_EventType_MouseMove)
BindGadgetEvent(#canvas,@canvasLMBU(),#PB_EventType_LeftButtonUp)

Repeat
  ev = WaitWindowEvent(300)
  If ev = #PB_Event_Menu
    Select EventMenu()
      Case #add
        toggleButton(#add,mode) : mode = #add
      Case #delete
        toggleButton(#delete,mode) : mode = #delete
      Case #move
        toggleButton(#move,mode) : mode = #move
    EndSelect
  EndIf
Until ev = #PB_Event_CloseWindow