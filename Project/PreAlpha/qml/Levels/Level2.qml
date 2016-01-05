import QtQuick 2.0
import VPlay 2.0

import "../Enemy"
import "../Modules"
import "../Player"
import "../Scenes"

BaseLevel {
    id: level2
    levelName: "Level2"
    playerP: player

      Timer {
             interval: 1500; running: active; repeat: true
             onTriggered: spawnEnemy()
         }

      Component.onCompleted: {
          backgroundMusic.source = "../../assets/Music/Undaunted.mp3";
          backgroundMusic.play();
      }



      Player {
          id: player
          sceneP: scene
          x: 200
          y: parent.height - player.height - 100
          z: 0
      }

      function spawnEnemy() {
          var newEntityProperties = {
              x: Math.random() * 500 + 50,
              y: 10,
              player: playerP
          }

         entityManager.createEntityFromUrlWithProperties( Qt.resolvedUrl("../Enemy/Enemy2.qml"), newEntityProperties  )
      }

}

