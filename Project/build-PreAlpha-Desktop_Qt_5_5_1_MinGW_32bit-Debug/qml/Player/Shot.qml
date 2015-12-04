import VPlay 2.0
import QtQuick 2.0

import "../Enemy"
import "../Modules"
import "../Player"
import "../Scenes"


EntityBase {
    id: shotEntity
    entityType: "shot"
    poolingEnabled: true

        property var offset: 0

        Image {
            id:image
            source: "../../assets/bullet.png"
            height: 50
            width: 20
        }


        BoxCollider {
            id: collider
            height: 10
            width: 5
            bullet: true
            categories: Box.Category1
            collidesWith: Box.Category2 | Box.Category3
        }

        Timer {
               interval: 500; running: false; repeat: true
               onTriggered: if(y < -100) shotEntity.removeEntity()
        }

        Component.onCompleted: startPhys()


        function startPhys() {

            var speed = Math.floor( Math.random() * 300) + 1500
            var inacc = Math.floor((Math.random() - 0.5) * 100)
            var targeting = Math.floor(speed * offset) + inacc
            collider.linearVelocity = Qt.point(targeting, -speed)

            var tanval = -speed / targeting
            var angle = Math.atan(tanval) * 57
            var rot = (angle < 0) ? (angle+90) : (angle-90)
            shotEntity.rotation = rot
        }

 }
