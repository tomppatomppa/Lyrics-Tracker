import QtQuick 2.9
import QtQuick.Controls 2.5
Item {

    width: parent.width
    height: parent.height

    Rectangle {
        id: bgRec
        anchors.fill: parent


        color: "#2C3E50"

        ListView {
            id: listView
            anchors.fill: parent

            header: Item {
                id: headerListView
                width: parent.width
                height: 50

            }

        }



    }

}
