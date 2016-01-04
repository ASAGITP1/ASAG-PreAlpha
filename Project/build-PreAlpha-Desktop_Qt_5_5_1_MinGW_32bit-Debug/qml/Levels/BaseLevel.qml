import QtQuick 2.0
import VPlay 2.0

import "../Enemy"
import "../Modules"
import "../Player"
import "../Scenes"

Item {
    property string levelName
    property bool active: false
    property Player playerP
    property BackgroundMusic backgroundMusic: backgroundMusic


    BackgroundMusic {
        id: backgroundMusic
        autoPlay: false
    }

    function end() {
        backgroundMusic.stop();
    }
}

