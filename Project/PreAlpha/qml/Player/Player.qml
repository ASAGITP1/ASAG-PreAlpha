import QtQuick 2.0
import VPlay 2.0
import QtSensors 5.5

import "../Enemy"
import "../Modules"
import "../Player"
import "../Scenes"

EntityBase {
    id: playerr

    property Scene sceneP: scene
    property alias controller: twoAxisController


    property var engines: new Array
    property int enginesI: 0

    property double forwardSpeed: 100
    property double forwardSpeedBase: 100
    property double forwardBoost: 1

    property double sidewaySpeed: 200
    property double sidewaySpeedBase: 200
    property double sidewayBoost: 1



    Component.onCompleted: initialize()



    Rectangle {
        anchors.fill: parent
        color: "#AAAAAA"
        z: 0
        id: background
    }



    TwoAxisController { //for testing on the keyboard
        id: twoAxisController
    }

    Accelerometer { //for android movement
        id: accelerometer
        active: true

      }


    BoxCollider {
        id: collider
        bodyType: Body.Dynamic
        categories: Box.Category1

        property int speed: system.desktopPlatform ? // controls (
        twoAxisController.xAxis * sidewaySpeed:  //  for desktop
        (accelerometer.reading !== null ? -accelerometer.reading.x * sidewaySpeed : 0)   // for mobile

        linearVelocity: Qt.point(speed, 0)
    }

    ModuleHolder {
        id: module1
        x: 0
        y: 0
        dynamicModule: moduleList.chaingun
        player: playerr
    }

    ModuleHolder {
        x: 100
        y: 0
        dynamicModule: moduleList.chaingun
        player: playerr
    }

    ModuleHolder {
        x: 0
        y: 100
        dynamicModule: moduleList.lasergun
        player: playerr
    }

    ModuleHolder {
        x: 100
        y: 100
        dynamicModule: moduleList.lasergun
        player: playerr
    }

    ModuleHolder {
        x: 0
        y: 200
        dynamicModule: moduleList.cmodule1
        player: playerr
    }

    ModuleHolder {
        x: 100
        y: 200
        dynamicModule: moduleList.cmodule1
        player: playerr
    }

    ModuleHolder {
        x: 0
        y: 300
        dynamicModule: moduleList.engines
        player: playerr
    }

    ModuleHolder {
        x: 100
        y: 300
        dynamicModule: moduleList.engines
        player: playerr
    }



    function initialize() {
        calcSpeed();
    }

    function calcSpeed() {
        forwardBoost = 1;
        for(var i = 0; i < enginesI; i++) {
            forwardBoost += engines[i].boost;
        }
        forwardSpeed = forwardSpeedBase * forwardBoost;

        sidewayBoost = 1;
        for(i = 0; i < enginesI; i++) {
            sidewayBoost += engines[i].thrust;
        }
        sidewaySpeed = sidewaySpeedBase * sidewayBoost;
    }



}

