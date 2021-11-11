WinGet, id, List,,, Program Manager
bnsid := 0
Loop, %id%
{
    this_id := id%A_Index%
    WinGetClass, this_class, ahk_id %this_id%
        checkClass := StrReplace(this_class, A_Space, "")
        if ( checkClass == "LaunchUnrealUWindowsClient" ){
            MsgBox, %this_id%
        }
}Until (bnsid! = 0)