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
            scenemaster.gameScene.setLevel("");
            scenemaster.gameScene.setLevel(selectedLevel)
        }



    Image {
        anchors.fill: parent
        source: "../../assets/UI/Background.png"
        z: 0
        id: background
    }



    Image {
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height - 450
        z: 50
        scale: 0.7
        source: "../../assets/UI/Campaign.png"
        id: campaign



        MouseArea {
               anchors.fill: parent
               onClicked: {
                   scenemaster.switchScene(2);
                 }
           }
    }

    Image {
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height - 600
        z: 50
        scale: 0.7
        source: "../../assets/UI/RealmOfTrials.png"
        id: realmoftrials



        MouseArea {
               anchors.fill: parent
               onClicked: {
                 }
           }
    }




    Image {
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height - 300
        z: 50
        scale: 0.7
        source: "../../assets/UI/ShipShop.png"
        id: editor

        Rectangle {
            x: 20
            y: 50
            width: 250
            height: 150
            color: "#CCCCCC"
            opacity: 0

            MouseArea {
                   anchors.fill: parent
                   onClicked: {
                       editorscene.shipid=xread.readXML("ship")
                       console.debug("ship id:",editorscene.shipid)
                       if(editorscene.shipid==0){
                           xwrite.writeXML(1)
                       }
                        editorscene.initialize();
                        scenemaster.switchScene(4);

                   }
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
