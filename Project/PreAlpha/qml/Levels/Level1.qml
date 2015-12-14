import QtQuick 2.0
import VPlay 2.0

BaseLevel {
    id: level1
    levelName: "Level1"
    property bool active: false

      Timer {
             interval: 500; running: active; repeat: true
             onTriggered: spawnEnemy()
         }

      Component.onCompleted: {
         // console.debug(parent.parent);
      }

      function spawnEnemy() {
          var newEntityProperties = {
              x: Math.random() * 500 + 50,
              y: 10
          }

         entityManager.createEntityFromUrlWithProperties( Qt.resolvedUrl("../Enemy/Enemy.qml"), newEntityProperties  )
      }

}

