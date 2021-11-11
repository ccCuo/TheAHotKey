#IfWinActive ahk_class UnrealWindow
CoordMode, Pixel, Screen

if not FileExist("site.ini")
    {
        MsgBox Please create site.ini!
        return
    }else{
        IniRead, x, site.ini, Section, x
        IniRead, y, site.ini, Section, y
        IniRead, colors, site.ini, Section, colors
        loop
        {
            if(GetColor(%x%,%y%) == %colors%)
            {
                sleep 1000
                SendInput f;
                sleep 1500
                SendInput 8;
                sleep 1500
            }else{
            SendInput 8;
                sleep 1000
            }
            sleep 1000
        }
    }
F11::suspend
GetColor(x,y)
{
    PixelGetColor, color, x, y, RGB
    StringRight color,color,10
    return color
}







