#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>
#include <Math.au3>

Global Const $jndir = "E:\sedatools\examples\InGaAs_dpdgtfet_wf_46\ptype\"
Global Const $outdir = "E:\sedatools\examples\InGaAs_dpdgtfet_wf_46\ptype\outputs"
Global Const $outfname = "exportp"
Global Const $filename = "P_InGaAs_dpdgtfet_wf_4.6_ac_"
Global Const $start = -1
Global Const $stop = 1
Global Const $step = 0.05


; Check if window exists.
If NOT WinExists ("Tonyplot") Then
   Run("E:\sedatools\exe\tonyplot.exe")
   WinWaitActive("Tonyplot")
	  ; Check if error exists
	  If WinWaitActive("Sipc Server Error") Then
		 Send("{ENTER}")
	  EndIf
   WinWaitActive("Tonyplot")

ElseIf WinExists ("Tonyplot") Then
   ; Check if window is active.
	  ;If Not WinActive("Tonyplot") Then
		 ;WinSetState("Tonyplot", "", @SW_SHOW)
	  ;Endif
   ; Continue on with script.

   For $i = -1 To 1.05 Step 0.05
	  $j = Round($i, 2)
		 WinWaitActive("Tonyplot")
		 Sleep(100)
		 Send("^o")
		 Sleep(100)
		  WinWaitActive("Tonyplot: Open Files")
			   If WinWaitActive("Tonyplot: Open Files") Then
				  ControlFocus("Tonyplot: Open Files","","QWidget19")
				  Sleep(100)
				  ControlClick("Tonyplot: Open Files","","QWidget19")
				  Sleep(100)
				  Send("^a")
				  Sleep(100)
				  Send("{DELETE}")
				  Sleep(100)
				  Send($jndir) ;input file directory location
				  Sleep(100)
				  Send("{ENTER}")
				  Sleep(100)
				  ControlFocus("Tonyplot: Open Files","","QWidget45")
				  Sleep(100)
				  Send($filename & "(" & $j & ")" & '.log') ;file to be opened
				  Sleep(100)
				  ControlFocus("Tonyplot: Open Files","","QWidget45")
				  Sleep(100)
				  ControlFocus("Tonyplot: Open Files","","QWidget5")
				  Sleep(100)
				  ControlClick("Tonyplot: Open Files","","QWidget5")
				  Sleep(100)
				  Send("r")
				  Sleep(100)
				  Send("{ENTER}")
				  Sleep(100)
				  ControlClick("Tonyplot: Open Files","","QWidget21")
				  Sleep(100)
				  WinClose("Tonyplot: Open Files")
				  Sleep(100)
			   EndIf

			   ;opening file complete
			   WinActive("Tonyplot")
			   Send("!f")
			   Sleep(100)
			   Send("{DOWN 3}")
			   Sleep(100)
			   Send("{ENTER}")
			   Sleep(100)
			   WinWaitActive("Tonyplot: Export")

			   If WinActive("Tonyplot: Export") Then
				  ControlFocus("Tonyplot: Export","","QWidget12")
				  Sleep(100)
				  ControlClick("Tonyplot: Export","","QWidget12")
				  Sleep(100)
				  Send("c")
				  Sleep(100)
				  Send("{ENTER}")
				  ControlFocus("Tonyplot: Export","","QWidget8")
				  Sleep(100)
				  ControlClick("Tonyplot: Export","","QWidget8")
				  Sleep(100)
				  Send("^a")
				  Sleep(100)
				  Send("{DELETE}")
				  Sleep(100)
				  Send($outdir); use variable for export destination address
				  Sleep(100)
				  ControlFocus("Tonyplot: Export","","QWidget5")
				  Sleep(100)
				  ControlClick("Tonyplot: Export","","QWidget5")
				  Sleep(100)
				  Send("^a")
				  Send("{DELETE}")
				  Sleep(100)
				  Send($outfname & "(" & $j & ")"); use variable for output file name
				  Sleep(100)
				  ControlClick("Tonyplot: Export","","QWidget2")
				  Sleep(100)
			   EndIf

			   Sleep(100)
			   WinWaitActive("Tonyplot Information")

			   If WinActive("Tonyplot Information") Then
				  Sleep(100)
				  ControlClick("Tonyplot Information","","QWidget1")
			   EndIf
			   Sleep(1000)
			   ;export completed add delay of 30sec
			Next

    EndIf

Exit

