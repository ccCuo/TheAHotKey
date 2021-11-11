CoordMode, Pixel, Screen
loop{
    Process, Exist ,Client.exe
    if (!ErrorLevel || GetColor(777,543) =="0xCD0A0A" || GetColor(767,544) =="0xA70A0A" ){
        Shutdown,1
    }
    sleep 30000
}
GetColor(x,y)  
{
    PixelGetColor, color, x, y, RGB
    StringRight color,color,10
    return color
}