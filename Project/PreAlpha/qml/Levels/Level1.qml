import QtQuick 2.0
import VPlay 2.0

BaseLevel {
  levelName: "Level1"


  Timer {
         interval: 500; running: true; repeat: true
         onTriggered: spawnEnemy()
     }

  function spawnEnemy() {
      var newEntityProperties = {
          x: Math.random() * 500 + 50,
          y: 10
      }

     entityManager.createEntityFromUrlWithProperties( Qt.resolvedUrl("../Enemy/Enemy.qml"), newEntityProperties  )
  }

}

