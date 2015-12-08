import QtQuick 2.0

Item {
    Rectangle {
        width: 500
        height: 500

        x:10
        y:10

        color: "blue"

        Rectangle {
            width: 50
            height: 50
            color: "grey"
             border.color:"black"

            x: 100
            y: 300
        }
        Rectangle {
            width: 50
            height: 50
            color: "grey"
             border.color:"black"

            x: 100
            y: 350
        }
    }
}

