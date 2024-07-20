// Version_Notes.prg

// *****************************************************
// * V 1.0.3 5/03/2010                                 *
// *****************************************************
/*
   Fixed an issue with a the number was not being handled
   correctly if an keyboard setting was not
   us english (typing 1 would come back as 100.00 if the number 
   typed was to the imidiate left of the decimal)
*/


// *****************************************************
// * V 1.0.2 4/28/2010                                 *
// *****************************************************
/*
   Fixed an issue with a picture clause of "XX" was
      not processing the backspace key properly
*/

// *****************************************************
// * V 1.0.1 4/27/2010                                 *
// *****************************************************
/*
   Added a new class called rightSLEString
      This class will facilitate international users
      It is a static class that lets you substitute 
      rightSLE menu items with your own language. 
      This works on all context menus.
   Fixed an issue with negative numbers. rightSLE was
      incorrectly handling negative numbers
   Changed the onParentChanged. onEnableChanged to
      call the super method if I am not handing it.
*/

// *****************************************************
// * V 1.0  4/21/2010                                  *
// *****************************************************
/*
 Initial Release
*/