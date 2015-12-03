import QtQuick 2.0

import "../Enemy"
import "../Modules"
import "../Player"
import "../Scenes"

Item {

    property Component chaingun: chaingun
    property Component cmodule1: module1

    QtObject {
        id: internalSettings
        property color color: "green"
    }

    Component {
        id: chaingun
        Chaingun {
            id: test
            height: 100
            width: 100

        }
    }

    Component {
        id: module1
        Module1 {

        }
    }
}

