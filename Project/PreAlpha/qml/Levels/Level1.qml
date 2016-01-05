import QtQuick 2.0
import VPlay 2.0

import "../Enemy"
import "../Modules"
import "../Player"
import "../Scenes"

BaseLevel {
    id: level1
    levelName: "Level1"
    playerP: player

      Timer {
             interval: 1000; running: active; repeat: true
             onTriggered: spawnEnemy()
         }

      Component.onCompleted: {
          backgroundMusic.source = "../../assets/Music/Rhinoceros.mp3";
          backgroundMusic.play();
      }


      Player {
          id: player
          sceneP: scene
          x: 200
          y: parent.height - player.height - 100
          z: 20
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

