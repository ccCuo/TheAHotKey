#IfWinActive ahk_class UnrealWindow
CoordMode, Pixel, Screen
global repair := 1
global exp := 1
global die := 0
if not FileExist("skill.ini")
    {
    MsgBox Please create skill.ini     
    return
}
; 取色
^1::
inside(1)
return
^2::
inside(2)
return
^3::
inside(3)
return
^4::
inside(4)
return
^5::
inside(5)
return
^6::
inside(6)
return
^7::
inside(7)
return

F2::
; 读取数据
IniRead, Pla_team, skill.ini, platform, team
IniRead, Pla_go, skill.ini, platform, go

IniRead, NoUse_1, skill.ini, NoUseSkill, one
IniRead, NoUse_2, skill.ini, NoUseSkill, two

IniRead, Other_die, skill.ini, other, die
IniRead, Other_auto, skill.ini, other, auto
IniRead, Other_out, skill.ini, other, out

; 处理坐标
global Pla_team := StrSplit(Pla_team, A_Space)
global Pla_go := StrSplit(Pla_go, A_Space)

global NoUse_1 := StrSplit(NoUse_1, A_Space)
global NoUse_2 := StrSplit(NoUse_2, A_Space)

global Other_die := StrSplit(Other_die, A_Space)
global Other_auto := StrSplit(Other_auto, A_Space)
global Other_out := StrSplit(Other_out, A_Space)

global Pla_go := Pla_go[1]
global Other_auto := Other_auto[1]
global Other_out := Other_out[1]

loop{
    loop {
        sleep 1000
    }until (Getcolor(Pla_team[1] ,Pla_team[2],1))  

    ; sleep 5000
    ; click,1734,211 ; 封魔
    sleep 5000
    click,%Pla_go% ;进入
    sleep 5000

    loop{
        sleep 1000
    }until (Getcolor(NoUse_1[1] ,NoUse_1[2],1))   ;1

    sleep 1000
    send e
    sleep 1000
    ; 维修
    if ( repair >= 3 ){
        send 7
        sleep 8000
        repair :=1
    }
    if ( exp >= 15){
        send 8
        sleep 500
        exp :=1
    }
    sleep 1000
    send {w down}
    sleep 500
    send,{shift}
    sleep 10000
    send {w up}

    loop{
        sleep 1000
    }until (Getcolor(NoUse_1[1] ,NoUse_1[2],1))   ;1
    
    sleep 500
    send {w down}
    sleep 500
    send,{shift}
    sleep 4000
    send {w up}
    sleep 1000

    send {alt down}
    sleep 300
    click,%Other_auto% ; 自动战斗
    sleep 500
    send {alt up}

    loop{
        sleep 1000
        if ( Getcolor(Other_die[1],Other_die[2],1) ){
            die := 1
        }
        if ( Getcolor((1034,908),"0xD0BD98",1) ){
            send {x}
        }
    }until ( ( Getcolor(NoUse_1[1],NoUse_1[2],1) && Getcolor(NoUse_2[1],NoUse_2[2],1) ) ||  Getcolor(Other_die[1],Other_die[2],1) ) ; tab z v

    repair++
    exp++
    sleep 5000
    
    if ( die == 1 || Getcolor(Other_die[1],Other_die[2],1) ){
        die := 0
        sleep 3000
        send {4}
        loop{
            sleep 2000
        }until (Getcolor(NoUse_2[1],NoUse_2[2],1))
        sleep 5000
    }else{
        sleep 2000
        send {alt down}
        sleep 300
        click,%Other_auto% ; 自动战斗
        sleep 500
        send {alt up}
        sleep 5000
    }

    send {Esc}
    sleep 500
    click,%Other_out%
    sleep 500
    send y
    sleep 500

}

F11::Pause
return

GetColor(xy,c,Symbol)
{   
    xy := StrSplit(xy, ",")
    PixelGetColor, color, xy[1], xy[2], RGB
    StringRight color,color,10
    if ( ( Symbol == 1 && color == c ) || ( Symbol == 2 && color != c )  ) {
        return true
    }else{
        return false
    }
}

inside(e){
    MouseGetPos x, y
    PixelGetColor rgb, x, y, RGB
    colors = %x%,%y% %rgb%
    if ( e == 1 ){
        IniWrite, %colors%, skill.ini, platform, team
    }else if ( e == 2 ){
        IniWrite, %colors%, skill.ini, platform, go
    }else if ( e == 3 ){
        IniWrite, %colors%, skill.ini, NoUseSkill, one
    }else if ( e == 4 ){
        IniWrite, %colors%, skill.ini, NoUseSkill, two
    }else if ( e == 5 ){
        IniWrite, %colors%, skill.ini, other, die
    }else if ( e == 6 ){
        IniWrite, %colors%, skill.ini, other, auto
    }else if ( e == 7 ){
        IniWrite, %colors%, skill.ini, other, out
    }

    ToolTip %colors%
    SetTimer, RemoveToolTip, 3000 ;3秒后取消展示
    return
}

RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip



