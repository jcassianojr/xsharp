class BasicChildWindow inherit ChildAppWindow
  protect oWndPen   as Pen
  protect oWndBrush as Brush

	

METHOD Expose(oExposeEvent) 

  SUPER:Expose(oExposeEvent)

	SELF:Draw(EllipseObject{Point{0,0}, SELF:CanvasArea:Size, oWndPen, oWndBrush})
	
	RETURN NIL
	

CONSTRUCTOR(oOwner, lManaged) 
  SUPER(oOwner, lManaged)

  oWndPen   := Pen{Color{COLORRED}}
  oWndBrush := Brush{Color{COLORBLUE}}

  return self

METHOD Resize(oResizeEvent) 
	LOCAL uRet AS USUAL

  uRet := SUPER:Resize(oResizeEvent)
  SELF:Repaint()

	RETURN uRet
	

END CLASS
class BasicShellWindow inherit SHELLWINDOW 


  //{{%UC%}} USER CODE STARTS HERE (do NOT remove this line)



method FileExit() 
	
	self:EndWindow()
	

method FileNew() 
  local oChild as BasicChildWindow

  oChild := BasicChildWindow{self, true}
  oChild:show()
  oChild:Caption := "New Child"

  return oChild


CONSTRUCTOR(oParent,uExtra)  

self:PreInit(oParent,uExtra)

SUPER(oParent,uExtra)

self:Caption := "Basic MDI Shell Window"
self:HyperLabel := HyperLabel{#BasicShellWindow,"Basic MDI Shell Window",NULL_STRING,NULL_STRING}
self:Menu := BASICMENU{}
self:Origin := Point{21, 428}
self:Size := Dimension{400, 300}

self:PostInit(oParent,uExtra)

return self


method WindowCascade() 
  self:Arrange(ARRANGECASCADE)


method WindowTile() 
  self:Arrange(ARRANGETILE)



END CLASS
