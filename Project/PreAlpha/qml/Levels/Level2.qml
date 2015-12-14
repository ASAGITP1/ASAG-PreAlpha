import QtQuick 2.0
import VPlay 2.0

BaseLevel {
  levelName: "Level2"
  property bool active: false

  Timer {
         interval: 1000; running: active; repeat: true
         onTriggered: spawnEnemy()
     }

  function spawnEnemy() {
      var newEntityProperties = {
          x: Math.random() * 500 + 50,
          y: 10
      }

     entityManager.createEntityFromUrlWithProperties( Qt.resolvedUrl("../Enemy/Enemy2.qml"), newEntityProperties  )
  }
}
