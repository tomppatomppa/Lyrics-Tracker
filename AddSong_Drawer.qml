import QtQuick 2.0
import QtQuick.Controls 2.5

Drawer {
    property real menuBarHeight: 50
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
            text: "Select All"
            onClicked: {
                titleInput.selectAll()
                test += titleInput.text
                console.log("select all")

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

                console.log(titleInput.selectionStart, titleInput.selectionEnd)

            }
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
            placeholderText: "Place your text"
            textMargin: 50
            wrapMode: TextArea.Wrap
            selectByMouse : true

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
