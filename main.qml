import QtQuick 2.15

import QtQuick.Controls 2.5
ApplicationWindow {


        width: 360
        height: 720
        visible: true

        title: "Setlist-Tracker"

            Timer {
                        id: timer
                    }

                    function delay(delayTime, cb) {
                        timer.interval = delayTime;
                        timer.repeat = false;
                        timer.triggered.connect(cb);
                        timer.start();
                    }
       StackView {
            id: contentFrame
            //fill screen"parent"
            anchors.fill: parent

            initialItem: Qt.resolvedUrl("qrc:/Load_page.qml")

       }
       Component.onCompleted: {
           console.log("start timer")
           delay(0, function() {
               contentFrame.replace("qrc:/Main_Page.qml")
           })



}
}
