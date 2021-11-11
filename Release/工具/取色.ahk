#IfWinActive ahk_class UnrealWindow
CoordMode, Pixel, Screen

F1::
MouseGetPos x, y
PixelGetColor rgb, x, y, RGB
colors = %x%,%y% %rgb%
ToolTip %colors%
Clipboard=%colors% ; 将 16 进制颜色放入剪贴板
SetTimer, RemoveToolTip, 5000 ; 2 秒后取消展示 ToolTip

return

RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip

GetColor(x,y)
{
    PixelGetColor, color, x, y, RGB
    StringRight color,color,10
    return color
}