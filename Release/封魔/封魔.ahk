#IfWinActive ahk_class UnrealWindow
CoordMode, Pixel, Screen

global repair := 1
global exp := 1
global die := 0


F2::
loop{

    loop {
        sleep 1000
    }until (Getcolor(1676,1024 ,"0x787979",1))  

    sleep 5000
    click,1734,211 ; 封魔
    sleep 5000
    click,1045,1041 ;进入
    sleep 5000

    loop{
        sleep 1000
    }until (Getcolor(897,912,"0x98B9D4",1))  ;1

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
    }until (Getcolor(897,912,"0x98B9D4",1))  ;1
    
    sleep 500
    send {w down}
    sleep 500
    send,{shift}
    sleep 4000
    send {w up}
    sleep 1000

    send {alt down}
    sleep 300
    click,777,806 ; 自动战斗
    sleep 500
    send {alt up}

    loop{
        sleep 1000
        if ( Getcolor(1034,908,"0xD0BD98",1) ){
            die := 1
        }
        if ( Getcolor(1034,908,"0xD0BD98",1) ){
            send {x}
        }
    }until ( (Getcolor(839,912,"0x777777",1) && Getcolor(901,960,"0xECDF6E",1) && Getcolor(1040,964,"0x64EBF0",1) ) ||  Getcolor(1034,908,"0xD0BD98",1) ) ; tab z v

    repair++
    exp++
    sleep 5000
    
    if ( die == 1 || Getcolor(1034,908,"0xD0BD98",1) ){
        die := 0
        sleep 3000
        send {4}
        loop{
            sleep 2000
        }until (Getcolor(897,912,"0x98B9D4",1))
        sleep 5000
    }else{
        sleep 2000
        send {alt down}
        sleep 300
        click,777,806 ; 自动战斗
        sleep 500
        send {alt up}
        sleep 5000
    }

    send {Esc}
    sleep 500
    click,1768,864
    sleep 500
    send y
    sleep 500

}




F11::Pause
return


GetColor(x,y,c,Symbol)
{   
    ;Symbol：1等於，2不等於
    ;c      要判斷的顏色值
    PixelGetColor, color, x, y, RGB
    StringRight color,color,10
    if ( ( Symbol == 1 && color == c ) || ( Symbol == 2 && color != c ) ) { 
        return true
    }else{
        return false
    }
   
}
