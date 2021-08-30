import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.LocalStorage 2.12
Item {

    width: parent.width
    height: parent.height

    Rectangle {

        id: bgRec
        anchors.fill: parent
        anchors.rightMargin: 95
        anchors.bottomMargin: 8
        anchors.leftMargin: -95
        anchors.topMargin: -8


        color: "#2C3E50"

        BusyIndicator {
            id: busyIndicator
        }



    }



}
