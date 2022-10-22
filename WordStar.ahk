;;
;; An autohotkey script that provides emacs-like keybinding on Windows
;;
#InstallKeybdHook
#UseHook

; The following line is a contribution of NTEmacs wiki http://www49.atwiki.jp/ntemacs/pages/20.html
SetKeyDelay 0

; turns to be 1 when ctrl-k is pressed
is_pre_k = 0
; turns to be 1 when ctrl-q is pressed
is_pre_q = 0
; turns to be 1 when ctrl-k ctrl-b is pressed
is_marked = 0

; Applications you want to disable emacs-like keybindings
; (Please comment out applications you don't use)
is_target()
{
  IfWinActive,ahk_class ConsoleWindowClass ; Cygwin
    Return 1
  IfWinActive,ahk_class mintty ; Cygwin
    Return 1
  IfWinActive,ahk_class MEADOW ; Meadow
    Return 1
  IfWinActive,ahk_class cygwin/x X rl-xterm-XTerm-0
    Return 1
  IfWinActive,ahk_class MozillaUIWindowClass ; keysnail on Firefox
    Return 1
  ; Avoid VMwareUnity with AutoHotkey
  IfWinActive,ahk_class VMwareUnityHostWndClass
    Return 1
  IfWinActive,ahk_class Vim ; GVIM
    Return 1
  IfWinActive,ahk_class SWT_Window0 ; Eclipse
    Return 1
  IfWinActive,ahk_class Xming X
    Return 1
  IfWinActive,ahk_class SunAwtFrame
    Return 1
  IfWinActive,ahk_class Emacs ; NTEmacs
    Return 1
  IfWinActive,ahk_class XEmacs ; XEmacs on Cygwin
    Return 1
  Return 0
}

delete_char()
{
  Send {Del}
  global is_marked = 0
  Return
}
delete_backward_char()
{
  Send {BS}
  global is_marked = 0
  Return
}
kill_line()
{
  Send {Home}{ShiftDown}{End}{ShiftUp}
  Sleep 50 ;[ms] this value depends on your environment
  Send ^x
  global is_marked = 0
  global is_pre_k  = 0
  Return
}
kill_forward_word()
{
  Send {ShiftDown}^{Right}{ShiftUp}
  Sleep 50 ;[ms] this value depends on your environment
  Send ^x
  global is_marked = 0
  Return
}
kill_backward_word()
{
  Send {ShiftDown}^{Left}{ShiftUp}
  Sleep 50 ;[ms] this value depends on your environment
  Send ^x
  global is_marked = 0
  Return
}
kill_to_beginning_of_line()
{
  Send {ShiftDown}{Home}{ShiftUp}
  Sleep 50 ;[ms] this value depends on your environment
  Send ^x
  global is_marked = 0
  global is_pre_q  = 0
  Return
}
kill_to_end_of_line()
{
  Send {ShiftDown}{End}{ShiftUp}
  Sleep 50 ;[ms] this value depends on your environment
  Send ^x
  global is_marked = 0
  global is_pre_q  = 0
  Return
}
open_line()
{
  Send {END}{Enter}{Up}
  global is_marked = 0
  global is_pre_k  = 0
  global is_pre_q  = 0
  Return
}
quit()
{
  Send {ESC}
  global is_marked = 0
  global is_pre_k  = 0
  global is_pre_q  = 0
  Return
}
newline()
{
  Send {Enter}
  global is_marked = 0
  global is_pre_k  = 0
  global is_pre_q  = 0
  Return
}
indent_for_tab_command()
{
  Send {Tab}
  global is_marked = 0
  global is_pre_k  = 0
  global is_pre_q  = 0
  Return
}
newline_and_indent()
{
  Send {Enter}{Tab}
  global is_marked = 0
  global is_pre_k  = 0
  global is_pre_q  = 0
  Return
}
isearch_forward()
{
  Send ^f
  global is_marked = 0
  global is_pre_q  = 0
  Return
}
isearch_backward()
{
  Send ^f
  global is_marked = 0
  global is_pre_q  = 0
  Return
}
hunt_forward()
{
  Send {F3}
  Return
}
hunt_backward()
{
  Send +{F3}
  global is_pre_q  = 0
  Return
}


kill_region()
{
  Send ^x
  global is_marked = 0
  global is_pre_K  = 0
  Return
}
kill_ring_save()
{
  Send ^c
  global is_marked = 0
  global is_pre_K  = 0
  Return
}
yank()
{
  Send ^v
  global is_marked = 0
  global is_pre_K  = 0
  Return
}
undo()
{
  Send ^z
  global is_marked = 0
  Return
}
find_file()
{
  Send ^o
  global is_pre_K  = 0
  Return
}
save_buffer()
{
  Send, ^s
  global is_pre_k = 0
  Return
}
kill_emacs()
{
  Send !{F4}
  global is_pre_K  = 0
  Return
}

move_beginning_of_line()
{
  if is_marked
    Send +{HOME}
  Else
    Send {HOME}
  global is_pre_q = 0
  Return
}
move_end_of_line()
{
  if is_marked
    Send +{END}
  Else
    Send {END}
  global is_pre_q = 0
  Return
}
move_beginning_of_file()
{
  if is_marked
    Send ^+{HOME}
  Else
    Send ^{HOME}
  global is_pre_q = 0
  Return
}
move_end_of_file()
{
  if is_marked
    Send ^+{END}
  Else
    Send ^{END}
  global is_pre_q = 0
  Return
}
previous_line()
{
  global
  if is_marked
    Send +{Up}
  Else
    Send {Up}
  Return
}
next_line()
{
  global
  if is_marked
    Send +{Down}
  Else
    Send {Down}
  Return
}
forward_char()
{
  global
  if is_marked
    Send +{Right}
  Else
    Send {Right}
  Return
}
backward_char()
{
  global
  if is_marked
    Send +{Left}
  Else
    Send {Left}
  Return
}
forward_word()
{
  global
  if is_marked
    Send +^{Right}
  Else
    Send ^{Right}
  Return
}
backward_word()
{
  global
  if is_marked
    Send +^{Left}
  Else
    Send ^{Left}
  Return
}


page_up()
{
  if is_marked
    Send +{PgUp}
  Else
    Send {PgUp}
  global is_pre_q = 0
  Return
}
page_down()
{
  if is_marked
    Send +{PgDn}
  Else
    Send {PgDn}
  global is_pre_q = 0
  Return
}

scroll_up()
{
  GetKeyState, state, ScrollLock, T
  If state = D
    Send {ScrollLock}{Up}{ScrollLock}
  Else
    Send {Up}
  Return
}
scroll_down()
{
  GetKeyState, state, ScrollLock, T
  If state = D
    Send {ScrollLock}{Down}{ScrollLock}
  Else
    Send {Down}
  Return
}

toggle_insert()
{
  Send {Ins}
  Return
}

help()
{
  Send {F1}
  return
}

goto_line()
{
  Send ^g
  return
}

^a::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
    If is_pre_k
      global is_pre_k = 0
    Else If is_pre_q
      global is_pre_q = 0
    Else
      backward_word()
  }
  return
^b::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
    If is_pre_k
    {
       global is_marked = 1
       global is_pre_k = 0
    }
  }
  return
^c::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
    If is_pre_k
      yank()
    Else If is_pre_q
      move_end_of_file()
    Else
      page_down()
  }
  return
^d::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
    If is_pre_k
      global is_pre_k = 0
    Else If is_pre_q
      move_end_of_line()
    Else
      forward_char()
  }
  return
^e::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
    If is_pre_k
      global is_pre_k = 0
    Else If is_pre_q
      global is_pre_q = 0
    Else
      previous_line()
  }
  return
^f::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
    If is_pre_k
      global is_pre_k = 0
    Else If is_pre_q
      isearch_forward()
    Else
      forward_word()
  }
  return
^g::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
    If is_pre_k
      global is_pre_k = 0
    Else If is_pre_q
      global is_pre_q = 0
    Else
      delete_char()
  }
  return
^h::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
    If is_pre_k
      global is_pre_k = 0
    Else If is_pre_q
      kill_to_beginning_of_line()
    Else
      delete_backward_char()
  }
  return
^i::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
    If is_pre_k
      global is_pre_k = 0
    Else If is_pre_q
      global is_pre_q = 0
    Else
      indent_for_tab_command()
  }
  Return
^j::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
    If is_pre_k
      global is_pre_k = 0
    Else If is_pre_q
      goto_line()
    Else
      help()
  }
  Return
^k::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
    If is_pre_k
      Kill_ring_save()
    Else If is_pre_q
      global is_pre_q = 0
    Else
      global is_pre_k = 1
  }
  Return
^l::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
    If is_pre_k
      global is_pre_k = 0
    Else If is_pre_q
      hunt_backward()
    Else
      hunt_forward()
  }
  Return
^m::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
    If is_pre_k
      global is_pre_k = 0
    Else If is_pre_q
      global is_pre_k = 0
    Else
      newline()
  }
  Return
^q::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
    If is_pre_k
      kill_emacs()
    Else If is_pre_q
      global is_pre_q = 0
    Else
      global is_pre_q = 1
  }
  Return
^r::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
    If is_pre_k
      kill_emacs()
    Else If is_pre_q
      move_beginning_of_file()
    Else
      page_up()
  }
  Return
^s::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
    If is_pre_k
      save_buffer()
    Else If is_pre_q
      move_beginning_of_line()
    Else
      backward_char()
  }
  Return
^t::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
    If is_pre_k
      global is_pre_k = 0
    Else If is_pre_q
      kill_backward_word()
    Else
      kill_forward_word()
  }
  Return
^u::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
    If is_pre_k
      global is_pre_k = 0
    Else If is_pre_q
      global is_pre_q = 0
    Else
      undo()
  }
  Return
^v::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
    If is_pre_k
      global is_pre_k = 0
    Else If is_pre_q
      global is_pre_q = 0
    Else
      toggle_insert()
  }
  Return
^w::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
    If is_pre_k
      save_buffer()
    Else If is_pre_q
      global is_pre_q = 0
    Else
      scroll_up()
  }
  Return
^x::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
    If is_pre_k
      kill_emacs()
    Else If is_pre_q
      global is_pre_q = 0
    Else
      next_line()
  }
  Return
^y::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
    If is_pre_k
      kill_region()
    Else If is_pre_q
      global is_pre_q = 0
    Else
      kill_line()
  }
  Return
^z::
  If is_target()
    Send %A_ThisHotkey%
  Else
  {
    If is_pre_k
      global is_pre_k = 0
    Else If is_pre_q
      global is_pre_q = 0
    Else
      scroll_down()
  }
  Return
