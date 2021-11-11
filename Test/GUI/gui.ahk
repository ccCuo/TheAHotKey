if not FileExist("skill.ini")
    {
        MsgBox Please create skill.ini     
        return
    }else{
        ; 读取数据
        IniRead, qEd, skill.ini, Qskill, q
        IniRead, eEd, skill.ini, eskill, e
        IniRead, 1Ed, skill.ini, 1skill, 1
        IniRead, 2Ed, skill.ini, 2skill, 2
        IniRead, 3Ed, skill.ini, 3skill, 3
        IniRead, 4Ed, skill.ini, 4skill, 4
        IniRead, zEd, skill.ini, zskill, z
        IniRead, xEd, skill.ini, xskill, x
        IniRead, cEd, skill.ini, cskill, c
        IniRead, vEd, skill.ini, vskill, v
        IniRead, rEd, skill.ini, rskill, r
        IniRead, tEd, skill.ini, tskill, t
        IniRead, 4dEd, skill.ini, 4dskill, 4d
        IniRead, wEd, skill.ini, wskill, w              ; 进门右上角白色箭头
        IniRead, drEd, skill.ini, drskill, dr           ; 左下角龙标
        IniRead, boxEd, skill.ini, boxskill, box        ; 宝箱图标
    }

Gui, Add, Text,, Q:
Gui, Add, Text,, E:
Gui, Add, Text,, 1:
Gui, Add, Text,, 2:
Gui, Add, Text,, 3:
Gui, Add, Text,, 4:
Gui, Add, Text,, Z:
Gui, Add, Text,, X:
Gui, Add, Text,, C:
Gui, Add, Text,, V:
Gui, Add, Text,, R:
Gui, Add, Text,, T:
Gui, Add, Text,, 4(FOR DIE):
Gui, Add, Text,, white Site:        ; 进门右上角白色箭头
Gui, Add, Text,, Dragon:            ; 左下角龙标
Gui, Add, Text,, Box:               ; 宝箱图标

Gui, Add, Edit, vqName   w135 ym , %qEd%
Gui, Add, Edit, veName   w135,     %eEd%
Gui, Add, Edit, v1Name   w135,     %1Ed%
Gui, Add, Edit, v2Name   w135,     %2Ed%
Gui, Add, Edit, v3Name   w135,     %3Ed%
Gui, Add, Edit, v4Name   w135,     %4Ed%
Gui, Add, Edit, vzName   w135,     %zEd%
Gui, Add, Edit, vxName   w135,     %xEd%
Gui, Add, Edit, vcName   w135,     %cEd%
Gui, Add, Edit, vvName   w135,     %vEd%
Gui, Add, Edit, vrName   w135,     %rEd%
Gui, Add, Edit, vtName   w135,     %tEd%
Gui, Add, Edit, v4Die    w135,     %4dEd%
Gui, Add, Edit, vWhite   w135,     %wEd%             ; 进门右上角白色箭头
Gui, Add, Edit, vDragon  w135,     %drEd%            ; 左下角龙标
Gui, Add, Edit, vBox     w135,     %boxEd%           ; 宝箱图标


Gui, Add, Button, default xm, Finish  ; xm 把它放置在左下角.
Gui, Show
return




ButtonFinish:
Gui, Submit  ; 保存每个控件的内容到其关联变量中.

; 写入变量
IniWrite, %qName%, skill.ini, Qskill, q
IniWrite, %eName%, skill.ini, eskill, e
IniWrite, %1Name%, skill.ini, 1skill, 1
IniWrite, %2Name%, skill.ini, 2skill, 2
IniWrite, %3Name%, skill.ini, 3skill, 3
IniWrite, %4Name%, skill.ini, 4skill, 4
IniWrite, %zName%, skill.ini, zskill, z
IniWrite, %xName%, skill.ini, xskill, x
IniWrite, %cName%, skill.ini, cskill, c
IniWrite, %vName%, skill.ini, vskill, v
IniWrite, %rName%, skill.ini, rskill, r
IniWrite, %tName%, skill.ini, tskill, t
IniWrite, %4Die%, skill.ini, 4dskill, 4d
IniWrite, %White%, skill.ini, wskill, w
IniWrite, %Dragon%, skill.ini, drskill, dr
IniWrite, %Box%, skill.ini, boxskill, box

ExitApp


