import QtQuick 2.15
import QtQuick.LocalStorage 2.12
import QtQuick.Controls 2.5

import "javascript.js" as Myscript
ApplicationWindow {

        property var db;
        width: 360
        height: 720
        visible: true

        title: "Setlist-Tracker"

       StackView {
            id: contentFrame

            anchors.fill: parent
            initialItem: Qt.resolvedUrl("qrc:/Load_page.qml")
       }
       Component.onCompleted: {

           Myscript.initDatabase()
           //Myscript.readData()
           console.log("Load completed")
           contentFrame.replace("qrc:/Main_Page.qml")

       }
       Component.onDestruction: {
           //Myscript.storeData()

       }


}

//            Timer {
//                        id: timer
//                    }

//                    function delay(delayTime, cb) {
//                        timer.interval = delayTime;
//                        timer.repeat = false;
//                        timer.triggered.connect(cb);
//                        timer.start();
//                    }
