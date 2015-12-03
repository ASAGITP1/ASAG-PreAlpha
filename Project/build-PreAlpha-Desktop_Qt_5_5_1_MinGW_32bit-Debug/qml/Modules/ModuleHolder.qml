import VPlay 2.0
import QtQuick 2.0

import "../Enemy"
import "../Modules"
import "../Player"
import "../Scenes"

Item {
    id: holder

    z: 5

    property Enemy tenemy: enemy
    property EntityBase tplay

    property var moduleList: moduleList

    property Component dynamicModule: moduleList.cmodule1

    Loader{
        sourceComponent:dynamicModule
        property Enemy enemy: tenemy
    }

    ModuleList {
        id: moduleList
    }

}

