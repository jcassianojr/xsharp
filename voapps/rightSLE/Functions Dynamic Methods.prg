// Functions.prg
#USING System.Reflection
#USING System.Globalization

function CheckMethod(o as Object, cName as String) as logic
	LOCAL lResult       AS Logic
	local t             AS Type
	LOCAL oMethodInfo 	AS MethodInfo    
	IF o<> null
		t := o:GetType()
		try
			oMethodInfo := t:GetMethod(cName, (BindingFlags.Public | (BindingFlags.Instance | BindingFlags.IgnoreCase)))
			IF oMethodInfo == null
				lResult := FALSE
			ELSE
				lResult := TRUE
			ENDIF
				
		catch ex AS AmbiguousMatchException 
			lResult := TRUE
		end try
	ELSE
		lResult := FALSE
	ENDIF
	return lResult
Function RunDynamicMethod(o as object,cMethodName as string,oList as Object[]) as Object
	LOCAL oType 		    AS Type
	LOCAL oInstance 	    AS OBJECT
	LOCAL oResult           AS Object
	LOCAL oMethodInfo 	    AS MethodInfo
	LOCAL param             AS ParameterInfo[]
	LOCAL userParameters    AS OBJECT[]
	LOCAL i                 AS LONG
	local nListLen          AS LONG
	try
		userParameters  := null
		oResult         := null
		if o<> null
			oType 			:= o:GetType()
			oMethodInfo 	:=  oType:GetMethod(cMethodName,(BindingFlags.Public | (BindingFlags.Instance | BindingFlags.IgnoreCase)))
			if oMethodInfo <> null
				param := oMethodInfo:GetParameters()
				IF param:Length != oList:Length
					throw SystemException{omethodInfo:DeclaringType:ToString() + "." + omethodInfo:Name + ": Method Signatures Don't Match!"}
				ENDIF

				// Ok, can we convert the strings to the right types?
				nListLen        := oList:Length
				userParameters  := Object[]{nListLen}
				FOR i := 0 upto nListLen - 1
					try
					 IF param[i]:ParameterType:IsAssignableFrom(oList[i]:GetType())
						userParameters[i]   := oList[i]
					  ELSE
						userParameters[i]   := Convert.ChangeType(oList[i],param[i]:ParameterType, CultureInfo.InvariantCulture)
					  ENDIF                  
					catch e AS Exception
						throw SystemException{omethodInfo:DeclaringType:ToString() + "." + omethodInfo:Name + ": Argument Conversion Failed", e}
					end try
				NEXT                              
				
				// see if we need to create an instance                                
				IF !oMethodInfo:IsStatic
				   oInstance 		:= o    // Activator.CreateInstance(oType)
				ELSE
					oInstance       := NULL
				ENDIF
				oResult := oMethodInfo:Invoke(oInstance , userParameters)
			endif
		ENDIF
	catch ex as Exception
		throw SystemException{"Error invoking Method"}
	end try
	Return oResult
Function CreateClass(cMethodName as string) as Object
	LOCAL oAssembly         As Assembly[]
	LOCAL ExportedTypes     AS Type[]
	LOCAL oType 		    AS Type    
	LOCAL oInstance 	    AS OBJECT
	LOCAL j                 AS Long
	LOCAL i                 AS LONG
	try
		oInstance       := null
		oAssembly 		:= AppDomain.CurrentDomain:GetAssemblies()
		IF oAssembly:Length > 0
			for i := 0 upto oAssembly:Length - 1
				ExportedTypes   := oAssembly[i]:GetExportedTypes()
				if ExportedTypes:Length > 0
					For j := 0 upto ExportedTypes:Length -1
						if String.Compare(cMethodName, ExportedTypes[j]:Name, StringComparison.OrdinalIgnoreCase) == 0
							// we got it move on
							oType := ExportedTypes[j]
							i := oAssembly:Length
							j := ExportedTypes:Length
						endif                        
					Next
				ENDIF
			next
		ENDIF
		if oType <> null
		   oInstance 		:= Activator.CreateInstance(oType)
		endif
	catch ex as Exception
		throw SystemException{"Error Creating Class"}
	end try
	Return oInstance


