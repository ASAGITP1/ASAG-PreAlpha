import VPlay 2.0
import QtQuick 2.0
import xread 1.0
import xwrite 1.0


Scene {
    id: mainmenuscene
    property GameWindow scenemaster

    width: 640
    height: 960

    // by default, set the opacity to 0 - this will be changed from the main.qml with PropertyChanges
    opacity: 0
    // we set the visible property to false if opacity is 0 because the renderer skips invisible items, this is an performance improvement
    visible: opacity > 0
    // if the scene is invisible, we disable it. In Qt 5, components are also enabled if they are invisible. This means any MouseArea in the Scene would still be active even we hide the Scene, since we do not want this to happen, we disable the Scene (and therefore also its children) if it is hidden
    enabled: visible



    signal levelPressed(string selectedLevel)


    onLevelPressed: {
          // selectedLevel is the parameter of the levelPressed signal
          scenemaster.gameScene.setLevel(selectedLevel)
        }



    Text {
       anchors.horizontalCenter: parent.horizontalCenter
       y: 30
       font.pixelSize: 30
       color: "#444444"
       text: "Main Menu Scene"
     }


    Rectangle {
        height: 100
        width: 200
        color: "#888888"

        Text {
           anchors.horizontalCenter: parent.horizontalCenter
           y: 30
           font.pixelSize: 30
           color: "#444444"
           text: "Level 1"
         }

        x: 200
        y: 400

        MouseArea {
               anchors.fill: parent
               onClicked: {
                   levelPressed("Level1.qml")
                   scenemaster.switchScene(2);
                 }
           }
    }



    Rectangle {
        height: 100
        width: 200
        color: "#888888"

        Text {
           anchors.horizontalCenter: parent.horizontalCenter
           y: 30
           font.pixelSize: 30
           color: "#444444"
           text: "Level 2"
         }

        x: 200
        y: 510

        MouseArea {
               anchors.fill: parent
               onClicked: {
                   levelPressed("Level2.qml")
                   scenemaster.switchScene(2);
                 }
           }
    }

    Rectangle {
        height: 100
        width: 200
        color: "blue"

        x: 50
        y: 50

        MouseArea {
               anchors.fill: parent
               onClicked: {
                   editorscene.shipid=xread.readXML("ship")
                   console.debug(editorscene.shipid)
                   if(editorscene.shipid==0){
                       xwrite.writeXML(1)
                   }
                    scenemaster.switchScene(3);

               }
           }
    }

    Xread{
        id:xread
    }
    Xwrite{
        id:xwrite
    }




}
