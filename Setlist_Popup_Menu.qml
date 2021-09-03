import QtQuick.Window 2.2
import QtQuick.Controls 2.5

import QtQuick.Layouts 1.3
import "javascript.js" as Myscript
Popup {
    id: popup
    anchors.centerIn: parent
    width: 200
    height: 150
    modal: true
    focus: true
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
    background:   Rectangle {
        id: bgPopup
        anchors.margins: 0
        anchors.fill: parent
        color: "#2C3E50"
    }


    Rectangle {
        width: parent.width; height: parent.height
        color: "#425b75"
        ColumnLayout {
            width: parent.width-20
            anchors.centerIn: parent
            spacing: 25

            TextField {
                id: setlistInput
                placeholderText: if(loadSpotifyBtn.checked) {
                                     qsTr("Spotify Playlist ID")
                                 }else {
                                     qsTr("Setlist Name")
                                 }

                Layout.fillWidth: true
                focus: true
            }
            RowLayout {
                Button {

                    text: "Ok"
                    Layout.fillWidth: true
                    //delay: 2000
                    Timer {
                        id: timer
                    }

                    onClicked: {
                        if(setlistInput.text !== "") {
                            console.log("something")
                            if(loadSpotifyBtn.checked) {
                                console.log("spotify")
                                loadSpotifyBtn.checked=false
                                Myscript.getSpotifyTitle()
                                delayFunc(5000, function(){
                                 console.log("asdasd")
                                 Myscript.updateListView()
                                })


                            }
                            else {
                                console.log("add setlist name")
                            }
                        }
                        console.log("update")
                        setlistInput.text = ""
                        popup.close()
                    }




                }
                Button {
                    text: "Cancel"
                    Layout.fillWidth: true
                    onClicked: {
                        loadSpotifyBtn.checked=false
                        popup.close()
                    }
                }


            }
        }
    }


    function delayFunc(delayTime, cb) {
        timer.interval = delayTime;
        timer.repeat = false;
        timer.triggered.connect(cb);
        timer.start();
    }
//    Component.onCompleted: {
//        delay(1000, function(){
//            console.log("asdasd")

//    });


}


