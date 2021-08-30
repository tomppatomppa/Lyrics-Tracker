import QtQuick.Window 2.2
import QtQuick.Controls 2.5

import QtQuick.Layouts 1.3

Popup {
    id: popup
    anchors.centerIn: parent
//    x: 100
//    y: 100
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
                placeholderText: qsTr("Setlist Name")
                Layout.fillWidth: true
                focus: true
            }
            RowLayout {
                Button {
                    text: "Ok"
                    Layout.fillWidth: true
                    onClicked: {
                        if(setlistInput.text !== "") {
                            console.log("something")
                        }
                        setlistInput.text = ""
                        popup.close()
                    }
                }

                Button {
                    text: "Cancel"
                    Layout.fillWidth: true
                    onClicked: {
                        popup.close()
                    }
                }
            }
        }
    }

//    TextField {
//        id: setlistInput
//        width: 100
//        height: 5
//        anchors.centerIn: parent
//        maximumLength: 10
//        placeholderText: "Name Setlist"
//        focus: true
//        selectByMouse: true
//    }
//    Rectangle {
//        id: containerBtns
//        //anchors.left: setlistInput.BottomLeft
//        //anchors.centerIn: setlistInput
//        anchors.top: parent.bottom

//        Button{
//            id: setOkBtn
//            anchors.right: setlistInput.left

//            width: setlistInput.width/2
//            onClicked: {
//                console.log("ok")
//            }


//        }
//        Button {
//            id: setCancelBtn
//            width: setlistInput.width/2
//            anchors.left: setOkBtn.right
//            onClicked: {
//                console.log("cancel")
//            }
//        }
//    }
}

