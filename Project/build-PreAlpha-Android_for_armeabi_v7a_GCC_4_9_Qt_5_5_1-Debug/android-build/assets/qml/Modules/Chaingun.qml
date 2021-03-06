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

    property int fakex: holder.x
    property int fakey: holder.y
    property int chaingunx: player.x + fakex
    property int chainguny: player.y + fakey

    property var erray: new Array


    Image {
        id:image
        source: "../../assets/cannon.png"
        height: 100
        width: 100

    }

    Timer {
           interval: 100; running: true; repeat: true
           onTriggered: trackingSystem()
       }


    function trackingSystem() {

        erray = entityManager.getEntityArrayByType("enemy");

        var ene;
        var targetArray = new Array;
        var j = 0;

        for(var i = 0; i < erray.length; i++) {

           ene = erray[i];

           var enemyDistance = chainguny - ene.y
           var angle = shootingAngle/57 // grad -> rad
           var offset = Math.tan(angle) * enemyDistance
           var lLimit = chaingunx - offset
           var rLimit = chaingunx + offset


            if(ene.x > lLimit && ene.x < rLimit && ene.y > (chainguny - shootingRange)) {
                targetArray[j] = ene;
                j++;
            }
        }


        if(j > 0) {

            var target = targetArray[0];

            var xdiff = target.x - chaingunx;
            var ydiff = target.y - chainguny;
            if(xdiff < 0) xdiff *=-1;
            var tDiff = Math.sqrt((xdiff*xdiff)+(ydiff*ydiff));

            for(var k = 0; k < targetArray.length; k++) {

                var xdiff2 = targetArray[k].x - chaingunx;
                var ydiff2 = targetArray[k].y - chainguny;
                if(xdiff2 < 0) xdiff2 *=-1;

                var ptDiff = Math.sqrt((xdiff2*xdiff2)+(ydiff2*ydiff2));
                if(tDiff > ptDiff) {
                    target = targetArray[k];
                }
            }

            shoot(target);
        }

    }


    function shoot(ene) {

        var offset = (chaingunx - (ene.x-(ene.width/2))) / (chainguny - ene.y)

        var newEntityProperties = {
            x: chaingunx + chaingun.width/2 - 10,
            y: chainguny - 20,
            offset: -offset,
            dmg: 1,
            shottype: "chaingun"
        }

       entityManager.createEntityFromUrlWithProperties( Qt.resolvedUrl("../Player/Shot.qml"), newEntityProperties  )
    }



}
