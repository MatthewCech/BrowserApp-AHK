if 0 != 1 ;Check %0% to see how many parameters were passed in
{
    msgbox ERROR: There are %0% parameters. There should be 1 parameter exactly.
}
else
{
    param = %1%  ;Fetch the contents of the command line argument

    ; This should be the URL Protocol that you registered in the Windows Registry.
    ; This can be found in the similarly named file with the .reg extension.
    appurl := "appurl://" 

    IfInString, param, %appurl%
    {
        arglen := StrLen(param)         ; Length of entire argument
        applen := StrLen(appurl)        ; Length of appurl
        len := arglen - applen          ; Length of argument less appurl
        StringRight, param, param, len  ; Remove appurl portion from the beginning of parameter
    }

    Run, %param%
}