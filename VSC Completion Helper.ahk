; Comments in AutoHotkey look like this.

; Scripts for converting code to a format that can be used for Visual Studio Code's code snippets.
; Made for personal use, but feel free to use it if you want.
; Works about 98% of the time, but still better than doing it manually by about 1000%.

count := 1

^w::
Send {Home}
Send "
Send {Delete}
Send {End}
Send "
Send, {,}
Send {Down}
Send {Home}
Return
; This script will convert a line of code to the json that VSCode uses


^b::
Toggle := !Toggle
Loop
{
    If (!Toggle)
        Break

Send {Home}
Send "
Send {End}
Send "
Send, {,}
Send {Down}
Send {Home}
Sleep 200
}
Return

^n::
Toggle := !Toggle
Return
; An auto version of the above script, has a cancel key which I recommend you use as the break key doesn't work sometimes.

;\n is the new line character will add a new line when the snippet is used.
^e::
Send \n


^q::
Send {Delete}
Send \t
Return
; After converting the code to json, convert the indents to \t using this script.

^r::
Send $%count%
count++
Return
; add variables to the snippet, automatically increments the next number.

^f::
count := 1
Return
; reset the variable count after you're done with the snippet.