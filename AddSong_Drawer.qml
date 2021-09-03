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
        color: "#000"
    }
    Rectangle {
        id: btnContainer
        height: parent.height
        width: 50
        anchors.right: parent.right
        color: "#2C3E50"
        RoundButton {
            id: pasteBtn
            anchors.left: parent.TopLeft
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.topMargin: 50
            text: "Paste"
            onClicked: {
                console.log("paste")
                console.log(titleString+" " + lyricString)
            }
        }
        RoundButton {
            id: saveBtn
            anchors.top: pasteBtn.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Save"
            onClicked: {
                if(titleInput.text != "") {
                    Myscript.dbInsert(titleInput.text, lyricInput.text)
                    Myscript.clearDrawer()
                    Myscript.updateListView()
                    addSong_Drawer.close()
                }
                else {
                    console.log("Enter title")
                }
            }
        }

    }
    /***title Text***/
    Rectangle {
        id: titleRect
        width: parent.width-50
        height: 35
        anchors.top: parent.top
        color: "#2C3E50"
        TextField {
            id: titleInput
            maximumLength: 30
            anchors.centerIn: parent.horizontalCenter
            placeholderText: "title"
            text: titleString
        }
    }
    //Where lyric text goes
    ScrollView {
        id: scrollView
        anchors.top: titleRect.bottom
        anchors.right: btnContainer.left
        width: parent.width
        height: parent.height
        TextArea {
            id: lyricInput
            width: parent.width
            horizontalAlignment: TextEdit.AlignHCenter

            placeholderText: "Input lyrics"
            text: lyricString
            textMargin: 50
            font.pointSize: 20
            wrapMode: TextArea.Wrap
            selectByMouse : true
        }
    }


    //when drawer is closed
    onClosed: {
        Myscript.clearDrawer()
    }
}

