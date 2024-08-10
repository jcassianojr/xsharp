/*
TEXTBLOCK _Contact Willie
//l Contact information
//d I am always interested in feedback on rightSLE. \line
//d
//d For bug or enhancements requests, please contact me at: \line
//d {\b Williem@wmconsulting.com}
ENDTEXT


*/
/*
TEXTBLOCK Compiling under VO 2.0b-4
//l Compiling under 2.0b-4
//d
//d
//d rightSLE 2.1c can be compiled under VO 2.0b4. To do this simply \line
//d change the _IsVO2 define from false to true. \par
//d \line
//d \tab _IsVO2 IS located IN Module {\b CLASS rightSLE} \par
//d \line
//d Once you have changed _IsVO2, Please touch and recompile. \line
//d the sample app "TestrightSLE" has also been modified where it
//d will work with VO 2.0b-4 with no modifications.
ENDTEXT

*/
/*
TEXTBLOCK Postinit
//l { \b Use of Postinit with rightSLE}
//d
//d
//d rightSLE now includes a postinit. This will give you the ability to make \line
//d global changes to SLEs without having to go to each of your \line
//d screens. \par
//d {\b Things that you can control in the postinit:} \line
//d {\f4\'B7} \tab lTurnOffEnter - Default is FALSE to allow enter key processing \line
//d   \tab you can set this to TRUE if you do not want the enterkey to be processes \line
//d   \tab of you are using clipperkeys. \line
//d {\f4\'B7} \tab lObeyFocusChangeAlways - default is FALSE. This will let you \line
//d   \tab click into an SLE via the mouse and always obey the rules if the SLE is empty. \line
//d   \tab If the SLE has something in it, the mouse will go to the click position. \line
//d   \tab Set the to TRUE is you always want to obey the FSEL setting and ignore the \line
//d   \tab mouse click position. \line
//d {\f4\'B7} \tab wFocusSel - This is the initial focus selection. rightSLE's default is FSEL_HOME. \line
//d   \tab You can change this to ANY valid focus selection code. The current valid ones for VO 2.7b are: \line
//d   \tab FSEL_ALL \tab \tab - All text selected \line
//d   \tab FSEL_HOME \tab \tab - Cursor to the left most position of the SLE. \line
//d   \tab FSEL_END \tab  \tab - Cursor to the right most character of the SLE. \line
//d   \tab FSEL_TRIMMED \tab - Cursor to the right most filled in character of the SLE (trimed position). \line
//d {\f4\'B7} \tab lAlignCalendarLeft - calendar allignment in relation to the SLE. \line
//d   \tab rightSLE default is TRUE. This will allign the calendar to the left of the SLE where possible. \line
//d   \tab By setting this to FALSE, you will cause a right allignment of the calendar. \line
//d {\f4\'B7} \tab lAllowCutandPaste - This controls rightSLE's ability to process \line
//b   \tab the windows cut, copy, paste, undo messages. This is set to \line
//b   \tab {\b TRUE} by default. \line
//d {\f4\'B7} \tab lDoubleAsToday - This controls rightSLE's calendar. Bu setting this to true \line
//d   \tab you will cause a double click on a dateSLE (with button only) to put \line
//d   \tab in today's date. The button wil still function as normal. This has no affect \line
//d   \tab on a rightSLE that has only a date fieldspec (no button). There is also an assign: \line
//d   \tab DoubleAsToday(lVar) that allows this setting to be set on an individual SLE. \line
//d {\f4\'B7} \tab lAllowNumericFocus - This controls rightSLE's numeric SLEs \line
//d	  \tab TRUE \tab \tab - When changing focus, the SLE positions itself to the left of the decimal \line
//d   \tab \tab \tab Please note that this does not work is wFocusSel is set to FSEL_ALL. \line
//d   \tab \tab \tab If there is no decimal, the cursor if put to the far side of the SLE. This will \line
//d   \tab \tab \tab let input happen the way most users expect. \line
//d   \tab FALSE \tab - rightSLE default to maintain backward compatibility. \line
//d {\f4\'B7} \tab ProcessArrowKeys - This controls rightSLE's arrow processing logic \line
//d	  \tab TRUE \tab \tab - When user hits up or down arrow, focus is changed to the next or previous control \line
//d   \tab FALSE \tab - rightSLE default to maintain backward compatibility. \line
//d {\f4\'B7} \tab symImageType - This controls the push buttons for rightSLE \line
//d	  \tab #BITMAP \tab - Use bitmap images \line
//d   \tab #ICON \tab \tab - Use icon images \line
//d {\f4\'B7} \tab lUseOldButtons - This controls which button class that rightSLE uses. \line
//d	  \tab TRUE \tab - Use the original buttons included with rightSLE \line
//d	  \tab FALSE \tab - Use the new buttons that support XP Styles. \line
//d {\f4\'B7} \tab lRememberPosition - This controls which button class that rightSLE uses. \line
//d	  \tab TRUE \tab - rightSLE will remember the last position you were in and reposition the \line
//d   \tab \tab \tab cursor to the last position each time you tab into the control. \line
//d   \tab \tab \tab Please note. This ivar {\b ONLY} works if lObeyFocusRuleAlways is set to false! \line
//d	  \tab FALSE \tab - Follow the normal focuschange logic. \line
//d {\f4\'B7} \tab symCalandarClass - This controls the class that get instanciated when you click on a calendard button \line
//d {\f4\'B7} \tab symCalcClass - This controls the class that get instanciated when you click on a calculator button \line
//d   \par
ENDTEXT

*/
/*
TEXTBLOCK Readme 2001
//l Release Notes for 2001
//d
//d {\b Version 2.2e (10/14/2001)} \line
//d {\f4\'B7} \tab Fixed a bug in the formatted string module that \line
//d   \tab would cause a character to be incorrectly formated when \line
//d   \tab you highlighted part of the SLE beginning in the first character \line
//d   \tab and typed something (Thanks Jamie!) \line
//d {\f4\'B7} \tab Changed PECalendarSLE. Added a new method handleYearSLE \line
//d   \tab that takes care of the year changing from a spinner. That way you \line
//d   \tab can call it directly from an OK button to get the correct date from \line
//d   \tab calendar without having to click into it. The same logic is called \line
//d   \tab from the PECalendar:dispatch.(Thanks Barbara FOR the suggestion!) \line
//d {\f4\'B7} \tab Added a new method {\b rslePaste} that follows the rightSLE method \line
//d   \tab for inserting characters into a number. \line
//d   \tab Please note that this only applies to {\b numeric} rightSLEs. Anything else \line
//d   \tab will use VO's native paste method.
//d {\f4\'B7} \tab Added a new assign DoubleAsToday that will set an individual \line
//d   \tab rightSLE to show today when a mouse double click message is received (Thanks Paolo Calzi!) \line
//d \par
//d
//d {\b Version 2.2d (09/04/2001)} \line
//d {\f4\'B7} \tab added logic to all of the button methods to check for disabled from the IDE (Thanks Phil!). \line
//d {\f4\'B7} \tab added new methods {\b MoveFirstofMonth} and {\b MoveLastofMonth} to PECalendar class. \line
//d   \tab This now properly handles the home and end keys moving to the first and last days \line
//d   \tab of the month and refreshes the screen. \line
//d {\f4\'B7} \tab added a subclassed SLE to PECalendar so the edityear would \line
//d   \tab respond to the enter key in all conditions. \line
//d {\f4\'B7} \tab worked on making the documentation more readable. \line
//d {\f4\'B7} \tab Enabled cut and paste for rightSLE. This currently does {\b NOT} worked for \line
//d   \tab SLEs containing the $ template character. \line
//d {\f4\'B7} \tab Fixed a selection problem that only showed \line
//d   \tab up if you selected numbers to the right of the decimal(Thanks Bob!). \line
//d \par
//d
//d {\b Version 2.2c (08/08/2001)} \line
//d {\f4\'B7} \tab added a destroy method (Thanks Simon!). This will clean up memory from the dynamically created. \line
//d   \tab button if it exists. \line
//d {\f4\'B7} \tab Added support for the $ template character in the picture clause. \line
//d   \tab thanks to Phil McGuinness for pointing this one out. \line
//d {\f4\'B7} \tab Phil McGuinness added self:lTruePicture (default TRUE) \line
//d   \tab If TRUE then $ sign can be overwritten.. which uses available fieldspec length. The default is match the picture \line
//d   \tab and overwrite. \line
//d \par
//d
//d {\b Version 2.2b (08/01/2001)} \line
//d {\f4\'B7} \tab Fixed some selection bugs. \line
//d   \tab There are some substancial changes to processnum. \line
//d \par
//d
//d {\b Version 2.2a (07/24/2001)} \line
//d {\f4\'B7} \tab Fixed an error with the positioning of a number if you typed 100 \line
//d   \tab and then hightlighted the 1 and changed it to a 2. You would get 2 instead of 200. \line
//d   \tab this error would also incorrectly position the cursor where you could not type. \line
//d {\f4\'B7} \tab corrected a problem with the backspace key and the thousand seperator. \line
//d {\f4\'B7} \tab corrected a selection problem with the timespec. \line
//d {\f4\'B7} \tab corrected several nasty numeric overflows that occured if you had \line
//d   \tab the decimal point hightlighted along with the rest of the number and \line
//d   \tab hit the backspace. \line
//d {\f4\'B7} \tab corrected a problem where if you had a multible character selection hightlighted atleast \line
//d   \tab one space over from the rest of your number, rightSLE you position \line
//d   \tab to the left of the number instead of to the right. \line
//d
//d \par
//d {\b Version 2.2 (07/18/2001)} \line
//d {\f4\'B7} \tab Cleaned up a lot of code where I was doing datatype conversion where I really didn't need \line
//d   \tab to be doing it. \line
//d {\f4\'B7} \tab Added a call to postinit from rightSLE's init. This will make it easier for people  to customize rightSLE. \line
//d   \tab postinit has been defined in class SINGLELINEEDIT, not rightSLE. \line
//d   \tab That will allow you to define your postinit without getting an "duplicate method" error message. \line
//d {\f4\'B7} \tab Fixed a bug in TestfirstChar that would not let you backspace into the \line
//d   \tab first position of a character SLE with a picture of 9999999. \line
//d {\f4\'B7} \tab added a new protect called lTurnOffEnter. By setting this ivar to TRUE \line
//d   \tab in your rightSLE postinit, you can turn off enter key processing. \line
//d   \tab the default here is FALSE. \line
//d   \par
//d
//d {\b Version 2.1e (05/21/2001)} \line
//d {\f4\'B7} \tab Added a new Class FolderSLE. This class allows you to specify the caption of \line
//d   \tab browse window. It also remembers the last directory that you selected \line
//d   \tab There is also the pbFolderSLE version that adds the same pushbutton \line
//d   \tab as pbFileSLE. \line
//d   \tab Thanks to Ed Ratcliffe for the base code to folderSLE!! \line
//d {\f4\'B7} \tab Minor changes to pbFileSLE. The pushbutton now obeys the isvisible() setting \line
//d   \tab on init. \line
//d   \par
//d
//d {\b Version 2.1d (04/10/2001)} \line
//d {\f4\'B7} \tab Changed the inheritance tree to make it easier for VO 2 users to use
//d   \tab the product. The class POPUPCALC has been renamed to _PopUpCalc and then \line
//d   \tab inherited by PopUpClass to get around the problem of VO 2 not obeying \line
//d   \tab the VO 2.5 version of //do not remove this line i the class definitions. \line
//d {\f4\'B7} \tab Changed out the default showcalc, showcalendar methods with a check for a \line
//d   \tab symbol and then using a send to invoke the method. This will allow a user \line
//d   \tab to substitute their own dialog's instead of the ones that I include. \line
//d   \tab {\b Please NOTE} I will NOT debug your custom date / calculator dialogs!! I put \line
//d   \tab this in for flexibility. \line
//d {\f4\'B7} \tab Fixed a problem with the inline calc. It was not correctly \line
//d   \tab adjusting for pictures that contained ",". \line
//d {\f4\'B7} \tab Fixed a bug where lAllselected was being left on regardless of the focus method. \line
//d {\f4\'B7} \tab changed rightSLE focuschange to obey the mouse click if the SLE is not empty. \line
//d   \tab otherwise, do what the IDE or rightSLE's default is (FSEL_ALL for IDE), (FSEL_HOME for rightSLE) \line
//d   \par
//d
//d {\b Version 2.1c (03/20/2001)} \line
//d {\f4\'B7} \tab Fixed a bug where a numeric overflow would occur if the selection crossed \line
//d   \tab the decimal point and you hit the delete key (Thanks Rene!) \line
//d {\f4\'B7} \tab The SLE now respects the IDE settings of ReadOnly and Visible with \line
//d   \tab respect to buttons. The Control itself has always obeyed the readonly \line
//d   \tab and visible settings. \line
//d {\f4\'B7} \tab fixed the origin of the calculatorSLE so it follows the same rules \line
//d   \tab as the calendar. \line
//d {\f4\'B7} \tab Added the defines need to run rightSLe on VO 2.04-b \line
//d   \par
//d
//d {\b Version 2.1b (03/07/2001)} \line
//d {\f4\'B7} \tab Changed the enter key processing back to WM_KEYUP after finding \line
//d   \tab that the getdlgcode was causing random skips over other SLEs \line
//d   \tab instead of processing properly. This means that the reported \line
//d   \tab issue with rightSLE and entering a datawindow via the keyboard \line
//d   \tab still stands. This issue has been reported to CA and I am awaiting \line
//d   \tab there reply. Until this is resolved, if you have a datawindow \line
//d   \tab with the first editable control a rightSLE, the control will be \line
//d   \tab initially skipped if you enter the datawindow from the menu \line
//d   \tab via the keyboard (by pressing enter instead of clicking on the \line
//d   \tab menu item. \line
//d {\f4\'B7} \tab Added the ^ to the list of operations that the inline calculator \line
//d   \tab will handle. \line
//d {\f4\'B7} \tab Added support for Fab AutoDoc and added a helpfile documenting all \line
//d   \tab methods in rightSLE. \line
//d   \par
//d
//d {\b Version 2.1a (02/20/2001)} \line
//d {\f4\'B7} \tab Fixed a bug where the negative number was not carrying \line
//d   \tab over when you pressed a number such AS -0.01. (Thanks Simon!) \line
//d {\f4\'B7} \tab New inline calculator functionality. simply INHERIT from \line
//d   \tab inlinecalcSLE and you can DO simple mathematics. \line
//d {\f4\'B7} \tab Moved the location of the readme TO make it easier to findout whats new \line
//d {\f4\'B7} \tab Added a version info module to make it easier to deturmine the verison OF rightSLE \line
//d {\f4\'B7} \tab changed the dispatch processing OF enter from WM_KEYUP to WM_GETDLGCODE to \line
//d   \tab get rid of a problem WITH someone entering a window via the keyboard \line
//d   \tab automatically skipping TO the NEXT FIELD \line
//d {\f4\'B7} \tab Fixed bug where double clicking on a calendar would cause another \line
//d   \tab rightSLE control WITH a button TO fire IF the mouse was over \line
//d   \tab the OTHER button \line
//d {\f4\'B7} \tab Cleaned up the CODE inside OF PECalendar:Dispatch TO make it more readable \line
//d   \par
ENDTEXT

*/
/*
TEXTBLOCK Readme 2002
//l Release Notes for 2002
//d
//d {\b Version 2.6b (12/01/2002)} \line
//d {\f4\'B7} \tab Changes to processnum to change problems with movement on the right side \line
//d \tab of the decimal. the cause the curror to be positioned on the wrong side of \line
//d \tab the character if the delete or back key was pressed. \line
//d {\f4\'B7} \tab Changed processnum to retain the right side of a decimal if the caracter is being inserted. Thanks Józef!!! \line
//d {\f4\'B7} \tab Changed processnum to not delete charaters in a selection if it is just a movement key. \line
//d {\f4\'B7} \tab Changed processnum to move selection to beginning or end of selection block if it is a movement key. \line
//d {\f4\'B7} \tab Removed the init of class dlgPECalendar as it was causing postinit to be called twice and was contributing nothing. \line
//d {\f4\'B7} \tab Changed the bitmap size in the init of dateSLE,pbFolderSLe,pbFileSLE to reflect that actual bitmap size. \line
//d {\f4\'B7} \tab Changed the offset in processnum (line 96) to  properly allow an overwrite of the last character if the fieldspec is exactly the size of an integerSLE. \line
//d \par
//d {\b Version 2.6a (11/20/2002)} \line
//d {\f4\'B7} \tab Changes to processnum to remove a hardcoded decimal. \line
//d {\f4\'B7} \tab Changed showcalendar to change a focus selection problem with the tab control. \line
//d {\f4\'B7} \tab Changed showcalc to change a focus selection problem with the tab control. \line
//d {\f4\'B7} \tab Commented out the setfocus postmessage in SLEButton to correct a problem \line
//d \tab with focus selection after hitting ESC from the calculator or calendar. \line
//d \tab The focus was in the correct place, the carrot showing cursor position as not showing up. \line
//d \tab Please not that this was only occuring when you placed a dateSLE on a tab control! \line
//d \tab If you want to reenable the focus message, it is commented out in method: \line
//d \tab \tab SLEButton:dispatch() \line
//d {\f4\'B7} \tab Changed rightSLE dispatch to allow shift right_arrow to properly control selection. \line
//d {\f4\'B7} \tab Added new ivars to fileSLE to set the initial dir and title. Thanks Geoff!!! \line
//d \tab \tab sInitDir \tab Initial directory to position the Open / save dialog. \line
//d \tab \tab \tab \tab This setting is overritten by anything typed into the field. \line
//d \tab \tab sTitle \tab \tab The title of the Open / Save dialog. \line
//d \par
//d
//d {\b Version 2.6 (09/26/2002)} \line
//d {\f4\'B7} \tab Changes for VO 2.6 \line
//d \par
//d
//d {\b Version 2.3a (09/17/2002)} \line
//d {\f4\'B7} \tab Change to the float2string method for inline and popupcalculator. Thanks U.C Mehaboob!!! \line
//d \par
//d
//d {\b Version 2.3 (09/16/2002)} \line
//d {\f4\'B7} \tab Changes to the calculator classes to fix some misc bugs. Thanks U.C Mehaboob!!! \line
//d {\f4\'B7} \tab Changes to the rightSLE dispatch to clean up some code \line
//d {\f4\'B7} \tab Changes to the rightSLE dispatch to allow for cntrl enter to post a WM_LBUTTONDBLCLK message. \line
//d \tab This will allow the keyboard to be used to enter into the calendar/calc/fileSLE/etc. \line
//d \par
//d
//d {\b Version 2.2h (09/07/2002)} \line
//d {\f4\'B7} \tab Changes to the calculator classes to fix some str() issues. Thanks Jorge Rosado!! \line
//d {\f4\'B7} \tab Changes to context menu for the calendar to remove some refrences to fileopen \line
//d \tab that should not have been there. \line
//d {\f4\'B7} \tab Changed the init of dateSLE to correct an error that the compiler missed <g> \line
//d {\f4\'B7} \tab Changed the showCalendar method of rightSLE to remove the setinternational(#windows) \line
//d \tab This fixes a problem introduced with the last release \line
//d {\f4\'B7} \tab Changed postinit of the calculator to call initcalc like the inline version. \line
//d \par
//d
//d {\b Version 2.2g (07/20/2002)} \line
//d {\f4\'B7} \tab moved the getlocaleinfo out of the rightSLE init to the showcalendar dialog as it \line
//d \tab is not needed in most cases. It only affects the Calendar \line
//d {\f4\'B7} \tab Made changes to class inlineCalc to properly allow \line
//d \tab a value to be inserted when the SLE is first created. \line
//d {\f4\'B7} \tab Changed inlineCalcSLE method postinit to initcalc. This \line
//d \tab fixes a problem where the rightSLE postinit was not being called. The new \line
//d \tab name properly identifies the function of the method. \line
//d {\f4\'B7} \tab Added logic in the buttondown to give focus to the SLE that the \line
//d \tab button is attached to. \line
//d {\f4\'B7} \tab Added a new protected ivar lAllowNumericFocus. This is initially \line
//d \tab set to FALSE to maintain backwards compatibility with current rightSLE installations. \line
//d \tab Set it to TRUE and your numeric SLES will automatically position the cursor to the \line
//d \tab end of the SLE or imidiately to the left of the decimal. \line
//d {\f4\'B7} \tab Fixed a bug with folderSLE not going to the contents of the SLE the \line
//d \tab the first time called. \line
//d {\f4\'B7} \tab A special thanks to Zygmunt Stasiak who has given me many suggestions \line
//d \tab on how I can improve rightSLE. Some of his suggestions are included in 2.2g \line
//d \par
//d
//d {\b Version 2.2f (03/14/2002)} \line
//d {\f4\'B7} \tab Fixed a bug in the Selection where highlighting the entire \line
//d   \tab line and hitting 0 would not erase the past behind the decimal. \line
//d {\f4\'B7} \tab Added access PB to class right SLE so resize events \line
//d   \tab would be able to access and move the underlying button. \line
//d {\f4\'B7} \tab Redid some of processnums logic to use the strongly typed \line
//d   \tab versions of the commands (substr3 instead of substr). Thanks Ivo!! \line
//d \par
ENDTEXT


*/
/*
TEXTBLOCK Readme 2003
//l Release Notes for 2003
//d
//d {\b Version 2.7 (12/06/2003)} \line
//d {\f4\'B7} \tab Changes to processnum to correct problems with databound controls calling \line
//d \tab validateion after each keystroke. \line
//d {\f4\'B7} \tab Initial compile for VO 2.7 \line
//d \par
//d {\b Version 2.6c (03/01/2003) Devfest 2003} \line
//d {\f4\'B7} \tab Changes to processnum to correct problems with the delete key and thousand seperators \line
//d {\f4\'B7} \tab Changes to processnum to delete if 1st chat is a non-editable char \line
//d {\f4\'B7} \tab New option lRememberPosition. This will remember the SLE position between focus changes. \line
//d \par
ENDTEXT

*/
/*
TEXTBLOCK Readme 2004
//l Release Notes for 2004
//d
//d {\b Version 2.7e (11/12/2004)} \line
//d {\f4\'B7} \tab Added a new ivar to control which button type is used. \line
//d \tab set to lUseOldButtons of you want to use the VO 2.6 button style. \line
//d {\f4\'B7} \tab changed the default for lUseRecoucesforIcons to true. This will \line
//d \tab use the resouce statements included with rightSLE instead of user defined resouces. \line
//d \tab If you want to use your own bitmaps instead of the ones included, simply set \line
//d \tab lUseRecoucesforIcons to false in your rightSLE postinit and make sure that you \line
//d \tab have the bmps in your exe's directory. \line
//d
//d {\b Version 2.7d (11/11/2004)} \line
//d {\f4\'B7} \tab Recomplied in 2.7b to remove errors with class initialization mismatches \line
//d \tab Thanks Robert and Dev Team for the tighter compiler!!! \line
//d
//d {\b Version 2.7c (08/07/2004)} \line
//d {\f4\'B7} \tab Change in the focuschange method to reflect that the super class can return \line
//d \tab a value and I need to pass that value on (Thanks Thomas!) \line
//d
//d {\b Version 2.7c (06/24/2004)} \line
//d {\f4\'B7} \tab Redid the button assignment logic to reduce code bloat \line
//d \tab and to allow the user to use bitmaps or icons (Thanks Simon) \line
//d {\f4\'B7} \tab Strongly typed accesses and assigns for fileSLE and folderSLE \line
//d \tab Please note that at a future date, the exports in these classes will become \line
//d \tab protects. Please adjust your code so you do not get caught in the future!! \line
//d {\f4\'B7} \tab Reworked the button class to better handle xp themes \line
//d {\f4\'B7} \tab Added a new assign ProcessArrowKeys \line
//d \tab This setting will turn on / off arrowkey processing in the SLE (Thanks Joze) \line
//d {\f4\'B7} \tab Changed showpb to disable the oPB is the window is readonly instead of the SLE (Thanks Nick) \line
//d \par
//d {\b Version 2.7b (06/09/2004)} \line
//d {\f4\'B7} \tab Added selection assign to make rightSLE compatible with VO 2.7a \line
//d {\f4\'B7} \tab Corrected a bug where Shift Home would only select to the left of the decimal. (thanks Chris!) \line
//d {\f4\'B7} \tab Redid the logic in the focuschange method to reduce unneeded postmessages \line
//d \tab Paul changed the sendmessages to postmessages in the super class so I no longer needed to send \line
//d \tab most OF what I was sending before. \line
//d \par
//d {\b Version 2.7a (01/29/2004)} \line
//d {\f4\'B7} \tab Recompiled and tested for the 2.7 official release \line
//d \par
ENDTEXT

*/
/*
TEXTBLOCK Readme 2005
//l Release Notes for 2005
//d
//d {\b Version 2.7g4 (11/26/2005)} \line
//d {\f4\'B7} \tab Fixed an issue with the picture assign. It was not reseting the oEditString \line
//d \tab  before assigning the new pcture and would not show the string properly. (Thanks Tracy Thomas!!). \line
//d {\f4\'B7} \tab Added a new method upDateFieldSpect. This will let you change the fieldspec on the fly. \line
//d \par
//d {\b Version 2.7g2 (09/23/2005)} \line
//d {\f4\'B7} \tab Changed showcalendar to allow bbrowser to save back into the control. \line
//d {\f4\'B7} \tab Added checks for a valid date before calling the calendar routine. \line
//d \tab Also made the tests when the + or - keys are hit to increment or decrement a date. (Thanks Barbara!!) \line
//d {\f4\'B7} \tab Changed my assigns to return void. \line
//d \par
//d
//d {\b Version 2.7g1 (08/31/2005)} \line
//d {\f4\'B7} \tab Added a new ivar called lTurnNumericPictureNumeric. \line
//d \tab the default for this is FALSE. this fixes transformation issues when changing \line
//d \tab picture clause on the fly (thanks Tracy Thomas!!) \line
//d \par
//d
//d {\b Version 2.7g (08/12/2005)} \line
//d {\f4\'B7} \tab Added a new class called wmDateRange. \line
//d \tab This class is the container for the new date range logic implemented in the \line
//d \tab PEcalendar class. \line
//d \tab a BIG thanks to V.Vekov for suggestion the new feature!!!!!! \line
//d {\f4\'B7} \tab Added a new ivar called oDateRange to class rightSLE. \line
//d {\f4\'B7} \tab Added an access/assign pair for DateRange for class rightSLE. \line
//d {\f4\'B7} \tab Added an protected iVar called nOwnerAlignment. \line
//d \tab This will save the curent owneralignment so the push button can be dynamically \line
//d \tab reset. This will also allow you to set the owner alignment in the rightSLE postinit \line
//d \tab and it will take care of the SLEs and associated push buttons. \line
//d {\f4\'B7} \tab Added an origin assign to let you hard code a phyical placement of the SLE. \line
//d \tab This method also resets the owneralignment if present (thanks Geoff!! ) \line
//d {\f4\'B7} \tab corrected a bug in the picture assign. I was being too agressive in assigning a \line
//d \tab numeric attribute to a picture clause. I should not mess with the type is the picture begins with \line
//d \tab @R \line
//d \par
//d {\b Version 2.7f (03/10/2005)} \line
//d {\f4\'B7} \tab Added a new ivar called cCurSymbol to hold the currency symbol ($,R, etc). \line
//d {\f4\'B7} \tab Added a new method called CurrencySymbol to set the currency symbol and adjust the template string \line
//d \tab for pictures. \line
//d {\f4\'B7} \tab Added a new method to class rightSLEFormattedString to look at the empty picture that \line
//d \tab is initially assigned to a formatted string. If it sees a $ in the template string, it will \line
//d \tab adjust the picture to "@R " + the locale currency string. It will also adjust the fieldspec picture. \line
//d \tab the effect will be that the currency string will appear at the left of the SLE. \line
//d {\f4\'B7} \tab Added a new access called CurrencyPosition.\line
//d \tab This access is used from rightSLEFormattedString:EmptyValue to deturmine which side \line
//d \tab to place the currency marker. 0 and 2 means to the left, 1 and 3 mean to the right. \line
//d {\f4\'B7} \tab Removed the restriction for a fieldspec. rightSLE now works with pictures as well as fieldspecs. \line
//d \tab Thanks Richard for giving me the push to finally make this change \line
//d {\f4\'B7} \tab Removed some warning messages from CurrencySymbol (thanks Geoff!). \line
//d {\f4\'B7} \tab Made changes for the tighter VO compiler. \line
//d
ENDTEXT

*/
/*
TEXTBLOCK Readme 2006
//l Release Notes for 2006
//d
//d {\b Version 2.7g8 (10/24/2006)} \line
//d {\f4\'B7} \tab Changed class dateSLE to inherit from dateSLENoPB (No push button). \line
//d \tab This gives the prgorammer the ability to get the dateSLE without the pushbutton \line
//d \tab but still retain the context menu (Thanks Barbara)  \line
//d \par
//d {\b Version 2.7g7 (07/24/2006)} \line
//d {\f4\'B7} \tab Changed processEnter for class inlinecalcSLE to process the normal enterkey if there is only 1 operand. \line
//d {\f4\'B7} \tab Worked on copy/paste issues in the main rightSLE dispatch. \line
//d {\f4\'B7} \tab Added a check to the fieldspec assign so it wont reset the textvalue the first time through. \line
//d \par
//d {\b Version 2.7g6 (04/01/2006)} \line
//d {\f4\'B7} \tab Added a Type access so you can change the oeditString:Type from your program.\line
//d \tab This is helpful for resetting pictures dynamically. \line
//d \par
//d {\b Version 2.7g5 (01/06/2006)} \line
//d {\f4\'B7} \tab Changes to the updatefieldspec (thanks Geoff!!) \line
//d {\f4\'B7} \tab added a new assign (fieldspec) to properly reset the fieldspec if that is all you want to do \line
//d {\f4\'B7} \tab added callbacks to the PECalendar Class. this will allow the programmer to control \line
//d \tab how the holiday array or anything else is set up in the calendar control on a month/year change \line
//d \tab or when a highlighted day (in the aHoliday array) is rightclicked. (Thanks John Parker!!) \line
//d \line
//d \tab Method onMonthYear(dNewDate) class myclass \tab This must return a new Holiday array \line
//d \tab Method onholidayrightClick(oDlg,nDate) class myclass \tab this returns NIL \line
//d \tab \tab onHolidayrightClick also passes the oDlg that holds the calendar so you can do calendar manipulations \line
//d \line
//d {\f4\'B7} \tab added a new export symCalcMethod which represents the method that gets called when the calc button his hit. \line
//d \tab This was changed from symMethod to allow the user to change the popup calculator method \line
//d \tab in the same way as the calendar. Previously, the #showCalc method was hardcoded in the calcSLe init. \line
//d {\f4\'B7} \tab added a new export symCalcClass which represents the class that is instanciated \line
//d \tab when the calculator button is hit. \line
//d {\f4\'B7} \tab added a new export symCalendarClass which represents the class that is instanciated \line
//d \tab when the calendar button is hit. \line
//d {\f4\'B7} \tab moved the location of all resource statements to \\%cavodir%\\IMDATA \line
//d \par
ENDTEXT

*/
/*
TEXTBLOCK Readme 2007
//l Release Notes for 2007
//d
//d {\b Version 2.8a (07/25/2007)} \line
//d {\f4\'B7} \tab Made changes to the PECalendar Class based on what the transporter reported. \line
//d \tab There were functions that the sending side was asking for a date but the method was returning \line
//d \tab a long. These have been corrected. \line
//d {\f4\'B7} \tab cleanup of the main dispatch based on transper found issues. \line
//d {\f4\'B7} \tab Added axit and destroy to PECaldendar to cleanup brushes that were created during init. \line
//d \par
//d {\b Version 2.8 (04/25/2007)} \line
//d {\f4\'B7} \tab Changed the dispatch in calcSLE to correct the symMethod to symCalcMethod (Thanks John!). \line
//d {\f4\'B7} \tab added the ability to the dateSLE to allow t or T to put in today's Thanks John!). \line
//d \par
//d
//d {\b Version 2.7g9 (01/05/2007)} \line
//d {\f4\'B7} \tab Changed class dlgPECalendar to handle a day callback (thanks Erik!!). \line
//d {\f4\'B7} \tab Optimized the callback methods in class dlgPECalendar so they only check \line
//d \tab the owner on init instead of each time a callback happens. This should improve speed \\line
//d \tab of the calendar in general movement. \line
//d {\f4\'B7} \tab Optimized the callback methods in class PECalendar for the same reasons as above. \line
//d \par
ENDTEXT

*/
/*
TEXTBLOCK Readme 2008
//l Release Notes for 2008
//d
//d {\b Version 2.8c (03/27/2008)} \line
//d {\f4\'B7} \tab Fixed another issue with owner alingment nd p[ush buttons. \line
//d {\f4\'B7} \tab emoved all calls to pclone as it is not supported in Vulcan. \line
//d \par
//d {\b Version 2.8b (03/15/2008)} \line
//d {\f4\'B7} \tab Fixed an issue with owner alingment. \line
//d \par
ENDTEXT        

*/
/*
TEXTBLOCK Readme 2009
//l Release Notes for 2009
//d
//d {\b Version 2.8d (04/09/2009)} \line
//d {\f4\'B7} \tab Fixed issue with the verticle spinner form the dataSLE control. \line
//d \par
ENDTEXT

*/
/*
TEXTBLOCK Readme pre 2001
//l Release Notes pre 2001
//d
//d {\b Version 2.0g (10/03/2000)} \line
//d - Fixed a bug where ValueChanged was not being set. This would not allow you to trap
//d   changed IN your editfocuschange method. \line
//d - Added FSEL_ALL TO the focuschange method.    \line
//d - Fixed a bug where a return key was erasing the fields value \par
//d
//d {\b Version 2.0f (09/17/2000)} \line
//d - Added LOGIC TO let the user use the enterkey TO move between SLEs
//d - fix TO allow a negative number TO be entered that IS less than 1 (-.1) \par
//d
//d {\b Version 2.0e (08/07/00) } \line
//d - New version of popup calculator module. \line
//d - Changed processnum to allow FOR ",." to change decimals \line
//d - fixed issues regarding the entry of negative numbers \line
//d - changed calendar to read from LOCALE_USER_DEFAULT instead
//d   of LOCALE_SYSTEM_DEFAULT to accomdate W2K users who have
//d   different settings for each user who is logged IN. \par
//d
//d {\b Version 2.0d (07/07/00)} \line
//d - Modified the processnum TO take care of pictures OF 9.99. The old version woul not allow them to
//d   come back and modify the sle (ie 0.99 becomes uneditable AS the length was already 4.2) \line
//d - Small modification to ProcessNum around line 255 (thanks Warren).
//d   I forgot that I had to handle the fieldspec type of "C" for the timespec.
//d   thus the val was causing a runtime error. \line
//d - Change in the delete key routine to take into account
//d   the character fieldspec and timestring \par
//d
//d {\b Version 2.0c (06/29/00)} \line
//d - Modified the init TO make the home position the default. This
//d   can be commented out easily FOR VO's default behavior to take place. \line
//d - Fixed a nasty bug where It would leave the zero and add to the left
//d   of it if you started from the left most position of the SLE. \line
//d - Added 1 TO the EditYear METHOD OF PECalendar TO make the year
//d   a little easier TO read when USING the spinner. \par
//d
//d {\b Version 2.0b (06/19/00)} \line
//d - Added CODE TO make the first mouse click
//d   into a SLE obey the VO FSEL web properties.
//d   This code is in the focuschange METHOD OF rightSLE. This is the CODE that VO's
//d   SLE should be USING instead OF a SendMessage. This bring back
//d   the VO1 behavior OF the 1st click into a cell left. To accomplish this
//d   simply set the focus select property TO FSEL_HOME IN the general tab. \line
//d   IF you want the default VO 2.5a-1 behavior, simply comment THIS CODE out. \line
//d - Added CODE from Warren McIntyre to handle time fieldspecs that are of type
//d   character. If you use a numeric fieldspec with a picture of @R 99:99 you
//d   will get bad results. \par
//d
//d {\b Version 2.0a (06/09/00)} \line
//d - Added code to reposition the calendar depending on screen position. Based
//d   on CODE found on knowvo \line
//d - strongly typed CLASS PECalendar and PopupCalc \par
//d
//d {\b Version 2.0 (04/24/00)} \line
//d - Added CODE TO resolve a issue WITH the fieldspecs. Haveing a decimal
//d   decimal IN the fieldspec but USING an integer picture would
//d   result IN a runtime error. Special thanks TO Danilo Giuliani
//d   FOR helping me out WITH THIS one. \line
//d - Added CODE TO automaticall hide/show the pushbutton IF it exists. \line
//d - optimized the button TO make it easier TO maintain. \line
//d - fixed the calendar and calculator TO relect modified IF an item was selected. \line
//d - Removed the tabstop style from the button AS it was not being triggered via
//d   the keyboard \line
//d - Added some CODE that you can uncomment IN rightSLE's main dispatch
//d   TO highlight the SLE everytime you single click into it. \line
//d - Removed some old CODE that was not doing anything. Changed the main dispatch
//d   TO pass event instead OF controlevent{oevent} (Thanks Geoff!)  \line
//d - Added LOGIC TO check FOR template characters such AS (999) 999-9999 where
//d   VO currently beeps IF you are IN the first position. \par
//d
//d {\b Version 1.9d (01/19/00)} \line
//d - Fixed the dateSLE pushbutton where it would not pop up another window when you exited
//d   the calendar by a mouse doubleclick  \line
//d - Added calcSLE and calcSLEpb \line
//d   CalcSLE uses popcalculator by Geoff Schaller \par
//d
//d {\b Version 1.9c (11/29/99)} \line
//d - Fixes TO the DATE CLASS where FirstdayofWeek was not being set from
//d   rightSLE inself. But only from dateSLE.  \line
//d - dateSLE and rightSLE should now display the calendar IN your national language
//d   Thanks TO Lars-Eric Gisslen and Uwe Heyer FOR their help IN
//d   the DATE functions. \par
//d
//d {\b Version 1.9b (9/15/99)} \line
//d - new testrightSLE that shows how TO trap the enter key \line
//d - rerelease OF the PUBLIC version OF rightSLE \line
//d - added CODE where you can set the initial day OF the week
//d   (Thanks Allen Wissing!!) \par
//d
//d {\b Version 1.9a (6/15/99)} \line
//d - Added some CODE TO remove a reported memory loss \line
//d - new testRightSLE that has a memory checking FUNCTION  \par
//d
//d {\b Version 1.9 (4/5/99)}  \line
//d I have a NEW web address:
//d    http://www.wmconsulting.com
//d    mailto:williem@wmconsulting.com \line
//d
//d - Implemented suggestions from various people \line
//d - Added a searchSLE \line
//d - Added a timeSLE \line
//d Both searchSLE and timerSLE originated IN atoolkit FOR VO1. I have ported and made these very useful CLASS
//d available FOR VO2 \par
//d
//d {\b Version 1.8 (9/27/98)} \line
//d - Implemented changes from Graham McKechnie, the author OF PEDateSLE \line
//d - Added the Bitmap button back TO fileSLE, it IS called pbFileSLE \line
//d - fixed the bitmapbutton CLASS TO properly make the button move when
//d   pressed \par
//d
//d {\b Version 1.7 (9/19/98)} \line
//d -  Fixed a bug where IF you pressed ESC after entering the calendar from the PushButton, it would not
//d    let you out OF the datawindow \par
//d
//d {\b Version 1.6 (9/18/98)} \line
//d -  Added ACCESS ZeroPad - THIS ACCESS returns a STRING that IS left filled WITH zeros \line
//d -  Changed the deleted TO TO use the same LOGIC AS backspace \line
//d -  Fixed a problem WITH the calendar not handling Jan 31 TO Feb 29 WITH the right mouse Month selection \line
//d -  Fixed a LOGIC problem where READONLY was not being updated WITH enable or disable was being called. \line
//d
//d Thanks TO Robson Rodrigues FOR the heads up on the calendar issues!!! (and CODE samples!) \par
//d
//d {\b Version 1.5 (7/7/98)} \line
//d -  Fixed a problem WITH the picture not updating properly after a thousand seperator. \line
//d -  Replaced the last hardcoded "," and "." WITH the SetThousandSep() and SetDecimalSep(). \line
//d -  Fixed a bug WITH backspace that caused a numeric overflow. \par
//d
//d {\b Version 1.4} \line
//d fixed a bug where hitting . when all was selected would not realy let you enter the decimal. \line
//d Modified the calendar control TO all you TO hit enter TO RETURN the currently highlighted DATE. \line
//d changed the LOGIC where IF you start off the data entry WITH a -, the number stays negative \line
//d changed the LOGIC so when you hit the END OF the fieldspec, it stops processing the numbers (calls SELF:InvalidAction) \par
//d
//d {\b Version 1.3} \line
//d fixed a bug where the the SLE would not auto update a FIELD IF there
//d AS a direct link into a dataserver. \par
//d
//d {\b Version 1.2} \line
//d THIS version fixes many problems. The SLE can now INHERIT from an alingment off OF the WED and will properly
//d right ALIGN AS well AS allow FOR right entry. It also will remove the spaces from the left side OF a number
//d IF you position the cursor between the beginning and the actual 1st character OF the numeric. Here IS the modifacations that must be made TO the CAVOWED.INF
//d file TO allow you TO specify the alignment. \line
//d
//d [CONTROL:TEXTCONTROL:EDIT:SINGLELINEEDIT] \libe
//d WindowStyle19=Alignment,ES_LEFT:ES_CENTER|ES_MULTILINE:ES_RIGHT|ES_MULTILINE(EDITALIGN) \line
//d PropTabs=HyperLabel,GenSingleEdit:General,MultilineStyles:Styles,ExStyles \par
//d
//d
//d {\b Version 1.1} \line
//d THIS version removes the hardcoded decimal. It also handles the keyboard buffer placement. By moving the around,
//d you can control where the charaters are inserted. But they always go IN from the right. \line
//d
//d You still need a fieldspec TO make THIS work. IF it doesn not find a fieldspec, VO's normal dispatcher
//d IS called. THIS opens up the SLE TO OTHER enchancemets. FOR example, you can add CODE TO check FOR a
//d DATE fieldspec and then dispatch the dateSLE. So, by having all OF your SLE's INHERIT from THIS one,
//d you can automatically invoke the numeric sle or ANY OTHER one you chose. \par
//d
//d
//d
//d {\b Original:}
//d THIS IS a prototype OF my right aligned sle. It IS currently hard coded FOR a decimal TO be "."
//d It also requires a fieldspec TO be assigned. That IS where I am picking up the picture, and I use
//d the ofieldSpec:Transform() TO get my TEXT back into shape.
//d
//d Many Thanks TO Stephane Hebert who gave me a nice MLE example. I can be reached at Compuserve 74521,2102 and am open TO ANY suggestion and/or comments.
//d
//d Regards,
//d
//d Willie Moore
//d williem@wmConsulting
ENDTEXT


*/
