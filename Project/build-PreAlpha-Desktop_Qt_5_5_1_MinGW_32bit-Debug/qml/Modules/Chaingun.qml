import VPlay 2.0
import QtQuick 2.0

import "../Enemy"
import "../Modules"
import "../Player"
import "../Scenes"

BaseModule{
    id:chaingun

    property int shootingRange:         500         // distance in pixel
    property double shootingAngle:      20       // angle on one side

    property Enemy ene: enemy

    property int fakex: holder.x
    property int fakey: holder.y
    property int chaingunx: tplay.x + fakex
    property int chainguny: tplay.y + fakey

    Image {
        id:image
        source: "../assets/cannon.png"
        height: 100
        width: 100

    }

    Component.onCompleted: test()

    Timer {
           interval: 100; running: true; repeat: true
           onTriggered: trackingSystem()
       }

    function trackingSystem() {


       var enemyDistance = chainguny - ene.y
       var angle = shootingAngle/57 // grad -> rad
       var offset = Math.tan(angle) * enemyDistance
       var lLimit = chaingunx - offset
       var rLimit = chaingunx + offset


        if(ene.x > lLimit && ene.x < rLimit && ene.y > (chainguny - shootingRange)) {
            shoot()
        }
    }


    function shoot() {

        var offset = (chaingunx - (ene.x-(ene.width/2))) / (chainguny - ene.y)

        var newEntityProperties = {
            x: chaingunx + chaingun.width/2 - 10,
            y: chainguny - 20,
            offset: -offset
        }

       entityManager.createEntityFromUrlWithProperties( Qt.resolvedUrl("Shot.qml"), newEntityProperties  )
    }



}
