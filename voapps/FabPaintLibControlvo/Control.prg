//USING FabPaintLib
USING VO

//BEGIN NAMESPACE FabPaintLib.Control

	CLASS FabPaintLibCtrl INHERIT	CustomControl
		//p Image Manipulation
		//d This class encapsulate all services of the FabPaint Library
		//d For more info take a look at the DIBxxx() function or at the available demo applications.
		//d Any change to the image ( Creation, Resize, .... ) will trigger a notification to the owner.
		//d To catch this notification, the owner must provide a method called OnFabPaintLib with the following
		//d prototype :
		//d METHOD OnFabPaintLib( oFabPaintLibCtrl, synEvent ) CLASS TheOwnerOfTheControl
		//d <oFabPaintLibCtrl> is the FabPaintLibCtrl object that produce the notification itself
		//d <symEvent> is a SYMBOL value that indicate what change produce the notification.	
		// The Image to show
		PROTECT oImg	AS	FabPaintLib
		// Fit to Window ?
		PROTECT lFit		AS	LOGIC
		// Zoom Factor ( Positive for Zoom In, Negative for Zoom out )
		PROTECT r8Zoom		AS	REAL8
		//
		PROTECT liVertMax	AS	LONG
		PROTECT liHorzMax	AS	LONG
		PROTECT liHorzPos	AS	LONG
		PROTECT liVertPos	AS	LONG
		PROTECT liPrevVertPos	AS	LONG
		PROTECT liPrevHorzPos	AS	LONG
		//
		PROTECT lWantScrollBar	AS	LOGIC
		PROTECT lHasHorzScroll	AS	LOGIC
		PROTECT lHasVertScroll	AS	LOGIC
		//
		PROTECT lTrackSelection	AS	LOGIC
		PROTECT oPointer		AS	Pointer
		PROTECT lForceRedraw	AS	LOGIC
		
		
		METHOD __DrawBackgroundDC( hMemDC AS PTR ) AS VOID  
			//	LOCAL pRect	AS	_winRect
			// Error !!!!!!!!!!!!!!!!!
			// Should Be :
			LOCAL pRect	IS	_winRect
			LOCAL dwClr	AS	DWORD
			//
			GetClientRect( SELF:Handle(), @pRect )
			//	SetRect( @pRect, SELF:ImgX -1, SELF:ImgY -1, SELF:ImgX + SELF:ImgW + 1, SELF:ImgY + SELF:ImgH + 1 )
			IF SELF:IsValid
				dwClr := (DWORD)COLOR_3DFACE
			ELSE
				dwClr := (DWORD)COLOR_3DSHADOW
			ENDIF
			//
			FillRect( hMemDC, @pRect, PTR(_CAST, dwClr+1 ) )
			//
			RETURN
			
		METHOD __DrawControl( hMemDC AS PTR ) AS VOID  
			LOCAL rRealZoom	AS	REAL8
			LOCAL rcDst		IS	_winRect
			LOCAL rcSrc		IS	_winRect
			LOCAL rgbColor IS _WinRGBQUAD
			LOCAL dwClr	AS	DWORD
			//
			//self:__DrawBackgroundDC( hMemDC )
			//
			IF SELF:IsValid
				IF SELF:lFit
					SELF:oImg:ShowFitToWindowInDC( SELF:Handle(), hMemDC )
				ELSE
					//
					rRealZoom := SELF:__RealZoom
					//
					rcSrc:Left	    := 0
					rcSrc:Top	    := 0
					rcSrc:Right	    := (INT)SELF:oImg:Width
					rcSrc:Bottom    := (INT)SELF:oImg:Height
					//
					IF ( SELF:WantScrollBar )
						IF ( rRealZoom == 1 )
							rcDst:left	    := - SELF:liHorzPos
							rcDst:top	    := - SELF:liVertPos
							rcDst:right	    := SELF:oImg:Width - SELF:liHorzPos
							rcDst:Bottom    := SELF:oImg:Height - SELF:liVertPos
							//
							//				SELF:oImg:StretchExDC( hMemDC, @rcDst, @rcSrc )
							// Same As
							// self:oImg:ShowEx( self:Handle() , - self:liHorzPos ,  - self:liVertPos )
						ELSE
							// Change Size according to Zoom factor
							rcDst:left	    := - SELF:liHorzPos
							rcDst:top	    := - SELF:liVertPos
							rcDst:right	    := LONG(SELF:oImg:Width*rRealZoom) - SELF:liHorzPos
							rcDst:Bottom    := LONG(SELF:oImg:Height*rRealZoom) - SELF:liVertPos
							//
							//					SELF:oImg:StretchExDC( hMemDC, @rcDst, @rcSrc )
						ENDIF
					ELSE	
						//
						//self:oImg:Stretch( self:Handle(0), self:oImg:Width, self:oImg:Height, rRealZoom )
						//
						rcDst:left	    := 0
						rcDst:top	    := 0
						rcDst:right	    := LONG( rRealZoom * SELF:oImg:Width )
						rcDst:Bottom    := LONG( rRealZoom * SELF:oImg:Height )
						//
						//self:oImg:StretchExDC( hMemDC, @rcDst, @rcSrc )
					ENDIF
					//
					IF SELF:oImg:IsTransparent
						// 
						IF SELF:IsValid
							dwClr := GetSysColor( COLOR_BTNFACE )
						ELSE
							dwClr := GetSysColor( COLOR_3DSHADOW )
						ENDIF
						//
						rgbColor:rgbRed	:= LoByte( LoWord( dwClr ) )
						rgbColor:rgbGreen := HiByte( LoWord( dwClr ) )
						rgbColor:rgbBlue  := LoByte( HiWord( dwClr ) )
						//
						SELF:oImg:StretchExDrawDCBackground( hMemDC, @rcDst, @rcSrc, FALSE, @rgbColor, null_object )
					ELSE
						SELF:oImg:StretchExDrawDCBackground( hMemDC, @rcDst, @rcSrc, FALSE, NULL, null_object )
					ENDIF
					
				ENDIF
			ENDIF
			//
			RETURN
			
		PROTECT ACCESS __RealZoom AS REAL8  
			// Retrun the real zoom math to apply
			LOCAL rRealZoom	AS	REAL8
			//
			IF ( SELF:r8Zoom == 0 )
				rRealZoom := 1
			ELSEIF ( SELF:r8Zoom >= 0 )
				rRealZoom := SELF:r8Zoom
			ELSE
				rRealZoom := 1 / Abs( SELF:r8Zoom )
			ENDIF
			//
			RETURN rRealZoom
		
		PROTECT METHOD __ValidateScrollBars( ) AS VOID  
			LOCAL xWidth, yHeight AS LONG
			//
			xWidth 	:= SELF:ImageWidth
			yHeight := SELF:ImageHeight
			//	
			SELF:liHorzPos		:= 0
			SELF:liVertPos  	:= 0
			SELF:liHorzMax := 0
			SELF:liVertMax := 0
			// Need an Horizontal ScrollBar ?
			IF SELF:size:width < xWidth .and. ! SELF:ImageFit
				SELF:lHasHorzScroll := TRUE
			ELSE
				SELF:lHasHorzScroll := FALSE
			ENDIF	
			// Nedd a Vertical ScrollBar ?
			IF SELF:size:Height < yHeight .and.  ! SELF:ImageFit
				SELF:lHasVertScroll := TRUE		
			ELSE
				SELF:lHasVertScroll := FALSE		
			ENDIF
			//
			IF SELF:lHasHorzScroll .and. ! SELF:ImageFit
				IF SELF:lHasVertScroll		
					SELF:liHorzMax := ( xWidth - SELF:size:width ) + ;
					GetSystemMetrics ( SM_CXHSCROLL ) + ;
					GetSystemMetrics ( SM_CXEDGE ) * 2
				ELSE
					SELF:liHorzMax := ( xWidth - SELF:size:width ) + ;
					GetSystemMetrics ( SM_CXEDGE ) * 2
				ENDIF	
				ShowScrollBar ( SELF:handle() , SB_HORZ , TRUE )	
				SetScrollRange ( SELF:handle() , SB_HORZ , 1 , SELF:liHorzMax , TRUE )
				SetScrollPos ( SELF:handle() , SB_HORZ , 1 , TRUE  )
			ELSE
				ShowScrollBar ( SELF:handle() , SB_HORZ , FALSE )
			ENDIF	
			//	
			IF SELF:lHasVertScroll  .and.  ! SELF:ImageFit
				IF SELF:lHasHorzScroll
					SELF:liVertMax := (  yHeight - SELF:size:height ) + ;
					GetSystemMetrics ( SM_CYVSCROLL ) + ;
					GetSystemMetrics ( SM_CYEDGE ) * 2	
				ELSE
					SELF:liVertMax := (  yHeight - SELF:size:height ) + ;
					GetSystemMetrics ( SM_CYEDGE ) * 2
				ENDIF					
				ShowScrollBar ( SELF:handle() , SB_VERT , TRUE )	
				SetScrollRange ( SELF:handle() , SB_VERT, 1 , SELF:liVertMax , TRUE  )
				SetScrollPos ( SELF:handle() , SB_VERT , 1 , TRUE  )
			ELSE
				ShowScrollBar ( SELF:handle() , SB_VERT , FALSE )
			ENDIF
			SELF:Invalidate()
			RETURN 
			
		
		PROTECT METHOD __ValidateScrolling ( lHorz AS LOGIC ) AS VOID  
			//
			IF lHorz
				IF SELF:liHorzPos < 0
					SELF:liHorzPos := 0
				ELSEIF SELF:liHorzPos >  SELF:liHorzMax
					SELF:liHorzPos := SELF:liHorzMax
				ENDIF		
				SetScrollPos ( SELF:handle() , SB_HORZ , SELF:liHorzPos , TRUE  )
				SELF:Invalidate()
			ELSE
				IF SELF:liVertPos < 0
					SELF:liVertPos := 0
				ELSEIF SELF:liVertPos > SELF:liVertMax
					SELF:liVertPos := SELF:liVertMax
				ENDIF				
				SetScrollPos ( SELF:handle() , SB_VERT , SELF:liVertPos , TRUE  )
				SELF:Invalidate()
			ENDIF
			
			RETURN 
		
		ACCESS BackgroundColor AS Color  
			LOCAL oColor AS Color
			LOCAL RGB IS _WinRGBQUAD
			//
			oColor := NULL_OBJECT
			IF SELF:oImg:GetBackgroundColor( @RGB )
				//
				oColor := Color{ RGB:rgbRed, RGB:rgbGreen, RGB:rgbBlue }
			ENDIF 
			RETURN oColor
			
			
		ASSIGN BackgroundColor( oColor AS Color )   
			LOCAL RGB IS _WinRGBQUAD
			//
			RGB:rgbGreen := oColor:Green
			RGB:rgbRed := oColor:Red
			RGB:rgbBlue := oColor:Blue
			//
			IF SELF:oImg:GetBackgroundColor( @RGB )
				//
				RETURN 
			ENDIF 
			RETURN 
			
			
		METHOD Destroy() CLIPPER
			//
			IF ( SELF:oImg != NULL_OBJECT )
				SELF:oImg:Destroy()
			ENDIF
			//
			SUPER:Destroy()
			//
			RETURN SELF	
			
		METHOD Dispatch( oEvent ) 
			//
			IF ( oEvent:Message == WM_ERASEBKGND )
				SELF:eventReturnValue := 1L
				RETURN 1
			ENDIF
			IF !SELF:IsValid
				RETURN SUPER:Dispatch( oEvent )
			ENDIF
			//
			DO CASE
				CASE oEvent:message == WM_GETDLGCODE
					RETURN SELF:eventReturnValue := DLGC_WANTARROWS
				CASE oEvent:message == WM_SETCURSOR
					IF 	SELF:lHasVertScroll .or. SELF:lHasHorzScroll
						IF GetCapture () == SELF:handle()
							SetCursor ( SELF:oPointer:Handle()  )
							RETURN SELF:eventReturnValue := 1L
						ENDIF
					ENDIF
				CASE oEvent:message == WM_SIZE
					LOCAL pRect	IS	_winRect
					LOCAL w AS LONG
					LOCAL h AS LONG
					LOCAL d AS Dimension
					//
					GetClientRect( SELF:Owner:Handle(), @pRect )
					//
					w := pRect:right - pRect:left
					h := pRect:bottom - pRect:top
					//
					d := Dimension{ w, h}
					//
					SELF:Size := d
			ENDCASE
			//
			RETURN SUPER:Dispatch( oEvent )
			
		METHOD DrawBackground() 
			//	LOCAL pRect	AS	_winRect
			// Error !!!!!!!!!!!!!!!!!
			// Should Be :
			LOCAL pRect	IS	_winRect
			
			LOCAL hDC	AS	PTR
			LOCAL dwClr	AS	DWORD
			LOCAL struPS IS _WinPaintStruct
			// Set our DC
			hDC := BeginPaint(SELF:handle(), @struPS)
			//
			GetClientRect( SELF:Handle(), @pRect )
			//	SetRect( @pRect, SELF:ImgX -1, SELF:ImgY -1, SELF:ImgX + SELF:ImgW + 1, SELF:ImgY + SELF:ImgH + 1 )
			IF SELF:IsValid
				dwClr := (DWORD)COLOR_3DFACE
			ELSE
				dwClr := (DWORD)COLOR_3DSHADOW
			ENDIF
			FillRect( hDC, @pRect, PTR(_CAST, dwClr+1 ) )
			//
			EndPaint(SELF:handle(), @struPS)
			RETURN SELF
			
		METHOD Expose( oEvent ) 
			LOCAL clientRect IS _winRect
			LOCAL memDC AS PTR
			LOCAL hBmp AS PTR
			LOCAL hOldBmp AS PTR
			LOCAL iWidth AS LONG
			LOCAL iHeight AS LONG
			LOCAL myDC AS PTR
			// get a device context and create a compatible bitmap
			// actual drawin occurs on the bitmap to avoid flicker
			myDC := GetDC( SELF:Handle() )
			GetClientRect( SELF:Handle(), @clientRect )
			iWidth := clientRect:Right - clientRect:Left
			iHeight := clientRect:Bottom - clientRect:Top
			memDC := CreateCompatibleDC( myDC )
			hBmp := CreateCompatibleBitmap( myDC, iWidth, iHeight)
			hOldBmp := SelectObject( memDC, hBmp )
			//
			SELF:__DrawControl( memDC )
			//self:__DrawControl( myDC )
			//
			BitBlt( myDC, clientRect:Left, clientRect:Top, iWidth, iHeight, memDC, 0, 0, SRCCOPY)
			SelectObject( memDC, hOldBmp )
			DeleteObject( hBmp )
			DeleteDC( memDC )       
			ReleaseDC( SELF:Handle(), myDC )
			//
			RETURN SELF
			
		METHOD ForceDrawBackground () 
			SELF:lForceRedraw := TRUE
			RETURN SELF	
			
		METHOD HorizontalScroll( oE ) 
			LOCAL oEvent	AS	ScrollEvent
			LOCAL nScrollCode	AS	WORD
			//
			IF SELF:IsValid
				oEvent := oE
				//
				nScrollCode := LoWord ( oEvent:wParam )
				DO CASE
					CASE nScrollCode == SB_PAGEDOWN
						SELF:liHorzPos += 20
					CASE nScrollCode == SB_PAGEUP
						SELF:liHorzPos -= 20
					CASE nScrollCode == SB_LINEDOWN
						SELF:liHorzPos += 4
					CASE nScrollCode == SB_LINEUP
						SELF:liHorzPos -= 4
					CASE nScrollCode == SB_THUMBTRACK
						SELF:liHorzPos := HiWord ( oEvent:wParam )			
				ENDCASE	
				SELF:__ValidateScrolling ( TRUE )					
			ENDIF
			RETURN SELF
			
		ACCESS Image AS FabPaintLib  
			//r Give access to the FabPaintLib object linked to the control
			RETURN SELF:oImg
			
		ASSIGN Image( oNewImg AS FabPaintLib )   
			//p Set a new FabPaintLib object to be linked to the control
			IF ( oNewImg != NULL_OBJECT ) .AND. IsInstanceOfUsual( oNewImg, #FabPaintLib )
				//
				IF ( oNewImg:IsValid )
					IF ( SELF:oImg != NULL_OBJECT )
						SELF:oImg:Destroy()
					ENDIF
					//
					SELF:oImg := oNewImg
					SELF:ForceDrawBackground()
					IF SELF:WantScrollBar
						SELF:__ValidateScrollBars()
					ENDIF
					SELF:Invalidate()
				ENDIF
			ENDIF
			RETURN 
			
		ACCESS ImageFit AS LOGIC  
			//r A logical value indicating if the image is resized to fit the container (the control)
			RETURN SELF:lFit
			
		ASSIGN ImageFit( lNew AS LOGIC )   
			//p Set a logical value indicating if the image must be resized to fit the container (the control)
			SELF:lFit := lNew
			SELF:ForceDrawBackground()
			IF ( SELF:WantScrollBar )
				SELF:__ValidateScrollBars()
			ENDIF
			SELF:Invalidate()
			RETURN 
			
			
		ACCESS ImageHeight AS LONG  
			LOCAL nHeight AS LONG
			LOCAL rRealZoom	AS	REAL8
			//
			rRealZoom := SELF:__RealZoom
			//
			nHeight := LONG( SELF:oImg:height * rRealZoom )
			RETURN nHeight
			
		ACCESS ImageWidth AS LONG  
			LOCAL nWidth AS LONG
			LOCAL rRealZoom	AS	REAL8
			//
			rRealZoom := SELF:__RealZoom
			//
			nWidth := LONG( SELF:oImg:Width * rRealZoom )
			RETURN nWidth
			
		CONSTRUCTOR(oOwner, xID, oPoint, oDimension, kStyle, lDataAware) 
			//
			SUPER(oOwner, xID, oPoint, oDimension, kStyle, lDataAware)
			//
			SELF:oImg := FabPaintLib{ "" , SELF }
			SELF:r8Zoom := 1
			// Compatibility mode
			SELF:WantScrollBar := FALSE
			//
			SELF:oPointer := CurHand{}
			SELF:lForceRedraw := TRUE
			//
			RETURN 
			
		METHOD Invalidate() 
			//p Force the redraw of the image
			//
			InvalidateRect( SELF:Handle(0), NULL, TRUE )
			RETURN SELF
			
		ACCESS IsValid 
			//r A logical value indicating if the FabPaintLib object linked to the control is valid.
			LOCAL lOk	AS	LOGIC
			//
			lOk := FALSE
			IF ( SELF:oImg != NULL_OBJECT )
				lOk := SELF:oImg:IsValid
			ENDIF
			//
			RETURN lOk
			
		METHOD KeyDown( oE ) 
			LOCAL oEvent	AS	KeyEvent
			//
			IF SELF:IsValid
				oEvent := oE
				//
				DO CASE
					CASE oEvent:wParam == (DWORD)KeyArrowDown
						PostMessage ( SELF:handle() , WM_VSCROLL , MakeDWord ( SB_LINEDOWN , 0 ) , 0L )
					CASE oEvent:wParam == (DWORD)KeyArrowUp
						PostMessage ( SELF:handle() , WM_VSCROLL , MakeDWord ( SB_LINEUP , 0 ) , 0L )			
					CASE oEvent:wParam == (DWORD)KeyArrowLeft
						PostMessage ( SELF:handle() , WM_HSCROLL , MakeDWord ( SB_LINEUP , 0 ) , 0L )
					CASE oEvent:wParam == (DWORD)KeyArrowRight
						PostMessage ( SELF:handle() , WM_HSCROLL , MakeDWord ( SB_LINEDOWN , 0 ) , 0L )			
					CASE oEvent:wParam == (DWORD)KeyPageDown
						IF GetKeyState ( VK_SHIFT ) < 0
							PostMessage ( SELF:handle() , WM_HSCROLL , MakeDWord ( SB_PAGEDOWN , 0 ) , 0L )							
						ELSE				
							PostMessage ( SELF:handle() , WM_VSCROLL , MakeDWord ( SB_PAGEDOWN , 0 ) , 0L )			
						ENDIF				
					CASE oEvent:wParam == (DWORD)KeyPageUp		
						IF GetKeyState ( VK_SHIFT ) < 0	
							PostMessage ( SELF:handle() , WM_HSCROLL , MakeDWord ( SB_PAGEUP , 0 ) , 0L )						
						ELSE	
							PostMessage ( SELF:handle() , WM_VSCROLL , MakeDWord ( SB_PAGEUP , 0 ) , 0L )						
						ENDIF				
				ENDCASE			
			ENDIF
			RETURN SELF	
			
		METHOD MouseButtonDown( oE ) 
			LOCAL oEvent	AS	MouseEvent
			LOCAL x , y AS LONG
			//
			IF SELF:IsValid
				oEvent := oE
				IF oEvent:IsLeftButton
					IF SELF:TrackSelection .AND. oEvent:IsShiftButton
						//
						IF IsMethod ( SELF:owner , #OnTrackSelection )
							Send ( SELF:owner , #OnTrackSelection )
						ENDIF					
					ELSE			
						IF 	SELF:lHasVertScroll .or. SELF:lHasHorzScroll
							SetCapture ( SELF:handle() )
							PostMessage ( SELF:handle() , WM_SETCURSOR , 0 , 0L )
							//
							x := LONG(LoWord ( DWORD(oEvent:lParam )))
							y := LONG(HiWord ( DWORD(oEvent:lParam )))
							//	
							IF y >= 0 .and. y <= SELF:size:height
								SELF:liPrevVertPos := y
							ENDIF
							//
							IF x >= 0 .and. x <= SELF:size:width
								SELF:liPrevHorzPos := x
							ENDIF				
						ENDIF
					ENDIF
				ENDIF		
			ENDIF
			RETURN SELF
			
		METHOD MouseButtonUp( oE ) 
			LOCAL oEvent	AS	MouseEvent
			//
			IF SELF:IsValid
				oEvent := oE
				IF oEvent:IsLeftButton
					IF 	SELF:lHasVertScroll .or. SELF:lHasHorzScroll
						ReleaseCapture()
						PostMessage ( SELF:handle() , WM_SETCURSOR , 0 , 0L )	
					ENDIF
				ENDIF    
			ENDIF
			RETURN SELF
			
		METHOD MouseDrag( oE ) 
			LOCAL oEvent	AS	MouseEvent
			LOCAL x , y 	AS LONG
			LOCAL struPoint	IS _winPOINT
			//
			IF SELF:IsValid
				oEvent := oE
				IF 	SELF:lHasVertScroll .or. SELF:lHasHorzScroll
					IF oEvent:IsLeftButton
						GetCursorPos ( @struPoint )
						ScreenToClient ( SELF:handle() , @struPoint )
						//			
						x := struPoint:x
						y := struPoint:y
						//
						IF y >= 0 .and. y <= SELF:size:height
							IF y != SELF:liPrevVertPos
								IF y < SELF:liPrevVertPos
									SELF:liVertPos := SELF:liVertPos + (  SELF:liPrevVertPos - y )
								ELSE
									SELF:liVertPos := SELF:liVertPos - (  y - SELF:liPrevVertPos )					
								ENDIF
								SELF:liPrevVertPos := y							
								SELF:__ValidateScrolling ( FALSE )
							ENDIF
						ENDIF			
						//
						IF x >= 0 .and. x <= SELF:size:width
							IF x != SELF:liPrevHorzPos
								IF x < SELF:liPrevHorzPos
									SELF:liHorzPos := SELF:liHorzPos + (  SELF:liPrevHorzPos - x )
								ELSE
									SELF:liHorzPos := SELF:liHorzPos - ( x - SELF:liPrevHorzPos  )						
								ENDIF
								SELF:liPrevHorzPos := x
								SELF:__ValidateScrolling ( TRUE )					
							ENDIF				
						ENDIF				
					ENDIF			
				ENDIF	
			ENDIF
			RETURN SELF
			
		METHOD OnFabPaintLib( oFabPaintLib, symEvent ) 
			// Reflect Notification
			IF IsMethod( SELF:Owner, #OnFabPaintLib )
				Send( SELF:Owner, #OnFabPaintLib, SELF, symEvent )
			ENDIF
			//
			RETURN SELF
			
		ACCESS TrackSelection AS LOGIC  
			RETURN SELF:lTrackSelection
			
			
			
		ASSIGN TrackSelection ( lSet AS LOGIC )   
			SELF:lTrackSelection := lSet
			RETURN 
			
		METHOD VerticalScroll( oE ) 
			LOCAL oEvent	AS	ScrollEvent
			LOCAL nScrollCode	AS	WORD
			//
			IF SELF:IsValid
				oEvent := oE
				//
				nScrollCode := LoWord ( oEvent:wParam )
				DO CASE
					CASE nScrollCode == SB_PAGEDOWN
						SELF:liVertPos += 20
					CASE nScrollCode == SB_PAGEUP
						SELF:liVertPos -= 20
					CASE nScrollCode == SB_LINEDOWN
						SELF:liVertPos += 4
					CASE nScrollCode == SB_LINEUP
						SELF:liVertPos -= 4
					CASE nScrollCode == SB_THUMBTRACK
						SELF:liVertPos := HiWord ( oEvent:wParam )
				ENDCASE
				//
				SELF:__ValidateScrolling ( FALSE )						
			ENDIF	
			RETURN SELF		
			
		ACCESS WantScrollBar AS LOGIC  
			RETURN SELF:lWantScrollBar
			
			
			
		ASSIGN WantScrollBar ( lSet AS LOGIC )   
			//p Navigate through image using ScrollBars
			SELF:lWantScrollBar := lSet
			IF lSet
				SELF:r8Zoom := 0
				SELF:__ValidateScrollBars()
			ENDIF
			RETURN 
			
		ACCESS Zoom 
			//r The value of the user selected Zoom
			RETURN SELF:r8Zoom
			
		ASSIGN Zoom( r8NewZoom ) 
			//p Set the value of the user selected Zoom
			SELF:r8Zoom := r8NewZoom
			IF ( r8NewZoom != 0 ) .AND. SELF:lWantScrollBar
				SELF:__ValidateScrollBars()
			ENDIF
			SELF:Invalidate()
			RETURN 
			
	END CLASS
	
//END NAMESPACE 
