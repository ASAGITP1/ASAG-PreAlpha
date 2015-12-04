import VPlay 2.0
import QtQuick 2.0

EntityBase{
    id:enemy
    entityType: "enemy"
    width: 50
    property int hp: 20

    Rectangle {
        id: rectangle
        height: 50
        width: 50
        color: "red"
    }


    BoxCollider {
        id: collider
        height: 50
        width: 50
        categories: Box.Category3
        collidesWith: Box.Category1 | Box.Category2
        sensor: true
        fixture.onBeginContact: {
            var body = other.getBody();
            var collidedEntity = body.target;
            var collidedEntityType = collidedEntity.entityType;
            getHit(collidedEntityType);
        }
    }

    Component.onCompleted: startPhys()


    function startPhys() {
        collider.linearVelocity = Qt.point(0, 25)
    }

    function getHit(type) {
        if(type === "shot") {
            hp--;
            if(hp <= 0)
                enemy.removeEntity();
        }
    }
}
