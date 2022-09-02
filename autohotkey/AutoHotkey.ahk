; ## Menu ##
#H::WinMinimize, A
!#H::HideOtherWindow()
#Q::Send !{F4}

; File
#T::Send ^t
+#T::Send +^t
#N::Send ^n
+#N::Send +^n
#O::Send ^o
#W::Send ^w
#+W::Send #w
#S::Send ^s
#P::Send ^p
#+P::Send #p

; Edit
#Backspace::Send ^{Backspace} 
#Z::Send ^z
+#Z::Send ^y
#X::Send ^x
#C::Send ^c
#V::Send ^v
!+#V::
  clipboard = %clipboard%
  Send ^v
return
#A::Send ^a
#F::Send ^f
!#F::Send ^h
#Left::Send {Home}
#Right::Send {End}
#Up::Send {PgUp}
#Down::Send {PgDn}
<!Left::Send ^{Left}
<!Right::Send ^{Right}
#+Left::Send +{Home}
#+Right::Send +{End}
#+Up::Send +{PgUp}
#+Down::Send +{PgDn}
!+Left::Send +^{Left}
!+Right::Send +^{Right}

; Tab Switching
#Tab::Send ^{Tab}
+#Tab::Send +^{Tab}
; View
^#F::Send {F11}
#=::Send ^{WheelUp}
#-::Send ^{WheelDown}
#0::Send ^0
#R::Send {F5}

; Screenshots
+#3::Send {PrintScreen}
+#4::Send +#s
+#5::
  try {
    Run, "C:\Windows\System32\SnippingTool.exe"
  }
Return
#F3::Send #d
#!Escape::
  try {
    Run, "C:\Windows\System32\Taskmgr.exe"
  }
Return

; ## Special Key ##
#`::NextWindow()


; ## Hotstrings ##
:*:]date::
  FormatTime, CurrentDateTime,, yyyy-M-d
  SendInput %CurrentDateTime%
return
:*:]time::
  FormatTime, CurrentDateTime,, HH:mm:ss
  SendInput %CurrentDateTime%
return
:*:]now::
  FormatTime, CurrentDateTime,, yyyy-M-d HH:mm:ss
  SendInput %CurrentDateTime%
return
:*:]longdate::
  FormatTime, CurrentDateTime,, LongDate
  SendInput %CurrentDateTime%
return

; ## App Switcher ## 
; firefox
F15 & x::
SetTitleMatchMode, 2
If WinExist ("ahk_exe firefox.exe")
{
    WinActivate, ahk_exe firefox.exe
    WinWaitActive, ahk_exe firefox.exe
}
return

; Slack
F15 & s::
SetTitleMatchMode, 2
If WinExist ("ahk_exe Slack.exe")
{
    WinActivate, ahk_exe Slack.exe
    WinWaitActive, ahk_exe Slack.exe
}
return

; Outlook
F15 & o::
SetTitleMatchMode, 2
If WinExist ("ahk_exe Outlook.exe")
{
    WinActivate, ahk_exe Outlook.exe
    WinWaitActive, ahk_exe Outlook.exe
}
return

; Spotify
F15 & q::
SetTitleMatchMode, 2
If WinExist ("ahk_exe Spotify.exe")
{
    WinActivate, ahk_exe Spotify.exe
    WinWaitActive, ahk_exe Spotify.exe
}
return

; Teams
F15 & t::
SetTitleMatchMode, 2
If WinExist ("ahk_exe Teams.exe")
{
    WinActivate, ahk_exe Teams.exe
    WinWaitActive, ahk_exe Teams.exe
}
return

; Terminal
F15 & a::
SetTitleMatchMode, 2
If WinExist ("ahk_exe WindowsTerminal.exe")
{
    WinActivate, ahk_exe WindowsTerminal.exe
    WinWaitActive, ahk_exe WindowsTerminal.exe
}
else
{
Run "C:\Program Files (x86)\Google\Chrome\Application\WindowsTerminal.exe"
WinActivate, ahk_exe WindowsTerminal.exe
}
return

; Chrome
F15 & c::
SetTitleMatchMode, 2
If WinExist ("ahk_exe chrome.exe")
{
    WinActivate, ahk_exe chrome.exe
    WinWaitActive, ahk_exe chrome.exe
    ;Send, {Ctrl Down}t{Ctrl Up}
}
else
{
Run "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
WinActivate, ahk_exe chrome.exe
;Send ^l
;Send ^t
}
return

; Functions
HideOtherWindow()
{
  WinGetClass, cur_class, A
  DetectHiddenText, Off
  WinGet, id, list,,, Program Manager
  Loop, %id%
  {
    this_id := id%A_Index%
    WinGetClass, this_class, ahk_id %this_id%
    if (this_class = cur_class or this_class = "Progman" or this_class = "WorkerW" or this_class = "Shell_TrayWnd" or this_class = "Internet Explorer_Hidden") {
      continue
    }
    WinMinimize, ahk_id %this_id%
  }
}

NextWindow()
{
  WinGetClass, cur_class, A
  acitve_id := 0
  DetectHiddenText, On
  WinGet, id, list,,, Program Manager
  ; don't break the loop
  Loop, %id%
  {
    this_id := id%A_Index% 
    WinGetClass, this_class, ahk_id %this_id%
    if (this_class != cur_class) {
      continue
    }
    if (acitve_id = 0) {
      active_id := this_id
    }
  }
  if (active_id != 0) {
    WinActivate, ahk_id %active_id%
  }
}

/**
 * Resizes and moves the active window to a given position on a grid
 * @param {integer} numRows   The number of rows in the grid
 * @param {integer} numCols   The number of columns in the grid
 * @param {integer} row       The specific row within the grid to place the window
 * @param {integer} col       The specific column within the grid to place the window
 *
 * @example (Snap a window to the left third of the screen)
 * SnapActiveWindowGrid(1, 3, 1, 1);
 *
 * @example (Snap a window to the bottom half of the screen)
 * SnapActiveWindowGrid(2, 1, 2, 1);
 */
SnapActiveWindowGrid(numRows, numCols, row, col) {
    SnapActiveWindowGridSpan(numRows, numCols, row, col, 1, 1)
}

/**
 * Resizes and moves the active window to a given position on a grid, applying a rowSpan and colSpan
 * @param {integer} numRows   The number of rows in the grid
 * @param {integer} numCols   The number of columns in the grid
 * @param {integer} row       The specific row within the grid to place the window
 * @param {integer} col       The specific column within the grid to place the window
 * @param {integer} rowSpan   The specific row within the grid to place the window
 * @param {integer} colSpan   The specific column within the grid to place the window
 *
 * @example (Given a 4-column layout, snap a window to the rightmost column)
 * SnapActiveWindowGridSpan(1, 4, 1, 1, 1, 1);
 *
 * @example (Given a 4-column layout, snap a window to the centermost columns)
 * SnapActiveWindowGridSpan(1, 4, 1, 1, 1, 2);
 */
SnapActiveWindowGridSpan(numRows, numCols, row, col, rowSpan, colSpan) {

    WinGet activeWin, ID, A

    activeMon := GetMonitorIndexFromWindow(activeWin)

    SysGet, MonitorWorkArea, MonitorWorkArea, %activeMon%

    ; Determine the width and height of a grid cell
    height := (MonitorWorkAreaBottom - MonitorWorkAreaTop)/numRows
    width := (MonitorWorkAreaRight - MonitorWorkAreaLeft)/numCols

    ; Determine the x and y offsets
    posX  := MonitorWorkAreaLeft + (col - 1) * width
    posY  := MonitorWorkAreaTop + (row - 1) * height

    ; Apply rowSpan/colSpan after determining offsets
    width *= colSpan
    height *= rowSpan

    ; Use WinGetPosEx to determine position/size offsets (to remove gaps around windows)
    WinGetPosEx(activeWin, X, Y, realWidth, realHeight, offsetX, offsetY)

    ; Move and resize the active window
    WinMove, A,, (posX + offsetX), (posY + offsetY), (width + offsetX * -2), (height + (offsetY - 2) * -2)
}

GetMonitorIndexFromWindow(windowHandle) {
    ; Starts with 1.
    monitorIndex := 1

    VarSetCapacity(monitorInfo, 40)
    NumPut(40, monitorInfo)

    if (monitorHandle := DllCall("MonitorFromWindow", "uint", windowHandle, "uint", 0x2))
        && DllCall("GetMonitorInfo", "uint", monitorHandle, "uint", &monitorInfo) {
        monitorLeft   := NumGet(monitorInfo,  4, "Int")
        monitorTop    := NumGet(monitorInfo,  8, "Int")
        monitorRight  := NumGet(monitorInfo, 12, "Int")
        monitorBottom := NumGet(monitorInfo, 16, "Int")
        workLeft      := NumGet(monitorInfo, 20, "Int")
        workTop       := NumGet(monitorInfo, 24, "Int")
        workRight     := NumGet(monitorInfo, 28, "Int")
        workBottom    := NumGet(monitorInfo, 32, "Int")
        isPrimary     := NumGet(monitorInfo, 36, "Int") & 1

        SysGet, monitorCount, MonitorCount

        Loop, %monitorCount% {
            SysGet, tempMon, Monitor, %A_Index%

            ; Compare location to determine the monitor index.
            if ((monitorLeft = tempMonLeft) and (monitorTop = tempMonTop)
                and (monitorRight = tempMonRight) and (monitorBottom = tempMonBottom)) {
                monitorIndex := A_Index
                break
            }
        }
    }

    return %monitorIndex%
}
;-------------------------------------------------------------------------------
WinGetPosEx(hWindow,ByRef X="",ByRef Y="",ByRef Width="",ByRef Height="",ByRef Offset_X="",ByRef Offset_Y="") {
    Static Dummy5693
          ,RECTPlus
          ,S_OK:=0x0
          ,DWMWA_EXTENDED_FRAME_BOUNDS:=9

    ;-- Workaround for AutoHotkey Basic
    PtrType:=(A_PtrSize=8) ? "Ptr":"UInt"

    ;-- Get the window's dimensions
    ;   Note: Only the first 16 bytes of the RECTPlus structure are used by the
    ;   DwmGetWindowAttribute and GetWindowRect functions.
    VarSetCapacity(RECTPlus,24,0)
    DWMRC:=DllCall("dwmapi\DwmGetWindowAttribute"
        ,PtrType,hWindow                                ;-- hwnd
        ,"UInt",DWMWA_EXTENDED_FRAME_BOUNDS             ;-- dwAttribute
        ,PtrType,&RECTPlus                              ;-- pvAttribute
        ,"UInt",16)                                     ;-- cbAttribute

    if (DWMRC<>S_OK)
        {
        if ErrorLevel in -3,-4  ;-- Dll or function not found (older than Vista)
            {
            ;-- Do nothing else (for now)
            }
         else
            outputdebug,
               (ltrim join`s
                Function: %A_ThisFunc% -
                Unknown error calling "dwmapi\DwmGetWindowAttribute".
                RC=%DWMRC%,
                ErrorLevel=%ErrorLevel%,
                A_LastError=%A_LastError%.
                "GetWindowRect" used instead.
               )

        ;-- Collect the position and size from "GetWindowRect"
        DllCall("GetWindowRect",PtrType,hWindow,PtrType,&RECTPlus)
        }

    ;-- Populate the output variables
    X:=Left :=NumGet(RECTPlus,0,"Int")
    Y:=Top  :=NumGet(RECTPlus,4,"Int")
    Right   :=NumGet(RECTPlus,8,"Int")
    Bottom  :=NumGet(RECTPlus,12,"Int")
    Width   :=Right-Left
    Height  :=Bottom-Top
    OffSet_X:=0
    OffSet_Y:=0

    ;-- If DWM is not used (older than Vista or DWM not enabled), we're done
    if (DWMRC<>S_OK)
        Return &RECTPlus

    ;-- Collect dimensions via GetWindowRect
    VarSetCapacity(RECT,16,0)
    DllCall("GetWindowRect",PtrType,hWindow,PtrType,&RECT)
    GWR_Width :=NumGet(RECT,8,"Int")-NumGet(RECT,0,"Int")
        ;-- Right minus Left
    GWR_Height:=NumGet(RECT,12,"Int")-NumGet(RECT,4,"Int")
        ;-- Bottom minus Top

    ;-- Calculate offsets and update output variables
    NumPut(Offset_X:=(Width-GWR_Width)//2,RECTPlus,16,"Int")
    NumPut(Offset_Y:=(Height-GWR_Height)//2,RECTPlus,20,"Int")
    Return &RECTPlus
}

;; ========================================================================================================
;; Window Management 
;; ========================================================================================================
;; ---------------------------------------------------
;; Window Movement
;; ---------------------------------------------------
; Move window left one monitor
#If, GetKeyState("Shift")
F15 & h::
    Send #+{Left}
return
; Move window right one monitor
#If, GetKeyState("Shift")
F15 & l::
    Send #+{Right}
return
#If
;; ---------------------------------------------------
;; Fullscreen
;; ---------------------------------------------------
F15 & f:: 
WinGet, vPName, ProcessName, % "ahk_id " hWnd
SetFull:
    {
	WinSet, Style, -0x400000, A ; hides the dialog frame
    WinSet, Style, -0x40000,  A ; hides the sizebox/thickframe
    WinSet, Style, -0x800000, A ; hides the thin-line border
    WinSet, Style, -0xC00000, A ; hides the title bar
    WinSet, Style, -0xC40000, A ; Toggle state to Full
    WinMove, A, , 0, 0, %A_ScreenWidth%, %A_ScreenHeight% ; resize to screen dimensions
Return
}
;; ---------------------------------------------------
;; Halves
;; ---------------------------------------------------
; Snap to left half of screen
; 1 row, 4 columns, first row, second column, rowspan 1, colspan 2
F15 & h::SnapActiveWindowGrid(1, 2, 1, 1)
; Snap to center half of screen
; 1 row, 4 columns, first row, second column, rowspan 1, colspan 2
F15 & 0::SnapActiveWindowGridSpan(1, 4, 1, 2, 1, 2)
; Snap to right half of screen
; 1 row, 4 columns, first row, second column, rowspan 1, colspan 2
F15 & l::SnapActiveWindowGrid(1, 2, 1, 2)

;; ---------------------------------------------------
;; Thirds
;; ---------------------------------------------------
; Snap to left third of screen
F15 & 1::SnapActiveWindowGrid(1, 3, 1, 1)
; Snap to center third of screen
F15 & 2::SnapActiveWindowGrid(1, 3, 1, 2)
; Snap to center third of screen
F15 & 3::SnapActiveWindowGrid(1, 3, 1, 3)
;; ---------------------------------------------------
;; Fourths
;; ---------------------------------------------------
; Shift + 1234
#If, GetKeyState("Shift")
; Snap to first fourth of screen (Win + Alt + Numpad)
F15 & 1::SnapActiveWindowGrid(1, 4, 1, 1)
; Snap to second fourth of screen (Win + &  Alt + &  Numpad)
F15 & 2::SnapActiveWindowGrid(1, 4, 1, 2)
; Snap to third fourth of screen (Win + &  Alt + &  Numpad)
F15 & 3::SnapActiveWindowGrid(1, 4, 1, 3)
; Snap to fourth fourth of screen (Win + &  Alt + &  Numpad)
F15 & 4::SnapActiveWindowGrid(1, 4, 1, 4)
#If
