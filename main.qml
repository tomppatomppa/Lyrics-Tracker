import QtQuick 2.15

import QtQuick.Controls 2.5
ApplicationWindow {

        id:root
        width: 640
        height: 480
        visible: true

        title: "Setlist-Tracker"

       StackView {
            id: contentFrame
            //fill screen"parent"
            anchors.fill: parent
            initialItem: Qt.resolvedUrl("qrc:/Load_page.qml")
            Component.onCompleted: {
                contentFrame.replace("qrc:/Main_Page.qml")
            }
       }
}
