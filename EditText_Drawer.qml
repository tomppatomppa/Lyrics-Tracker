import QtQuick 2.0
import QtQuick.Controls 2.5
Drawer {

    property string aString: ""

    property real menuBarHeight: 50+30

    id: editText_Drawer
    width: parent.width
    height: parent.height-menuBarHeight
    edge: Qt.BottomEdge
    background: Rectangle {
        anchors.fill: parent
        color: "#2C5E50"
    }
    Label {
        id: random
        text: aString
        height: 50
        width: parent.width

    }


}
