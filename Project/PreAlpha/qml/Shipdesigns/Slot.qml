import QtQuick 2.0
import VPlay 2.0
import xwrite 1.0
import xread 1.0

import "../Enemy"
import "../Modules"
import "../Player"
import "../Scenes"

Item {
    id:playerslot

        ModuleHolder{
            id:modhold
            dynamicModule: moduleList.cmodule1


            height:50
            width:50
            x:0
            y:0
            scale:0.5
        }

        MouseArea{
            id:slotmouse
            anchors.fill:parent
        }
}

