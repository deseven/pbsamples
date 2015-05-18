Enumeration
  #wnd
  #canvas
EndEnumeration

Enumeration type
  #circle
  #box
EndEnumeration

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

Procedure drawObjects()
  Shared objects()
  StartDrawing(CanvasOutput(#canvas))
  DrawingMode(#PB_2DDrawing_AlphaBlend)
  Box(0,0,800,600,$ffffffff)
  ForEach objects()
    Select objects()\type
      Case #box
        Box(objects()\x,objects()\y,objects()\w,objects()\h,RGBA(objects()\color\r,objects()\color\g,objects()\color\b,objects()\color\a))
      Case #circle
        Ellipse(objects()\x+objects()\w/2,objects()\y+objects()\h/2,objects()\w/2,objects()\h/2,RGBA(objects()\color\r,objects()\color\g,objects()\color\b,objects()\color\a))
    EndSelect
  Next
  StopDrawing()
EndProcedure

OpenWindow(#wnd,#PB_Ignore,#PB_Ignore,800,600,"canvasElements",#PB_Window_ScreenCentered|#PB_Window_SystemMenu)
CanvasGadget(#canvas,0,0,800,600)

For i = 0 To 100
  addObject(Random(1),Random(800),Random(600),Random(100,10),Random(100,10),Random(255,50),Random(255,50),Random(255,50),150)
Next

selectedObject.w = -1
drawObjects()

Repeat
  ev = WaitWindowEvent(300)
  If ev = #PB_Event_Gadget And EventGadget() = #canvas
    mX.w = GetGadgetAttribute(#canvas,#PB_Canvas_MouseX)
    mY.w = GetGadgetAttribute(#canvas,#PB_Canvas_MouseY)
    If EventType() = #PB_EventType_LeftButtonDown And Not buttonPressed
      buttonPressed = #True
      For i = ListSize(objects())-1 To 0 Step -1
        SelectElement(objects(),i)
        If isInRect(mX,mY,objects()\x,objects()\y,objects()\x+objects()\w,objects()\y+objects()\h)
          offsetX = mX - objects()\x
          offsetY = mY - objects()\y
          MoveElement(objects(),#PB_List_Last)
          selectedObject = ListSize(objects())-1
          Break
        EndIf
      Next
    ElseIf EventType() = #PB_EventType_MouseMove And buttonPressed And selectedObject > -1
      SelectElement(objects(),selectedObject)
      objects()\x = mX - offsetX
      objects()\y = mY - offsetY
    ElseIf EventType() = #PB_EventType_LeftButtonUp And buttonPressed
      buttonPressed = #False
      selectedObject = -1
    EndIf
    drawObjects()
  EndIf
Until ev = #PB_Event_CloseWindow