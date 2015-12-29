import QtQuick 2.0
import VPlay 2.0

import "../Enemy"
import "../Modules"
import "../Player"
import "../Scenes"

BaseLevel {
    id: level1
    levelName: "Level1"
    property bool active: false
    property Player playerP;

      Timer {
             interval: 5000; running: active; repeat: true
             onTriggered: spawnEnemy()
         }

      Component.onCompleted: {
      }

      function spawnEnemy() {
          var newEntityProperties = {
              x: Math.random() * 500 + 50,
              y: 10,
              player: playerP
          }

         entityManager.createEntityFromUrlWithProperties( Qt.resolvedUrl("../Enemy/Enemy.qml"), newEntityProperties  )
      }

}

