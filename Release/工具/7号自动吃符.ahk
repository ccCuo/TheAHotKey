CoordMode, Pixel, Screen
loop
{
    SendInput 7
    sleep 3000
} 

F11::pause
GetColor(x,y)
{
    PixelGetColor, color, x, y, RGB
    StringRight color,color,10
    return color
}