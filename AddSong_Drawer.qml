import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.LocalStorage 2.12
import "javascript.js" as Myscript
Drawer {
    property real menuBarHeight: 50
    property int itemIndex: 0
    property string titleString: ""
    property string lyricString: ""

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
        height: 50
        width: parent.width
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.left: parent.left
        color: "#2C5E50"
        RoundButton {
            id: pasteBtn
            anchors.left: parent.TopLeft
            anchors.verticalCenter: parent.verticalCenter
            text: "Paste"
            onClicked: {
                titleInput.append(titleInput.paste())
            }
        }
        //not working
        RoundButton {
            id: copyBtn
            anchors.left: pasteBtn.right
            anchors.verticalCenter: parent.verticalCenter
            property string test: ""
            text: "Copy"
            onClicked: {

                test += titleInput.copy()
                console.log(titleInput.copy())

            }
        }
        //not working
        RoundButton {
            id: selectAllBtn
            anchors.left: copyBtn.right
            anchors.verticalCenter: parent.verticalCenter
            property string test: ""
            text: "Save existing"
            onClicked: {
                //Myscript.readData(songName.text)

                console.log(titleString + " Title here")
                myListModel.set(itemIndex, {"titleText": songName.text})
                titleInput.clear()
                songName.clear()
                addSong_Drawer.close()
            }
        }
        RoundButton {
            id: deleteBtn
            anchors.left: selectAllBtn.right
            anchors.verticalCenter: parent.verticalCenter
            text: "Delete"
            onClicked: {

                titleInput.cut()
            }
        }
        RoundButton {
            id: saveBtn
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            text: "Save"
            onClicked: {
                findInDrawer(itemIndex, "random")
                if(titleInput.text != "" &&
                        songName.text != "") {
                        Myscript.storeData(songName.text, titleInput.text)
//                      if(Myscript.readData(titleInput)) {
//                          console.log("Existing value")
//                      }
//                      else {
//                          console.log("new title")
//                      }

//                    Myscript.storeData(songName.text, titleInput.text)
                        myListModel.append({"titleText": songName.text, "lyricText": titleInput.text})
                    titleInput.clear()
                    songName.clear()
                    addSong_Drawer.close()
                }
                else {
                    console.log("Enter title")
                }


            }
        }
        TextField {
            id: songName
            anchors.left: deleteBtn.right
            anchors.verticalCenter: parent.verticalCenter
            text: titleString

//            placeholderText: if(titleString != "")
//                             {
//                                 songName.text = titleString
//                             }
//                             else {
//                                 placeholderText = "Title"
//                             }

        }

    }

    ScrollView {
        id: scrollView
        width: parent.width
        height: parent.height-menuBarHeight
        anchors.top: btnContainer.bottom
        TextArea {
            id: titleInput
            width: parent.width
            horizontalAlignment: TextEdit.AlignHCenter
//            placeholderText: if (lyricString != "")
//                             {

//                                 titleInput.text = lyricString
//                             }
//                             else {
//                                 placeholderText = "Add lyrics"
//                             }
            text: lyricString
            textMargin: 50
            font.pointSize: 20
            wrapMode: TextArea.Wrap
            selectByMouse : true

        }


    }
    function loadlyrics(){

    }

    function findInDrawer(index, title) {
        if(myListModel.count < 1) {
            console.log("Empty View")
            return false
        }

        for(var i = 0; i < myListModel.count; i++) {
            if (myListModel.index(i, 0) === title) {
                console.log("found duplicate")
                myListModel.insert({"titleText": songName.text, "lyricText": titleInput.text})
                return true

            }
            return false

        }

    }

}
//TextArea.flickable: TextArea {
//    id: titleInput

//    color: "red"
//    width: parent.width
//    height: parent.height
//    placeholderText: qsTr("Copy text here")
//    anchors.horizontalCenter: parent.horizontalCenter
//    anchors.top: parent.top
//    //anchors.topMargin: 50+20
//    anchors.margins: 10
//    wrapMode: TextArea.Wrap
//    selectByMouse : true
//}
// ScrollBar.vertical: ScrollBar { }
