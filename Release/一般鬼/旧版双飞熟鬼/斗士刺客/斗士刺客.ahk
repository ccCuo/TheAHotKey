#IfWinActive ahk_class LaunchUnrealUWindowsClient 
CoordMode, Pixel, Screen

global itdie := 2
global setNumber := 1
global IsDie := 1
global TheSum := 1
global times := 1

global restart := 0
global ahId := "0x80b4a"

F2::
loop{
    itdie := 2
    times := 1             ; 跑路循环检测
    looptimes := 1         ; click 循环检测

    plaf()
    ; 起始点
        runs(1)

        Fight(1) 
        ; 跑路
        runs(2)
        ; 老一
        Fight(2)    
        if ( itdie == 1 ){
            Continue
        }         
        ; 过图
        runs(3)
        
        ; loop{ 
            
        ; }Until (GetColor(9,1043,"0x764E27",2) )          ; 左下角取色
        ; sleep 500
        ; send {AltTab}
        ; sleep 1000
        ; send,{esc}
        sleep 500
        
        Fight(3)   ; 尾王开打
        
        sleep 500

        send {d down}
        sleep 250
        send {d up}
        ControlSend, ,{4}, ahk_id %ahId%
        sleep 500
        ; 直走捡箱子
        send,{w down}
        sleep 400
        ; 捡箱子
        send,{w up}
        ControlSend, ,{4}, ahk_id %ahId%
        sleep 1000

        send,{f}
        Sleep 1000
        goods := 1
        loop{
            send,{f}
            Sleep 500
            send,{y}
            Sleep 500
            goods++
        }Until (goods == 5)
        sleep 2000


        ; 暴富箱
        send {d down}
        sleep 1800
        send {d up}
        sleep 500
        ; 直走捡箱子
        send,{w down}
        sleep 3000
        send,{w up}
        sleep 2000
        send f
        sleep 3000
        if (Getcolor(100,678,"0xEAD95B",1) || Getcolor(1837,880,"0x293D59",1)){   ; 暴富箱坐标 || 取右边背包最后一个格子空坐标
            sleep 5000
            if (Getcolor(90,494,"0x31273D",1) || GetColor(101,502,"0xCCAE69",1)  || GetColor(111,513,"0x513E56",1) || GetColor(93,512,"0x25213D",1) ){  ; 卷轴
                click,90,494,Right
                sleep 1000
                click,90,494,Right
                sleep 1000
                send y
            }

            if (Getcolor(92,323,"0x33293E",1) || Getcolor(106,340,"0x4F3E62",1) || Getcolor(102,330,"0xDFC16F",1) || Getcolor(88,342,"0xBA9445",1) ) {
                click,106,340,Right
                sleep 1000
                click,106,340,Right
                sleep 1000
                send y
            }

            sleep 2000
            MouseMove, 1852,1056
            sleep 1000
            click,1852,1056
            sleep 2000
        }


        ; 出门+打铁
        setNumber++
        if (setNumber >= 10){
            send,{7}               ; 打铁按键（自己改
            sleep 1000
            ControlSend, ,{7}, ahk_id %ahId%
            sleep 8000
            ; sale()                  ; 卖掉
            setNumber := 1
        }
        TheSum++
        sleep 1000
        send {w down}
        sleep 1500
        send {w up}
        sleep 1000
        Gohall(1) ; 返回大厅
        sleep 1000
        Gohall(2)
        sleep 10000
        

}until (!checkonline())

; 重新登錄
Run, run64.bat,E:\twBns\BNS_TW
loop{
    sleep 1000
}until (Getcolor(1139,324,"0xFFFFFF",1))
sleep 5000

;//


return
F11::Pause
return

; 檢查是否在線
checkonline(){
    Process, Exist ,Client.exe
    if (!ErrorLevel){
        return false    ; 不在運行
        ; ToolTip 'notruning'
        ; SetTimer, RemoveToolTip, 2000 
    }else{
        return true     ; 在運行 
    }
}

GetColor(x,y,c,Symbol)
{   
    ;Symbol：1等於，2不等於
    ;c      要判斷的顏色值
    PixelGetColor, color, x, y, RGB
    StringRight color,color,10
    if ( ( Symbol == 1 && color == c ) || ( Symbol == 2 && color != c ) ) { ;  || !checkonline()
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
    sites := Object("0x463854","33,664","0x463655","74,663","0x3E324D","114,660","0x746370","154,666","0x62616F","190,662","0xAD8B67","233,667","0x463554","272,663","0x372F2F","305,671") 
    send {i}
    sleep 500
    click,187,713 
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
    ; if (GetColor(xy1,xy2) == i){
        PressYes(xy1,xy2)
        sleep 600
    ; }
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
    tabtimer :=1
    ; 看门
    if (ele == 1){
        send e
        sleep 1500
        send b
        sleep 800
        send 4
        sleep 800
        send 2
        sleep 600
        send v
        sleep 500
        send z
        sleep 500
        loop{
            send v
            sleep 30
            ;狂气
            if (GetColor(838,935,"0x7C494E",1)){
                send,{tab} 
                sleep 30
            }
            send t
        }Until ( GetColor(770,921,"0x557DC7",1) || GetColor(947,924,"0x515151",1) ) ;e技能变亮  2技能变灰
        ; 智商检测
        send,{t down}
        sleep 500
        send,{t up}
    }
    ; 一王 || 尾王
    if (ele == 2 || ele == 3){
        sleep 5000
        send e
        sleep 1500
        send b
        sleep 800
        send 4
        sleep 800
        send 2
        sleep 600
        send v
        sleep 500
        if (ele == 2){
            send z
            sleep 500
            3loopTimer :=1
             loop{
                ControlSend, ,{1}, ahk_id %ahId%
                ControlSend, ,{v}, ahk_id %ahId%
                ControlSend, ,{4}, ahk_id %ahId%
                ControlSend, ,{3}, ahk_id %ahId%
                ControlSend, ,{t}, ahk_id %ahId%
                ControlSend, ,{r}, ahk_id %ahId%
                ControlSend, ,{tab}, ahk_id %ahId%
                send v
                ;狂气
                if (GetColor(838,935,"0x7C494E",1)){
                    send,{tab} 
                    sleep 30
                }
                send t
                ; 中途死亡
                if (GetColor(1030,921,"0xB8A379",1) || GetColor(896,932,"0x7C664A",1) || GetColor(1026,930,"0x5D4731",1)  || itdie == 1){   ; 1/2/4
                    sleep 10000
                    itdie = 1
                    Goout()
                    Continue
                }
            }Until ( GetColor(770,921,"0x557DC7",1) || itdie == 1 ) ;e技能变亮
            ; 智商检测
            send,{t down}
            sleep 500
            send,{t up}
        }
        ; 尾王判断特殊
        if ( ele == 3){
            loop{
                
                ; 中途死掉  *
                if (GetColor(1030,921,"0xB8A379",1)){ 
                    sleep 2000
                    send 4
                    sleep 15000
                    GetLast(1)  ; 尾王遇见(re)
                    sleep 1000
                    changeView()
                    sleep 2500
                    send 4
                    sleep 5000
                    GetLast(2)
                    sleep 1000
                    changeView()
                    sleep 2500
                    send e
                    sleep 1000
                    send 2
                }else{
                    tabtimer++
                    if ( tabtimer > 1 && tabtimer < 50){
                       ControlSend, ,{1}, ahk_id %ahId%
                       ControlSend, ,{4}, ahk_id %ahId%
                    }else if ( tabtimer > 200 && tabtimer < 250 ){
                        ControlSend, ,{ss}, ahk_id %ahId%
                    }else{
                        ControlSend, ,{v}, ahk_id %ahId%
                        ControlSend, ,{3}, ahk_id %ahId%
                        ControlSend, ,{t}, ahk_id %ahId%
                        ControlSend, ,{r}, ahk_id %ahId%
                    }
                    send, {v}
                    sleep 20
                    if (GetColor(893,992,"0x1D1C15",1)){ 
                        ; 降临
                        send,{z} 
                        sleep 50
                    }
                    if (GetColor(838,935,"0x7C494E",1)){
                    ; 狂气
                        send,{tab} 
                        sleep 30
                        ControlSend, ,{tab}, ahk_id %ahId%
                    }
                    if (GetColor(1031,980,"0x5898AB",1)){
                    ; v
                        send v
                        sleep 20
                    }
                    if ( GetColor(1032,920,"0xE58F90",1)){
                        send,{4} 
                        sleep 20
                    }
                    send, {t}
                    sleep 20
                }

            }Until (GetColor(1698,578,"0xA09269",1) ) ;箱子

            sleep 1000
            send,{e}    
            sleep 1000
            if ( GetColor(1698,578,"0xA09269",1) ){       ; 判断右边任务箱子 交任务
                send,{alt down}
                sleep 500
                click,1698,578                     ; 任务箱子坐标
                sleep 1000
                send,{alt up}
                send f
                sleep 1000
                send f
                sleep 1000
                send f
                sleep 1000
            }
        }

    }

}
; 尾王遇见
GetLast(e){
    if ( e == 1 ){
        ; GetColor(939,928,"0x334963",1)
        x1 := 939
        y1 := 928
        color1 := "0x334963"
    }else {
        ; 936,991 0x5BACFF
        x1 := 895
        y1 := 927
        color1 := "0x223644"
    }
    sleep 2000
    send,{w up}
    sleep 500
    send,{w down}
    ; 尾王校对
    loop{ 
        sleep 50       
    }Until (GetColor(x1,y1,color1,1) )         ; 遇怪变亮技能 2
    send,{w up}
    sleep 500
}
; 回到大厅
Gohall(e){
    if (e == 1){
        send {a down}
        loop{
            
        }until (GetColor(1189,742,"0x42311D",1))
        send {a up}
    }else{
        sleep 1000
        loop{

        }until (GetColor(895,986,"0x80837D",1))
        send {w down}
        sleep 5000
        loop{

        }until (GetColor(1189,742,"0x42311D",1))
        send {w up}
        ; 斩首 1698,580 0x74705C
        sleep 3000
        send,{alt down}
        sleep 500
        click,1698,580                     ; 任务箱子坐标
        sleep 1000
        send,{alt up}
        send f
        sleep 1000
        send f
        sleep 1000
        send f
        sleep 1000
    }
    sleep 300
    send {w up}
    sleep 500
    send f
    sleep 500
    changeView()
    sleep 5000
}
changeView(){
    send {Alt down}{tab}
    sleep 500
    send {Alt up}
    sleep 500
}
; 跑路
runs(e){
    runsLoop := 1
    if (e == 1){
        ; 看门
        loop{
            if ( runsLoop == 1 ){
                ; GetColor(939,928,"0x334963",1)
                x1 := 939
                y1 := 928
                color1 := "0x334963"
                runSleep := 18200
            }else {
                ; 936,991 0x5BACFF
                x1 := 895
                y1 := 927
                color1 := "0x223644"
                runSleep := 20000
            }
            loop{
                sleep 2000
            }Until (GetColor(1688,426,"0xFCFCE6",1))   ; 进门后右上角地图角标
                send, {w down}
                sleep runSleep
            
                send, {w up} 
                sleep 2000
                send,{a down}
                loop{
                    sleep 50
                    times++
                    if (times >= 400){
                        send,{a up}
                        sleep 1000
                        ; Gohall(1) ; 返回大厅
                        Continue
                    }
                }Until (GetColor(x1,y1,color1,1) || times>= 400) ; 向左校对老1  遇怪变亮技能
                if (times >= 400){  
                    send {w down}
                    sleep 500
                    send {w up}
                    sleep 500
                    send,{d down}
                    loop{
                        sleep 50
                    }Until (GetColor(x1,y1,color1,1))
                    send {a up}
                }
                sleep 100
                send,{a up}
                sleep 1000
                runsLoop++
                changeView()
                sleep 2000
        }until (runsLoop > 2)
    }else if ( e == 2){
        loop{
            if ( runsLoop == 1 ){
                ; GetColor(939,928,"0x334963",1)
                x1 := 939
                y1 := 928
                color1 := "0x334963"
                runSleep := 18200
            }else {
                ; 936,991 0x5BACFF
                x1 := 895
                y1 := 927
                color1 := "0x223644"
                runSleep := 20300
            }
            send, {w down} 
            sleep 8000
            send, {w up} 
            sleep 500
            send, {w down} 
            sleep 500
            send, {Shift}
            sleep 5000
            send, {Space}
            sleep 1200
            send, {Space} 
            sleep 1000
            ; 下落
            send, {w up} 
            sleep 100
            send, {Space} 
            sleep 500
            send,{w down}
            loop{
                sleep 10
            }Until (GetColor(x1,y1,color1,1)) ; 向左校对老1  遇怪变亮技能
            sleep 500
            send,{w up}
            sleep 1000
            runsLoop++
            changeView()
            sleep 2000
        }until (runsLoop > 2)
        
    }else if ( e == 3){
        loop{
            if ( runsLoop == 1 ){
                ; GetColor(939,928,"0x334963",1)
                x1 := 939
                y1 := 928
                color1 := "0x334963"
                runSleep := 18200
            }else {
                ; 936,991 0x5BACFF
                x1 := 895
                y1 := 927
                color1 := "0x223644"
                runSleep := 20000
            }
            send,{w down}
            GetLast(runsLoop)  ; 尾王遇见
            runsLoop++
            changeView()
            sleep 2000
        }until (runsLoop > 2)
        
    }


}
; 平台
plaf(){
    runsLoop := 1
    loop{
        if ( runsLoop == 1 ){
            ; GetColor(941,992,"0xE4FCFA",1)
            loop{
                sleep 1000
            }until (GetColor(941,992,"0xE4FCFA",1))
            
        }else { 
            ; 894,991 0x9C3219
            loop{
                sleep 1000
            }until (GetColor(901,987,"0x8A8172",1))
        }
        sleep 3000
        send,{w up}
        sleep 500
        send {Left down}
        sleep 1900
        send {Left up}
        sleep 500
        send {w down}
        sleep 500
        send,{shift}
        sleep 8000
        send {w up}
        runsLoop++
        changeView()
        sleep 10000
    }until (runsLoop > 2 && runsLoop != 2)
    
}

Goout(){
    sleep 2000
    send 4
    sleep 8000
    send {s down}
    sleep 15000
    send {s up}
    changeView()
    sleep 5000
    send 4
    sleep 8000
    send {s down}
    sleep 18000
    send {s up}
    sleep 15000
    changeView()
    sleep 15000
}