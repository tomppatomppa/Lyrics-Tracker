import QtQuick 2.0
import QtQuick.Controls 2.5

Drawer {
    property real menuBarHeight: 50
    id: addSong_Drawer
    width: parent.width
    height: parent.height-menuBarHeight
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
    RoundButton {
        id: pasteBtn
        text: "paste"

        onClicked: {



            titleInput.append(titleInput.paste())


        }
    }

    TextArea {
        id: titleInput
        width: parent.width
        height: parent.height-20
        placeholderText: qsTr("Copy text here")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 50
        anchors.margins: 10


    }
    Item{
        width: parent.width
    }

}
