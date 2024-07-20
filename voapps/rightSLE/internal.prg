// internal.prg
#INCLUDE "rightSLE.vh"

#USING System.Runtime.InteropServices

begin namespace rightSLE.Internal

/****************************************************************************/
[StructLayout( LayoutKind.Sequential ) ];
STRUCTURE winRect
	 EXPORT Left AS INT
	 EXPORT Top AS INT
	 EXPORT Right AS INT
	 EXPORT Bottom AS INT

	 CONSTRUCTOR( l AS INT, t AS INT, r AS INT, b AS INT )
		Left := l
		Top := t
		Right := r
		Bottom := b
		RETURN

	 METHOD Copy() AS winRect
		RETURN winRect{ Left, Top, Right, Bottom }
  END STRUCTURE

/****************************************************************************/
[StructLayout( LayoutKind.Sequential ) ];
STRUCTURE winSize
	 EXPORT x AS INT
	 EXPORT y AS INT

	 CONSTRUCTOR( cx AS INT, cy AS INT )
		x := cx
		y := cy
		RETURN

	 METHOD Copy() AS winSize
		RETURN winSize{ x, y }
  END STRUCTURE

/****************************************************************************/
[StructLayout( LayoutKind.Sequential ) ];
STRUCTURE winPoint
	EXPORT x AS INT
	EXPORT y AS INT
	 CONSTRUCTOR( cx AS INT, cy AS INT )
		x := cx
		y := cy
		RETURN

	 METHOD Copy() AS winPoint
		RETURN winPoint{ x, y }
END STRUCTURE
END NAMESPACE
