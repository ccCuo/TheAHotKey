#IfWinActive ahk_class UnrealWindow
CoordMode, Pixel, Screen

global setNumber := 1
global times := 1
global RICH := 1
global itdie := 2
IniRead, pressc, site.ini, c, key

MsgBox "Potato is runing! Press F2 to start~"
F2::
if not FileExist("skill.ini"){
        MsgBox Please create skill.ini     
        return
    }else{
        ; 读取数据
        IniRead, 1skill, skill.ini, skills, 1          
        IniRead, 2skill, skill.ini, skills, 2          
        IniRead, 3skill, skill.ini, skills, 3          
        IniRead, cskill, skill.ini, skills, c
        IniRead, xskill, skill.ini, skills, x
        IniRead, zskill, skill.ini, skills, z          
        IniRead, rskill, skill.ini, skills, r
        IniRead, eskill, skill.ini, skills, e
        IniRead, eGreyskill, skill.ini, skills, eGrey
        IniRead, 2Greyskill, skill.ini, skills, 2Grey
        IniRead, 4Greyskill, skill.ini, skills, 4Grey
        IniRead, dieskill, skill.ini, skills, die

        IniRead, exitsPlatform, skill.ini, platform, exits
        IniRead, select1Platform, skill.ini, platform, select1
        IniRead, turnPlatform, skill.ini, platform, turn
        IniRead, select2Platform, skill.ini, platform, select2
        IniRead, goPlatform, skill.ini, platform, go

        IniRead, triangleInside, skill.ini, inside, triangle
        IniRead, missionboxInside, skill.ini, inside, missionbox
        IniRead, groundboxInside, skill.ini, inside, groundbox
        IniRead, outsideInside, skill.ini, inside, outside
        IniRead, greypeopleInside, skill.ini, inside, greypeople
        IniRead, backpackInside, skill.ini, inside, backpack
        IniRead, backpackExitInside, skill.ini, inside, backpackExit
        IniRead, repairInside, skill.ini, inside, repair

        IniRead, scroll1Scroll, skill.ini, scroll, scroll1
        IniRead, scroll2Scroll, skill.ini, scroll, scroll2
        IniRead, scroll3Scroll, skill.ini, scroll, scroll3
        IniRead, scroll4Scroll, skill.ini, scroll, scroll4

        ; 处理坐标
        global 1skill := StrSplit(1skill, A_Space)
        global 2skill := StrSplit(2skill, A_Space)
        global 3skill := StrSplit(3skill, A_Space)
        global cskill := StrSplit(cskill, A_Space)
        global xskill := StrSplit(xskill, A_Space)
        global zskill := StrSplit(zskill, A_Space)
        global rskill := StrSplit(rskill, A_Space)
        global eskill := StrSplit(eskill, A_Space)
        global eGreyskill := StrSplit(eGreyskill, A_Space)
        global 2Greyskill := StrSplit(2Greyskill, A_Space)
        global 4Greyskill := StrSplit(4Greyskill, A_Space)
        global dieskill := StrSplit(dieskill, A_Space)

        global exitsPlatform := StrSplit(exitsPlatform, A_Space)
        global select1Platform := StrSplit(select1Platform, A_Space)
        global turnPlatform := StrSplit(turnPlatform, A_Space)
        global select2Platform := StrSplit(select2Platform, A_Space)
        global goPlatform := StrSplit(goPlatform, A_Space)

        global triangleInside := StrSplit(triangleInside, A_Space)
        global missionboxInside := StrSplit(missionboxInside, A_Space)
        global groundboxInside := StrSplit(groundboxInside, A_Space)
        global outsideInside := StrSplit(outsideInside, A_Space)
        global greypeopleInside := StrSplit(greypeopleInside, A_Space)
        global backpackInside := StrSplit(backpackInside, A_Space)
        global backpackExitInside := StrSplit(backpackExitInside, A_Space)
        global repairInside := StrSplit(repairInside, A_Space)

        global scroll1Scroll := StrSplit(scroll1Scroll, A_Space)
        global scroll2Scroll := StrSplit(scroll2Scroll, A_Space)
        global scroll3Scroll := StrSplit(scroll3Scroll, A_Space)
        global scroll4Scroll := StrSplit(scroll4Scroll, A_Space)
}
sleep 3000
loop{   
    times := 1
    RICH := 1
    itdie := 2
    loop{
        sleep 1000
    }until ( Getcolor(1skill[1],1skill[2],1) )  
    sleep 2000
    send,{w up}
    sleep 500
    send {Left down}
    sleep 1400
    send {Left up}
    sleep 500
    send {w down}
    sleep 500
    send,{shift}
    sleep 8000
    send {w up}
    sleep 10000

    ; 起始点
    loop{
        sleep 2000
    }Until (GetColor(triangleInside[1],triangleInside[2],1))   ; 进门后右上角地图角标
        send, {w down}
        sleep 20000
       
        send, {w up} 
        sleep 1000
        send,{a down}
        
        loop{
            sleep 10
            times++
        }Until (GetColor(2skill[1],2skill[2],1) || times>= 1500) ; 向左校对老1  遇怪变亮技能
        sleep 130
        send,{a up}

        if (times >= 1500){  
            send {w down}
            sleep 1000
            send {w up}
            sleep 1000
            send,{d down}
            loop{
                sleep 50
            }Until ( GetColor(2skill[1],2skill[2],1) )
            sleep 80
            send {d up}
        }
        sleep 2000
        ; 打看门
        Fight(1) 
        
        sleep 5000
        ; 跑路
        send, {w down} 
        sleep 8000
        send, {Shift}
        sleep 5000
        send, {Space down}
        sleep 1000
        send, {Space up} 
        sleep 1000
        ; 下落
        send, {w up} 
        sleep 100
        send {Space} 
        sleep 500
        send,{w down}
        sleep 1000
        send {w up}
        sleep 500
        
        send,{w down}
        loop{
            sleep 10
        }Until (GetColor(2skill[1],2skill[2],1) ) ; 向左校对老1  遇怪变亮技能
        sleep 500
        send,{w up}
        sleep 1000
        ; 老一
        Fight(2) 
        sleep 2000
        ; ToolTip %itdie%
        ; SetTimer, RemoveToolTip, 2000 
        if ( itdie == 1 ){
            Continue
        }  
        ; 过图
        send,{w down}
        ; loop{ 
            
        ; }Until (GetColor(17,1064) !="0x81582A")          ; 左下角取色
        ; send,{esc}

        GetLast()  ; 尾王遇见
        sleep 3000
        Fight(3)   ; 尾王开打

        ; 循环的尾王
        ; loop{
        ;     ; 中途死掉  *
        ;     if (Getcolor(dieskill[1],dieskill[2],1 )){ 
        ;         sleep 2000
        ;         send 4
        ;         sleep 10000
        ;         GetLast()  ; 尾王遇见(re)
        ;         Fight(3)   ; 尾王开打
        ;     }
        ; }Until ( GetColor(missionboxInside[1],missionboxInside[2],1))   ; 判断右边任务箱子  

        
        sleep 2000
        send {d down}
        sleep 300
        send {d up}
        send {w down}
        wtimer := 1
        loop{
            sleep 20
            wtimer++
        }until (Getcolor(groundboxInside[1],groundboxInside[2],1) || wtimer >= 350) ;F箱子
        send {w up}
        sleep 500
        ; 直走捡箱子
        send,{f}
        sleep 500
        goods := 1
        loop{
            send,{f}
            Sleep 500
            send,{y}
            Sleep 500
            goods++
        }Until (goods == 5)
        send,{w down}
        sleep 1000
        ; 捡箱子
        send,{w up}
        sleep 2000

        ; 卖出
        setNumber++
        if (setNumber >= 12){
            setNumber := 1
            send,{8}               ; 打铁按键
            sleep 10000
        }
        sleep 500
        Gohall(1) ; 返回大厅


}
return


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
; 获取点
RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip

global Value := 0
GetPoint(p){
    MouseGetPos x, y
    PixelGetColor rgb, x, y, RGB
    Value = %x%,%y%.%rgb%
    IniDelete, site.ini, %p%, key
    IniWrite, %Value%, site.ini, %p%, Key
    IniRead, press%p%, site.ini, %p%, key
    ToolTip %Value%
    SetTimer, RemoveToolTip, 5000 ; 2 秒后取消展示 ToolTip
}

; 卖东西 最后一行
sale(){
    sites := Object("0x141C29","34,660","0x463655","77,661","0x3E324D","112,659","0x746370","152,661","0x62616F","195,661","0xAD8B67","237,661","0x463554","275,662","0x372F2F","313,661") 
    send {i}
    sleep 800
    click,193,710     
    sleep 500
    for i,j in sites
    checkInside(i,j)
    sleep 200
    send {i}
}
; 检查是否在内
checkInside(i,j){
    dot :=","
    StringSplit,xy,j,%dot%,
    PressYes(xy1,xy2)
    sleep 600
}
; 卖出
PressYes(x,y){
    click,%x%,%y%,Right
    sleep 300
    send {y}
    sleep 300
}

; 打怪1:看门 || 一王  其他尾王
Fight(ele){
    timer := 1
    setR := 1
    ; 输出
    if ( ele == 1 || ele == 2){
            loop{
                send {LButton}
                sleep 1000
                setR++
            }until (setR >= 3 )
            sleep 1000
        if (ele == 1){
            loop{
                send v
                send c
                send t
                send f
                timer++
                if (Getcolor(dieskill[1],dieskill[2],1)){   ; 死亡
                    itdie := 1 
                }
            }until ( timer > 100  || Getcolor(dieskill[1],dieskill[2],1) )   ; 灰色2+4  或者死4  ( GetColor(2Greyskill[1],2Greyskill[2],1) &&  )
        }else{
            send z
            sleep 3000
            send x
            loop{
                send x
                send v
                send c
                send t
                send 3
                send f
                timer++
                if (Getcolor(dieskill[1],dieskill[2],1)){   ; 死亡
                    itdie := 1 
                }
            }until ( GetColor(4Greyskill[1],4Greyskill[2],1)  || Getcolor(dieskill[1],dieskill[2],1) )   ; z  或者死4  ( GetColor(2Greyskill[1],2Greyskill[2],1) &&  )
        }
        
        ; if (Getcolor(dieskill[1],dieskill[2],1) || itdie == 1 ){   ; 死亡
        ;     itdie := 1 
        ;     sleep 5000
        ;     send 4
        ;     sleep 10000
        ;     Gohall(1)
        ;     sleep 5000
        ; }

    }else if ( ele == 3){
            loop{
                send {LButton}
                sleep 1200
                setR++
            }until (setR >= 3 )  ; 一王6  二王3
            send e
            sleep 500
            send x
            sleep 500
            loop{
                send x
                send v
                send 3
                send c
                send {tab}
                send t
                send f
                timer++
        }until ( (GetColor(2Greyskill[1],2Greyskill[2],1) && GetColor(4Greyskill[1],4Greyskill[2],1)) || Getcolor(dieskill[1],dieskill[2],1) || GetColor(missionboxInside[1],missionboxInside[2],1) )   ; 灰色2+4  或者死4 || 箱子
    }
    

}
; 尾王遇见
GetLast(){
    sleep 2000
    send,{w up}
    sleep 500
    send,{w down}
    ; 尾王校对
    loop{ 
        sleep 50       
    }Until ( GetColor(2skill[1],2skill[2],1) )         ; 遇怪变亮技能 2
    send,{w up}
    sleep 500
    send {s down}
    sleep 2000
    send {s up}
    sleep 500
}


; 回到大厅
Gohall(e){
    send {w down}
    loop{
        sleep 10
    }until (GetColor(outsideInside[1],outsideInside[2],1))
    send {w up}
    sleep 2000
    send f
    sleep 500
    send y
    sleep 800
    send f
    sleep 800
    send f
    sleep 800
    send f
    sleep 800
    send f
    sleep 5000
}
   
   
  