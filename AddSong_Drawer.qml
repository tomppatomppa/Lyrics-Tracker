import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.LocalStorage 2.12
import "javascript.js" as Myscript
Drawer {
    property real menuBarHeight: 50
    property int itemIndex: 0
    property string titleString: ""


    id: addSong_Drawer
    width: parent.width
    height: parent.height-menuBarHeight
    edge: Qt.BottomEdge
    background: Rectangle {
        anchors.fill: parent
        color: "#2C5E50"
    }

    Rectangle {
        id: btnContainer
        height: parent.height
        width: 50
        anchors.right: parent.right

        color: "red"
        anchors.topMargin: 20
        RoundButton {
            id: pasteBtn
            anchors.left: parent.TopLeft
            anchors.horizontalCenter: parent.horizontalCenter

            text: "Paste"
            onClicked: {
                console.log("paste")
                //titleInput.append(titleInput.paste())
            }
        }
        //not working
//        RoundButton {
//            id: copyBtn
//            anchors.left: pasteBtn.right
//            anchors.verticalCenter: parent.verticalCenter
//            property string test: ""
//            text: "Copy"
//            onClicked: {

//                test += titleInput.copy()
//                console.log(titleInput.copy())

//            }
//        }
//        //not working
//        RoundButton {
//            id: selectAllBtn
//            anchors.left: copyBtn.right
//            anchors.verticalCenter: parent.verticalCenter
//            property string test: ""
//            text: "Save existing"
//            onClicked: {
//                //Myscript.readData(songName.text)

//                console.log(titleString + " Title here")
//                myListModel.set(itemIndex, {"titleText": songName.text})
//                titleInput.clear()
//                songName.clear()
//                addSong_Drawer.close()
//            }
//        }
//        RoundButton {
//            id: deleteBtn
//            anchors.left: selectAllBtn.right
//            anchors.verticalCenter: parent.verticalCenter
//            text: "Delete"
//            onClicked: {

//                titleInput.cut()
//            }
//        }
//        RoundButton {
//            id: saveBtn
//            anchors.right: parent.right
//            anchors.verticalCenter: parent.verticalCenter
//            text: "Save"
//            onClicked: {
//                //findInDrawer(itemIndex, "random")
//                if(titleInput.text != "" &&
//                        songName.text != "") {
//                        Myscript.storeData(songName.text, titleInput.text)
////                      if(Myscript.readData(titleInput)) {
////                          console.log("Existing value")
////                      }
////                      else {
////                          console.log("new title")
////                      }

////                    Myscript.storeData(songName.text, titleInput.text)
//                      //myListModel.append({"titleText": songName.text, "lyricText": titleInput.text})
//                    titleInput.clear()
//                    songName.clear()
//                    addSong_Drawer.close()
//                }
//                else {
//                    console.log("Enter title")
//                }


//            }
//        }



    }
    Rectangle {
        id: titleRect
        width: parent.width-50
        height: 35
        anchors.top: parent.top
        color: "blue"
        TextField {
            id: titleText
            maximumLength: 30
            anchors.left: deleteBtn.right
            anchors.centerIn: parent.horizontalCenter
            placeholderText: "title"
        }
    }
}

//    ScrollView {
//        id: scrollView
//        width: parent.width
//        height: parent.height-menuBarHeight
//        anchors.top: btnContainer.bottom
//        TextArea {
//            id: titleInput
//            width: parent.width
//            horizontalAlignment: TextEdit.AlignHCenter
//            placeholderText: if (lyricString != "")
//                             {

//                                 titleInput.text = lyricString
//                             }
//                             else {
//                                 placeholderText = "Add lyrics"
//                             }
//            text: lyricString
//            textMargin: 50
//            font.pointSize: 20
//            wrapMode: TextArea.Wrap
//            selectByMouse : true

//        }


//    }



//}
