import QtQuick 2.0
import QtQuick.Controls 2.5
Drawer {

    id: addSong_Drawer
    width: parent.width
    height: parent.width/2
    edge: Qt.BottomEdge
    background: Rectangle {
        anchors.fill: parent
        color: "#2C5E50"
    }
    Label {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        text: "Add new Song Lyric"
        color: "white"
    }
    TextField {
        id: titleInput

    }

}
