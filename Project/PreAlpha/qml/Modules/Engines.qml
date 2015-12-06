import VPlay 2.0
import QtQuick 2.0

import "../Enemy"
import "../Modules"
import "../Player"
import "../Scenes"

BaseModule{
    id:engines
    entityType: "engines"

    property double boost: 0.6
    property double thrust: 0.6

    Component.onCompleted: initialize()

    Rectangle {
        color: "red"
        width: 94
        height: 94
        x: 3
        y: 3
    }

    function initialize() {
        player.engines[player.enginesI++] = engines;
        player.calcSpeed();
    }


}
