import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
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

            model: ListModel {
                id: myListModel
            }
            delegate: MouseArea {
                id: myDelegate
                width: parent.width
                height: 30

                onPressAndHold: {
                    listView.currentIndex = index

                    //console.log(myListModel.get(listView.currentIndex).titleText)
                    console.log(myListModel.get(listView.currentIndex).lyricText)
                }
                Rectangle {
                    id: bgRectList
                    height: parent.height
                    width: parent.width
                    color: index % 2 ? "green" : "blue"
                    border.color: "#fff"
                }

                Label {
                    id: title
                    text: titleText
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 20
                    color: "white"
                }
                Label {
                    id: lyric
                    text: lyricText
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.rightMargin: 20
                    color: "white"
                    visible: false
                }
            }

            /****Menu Bar******/
            Rectangle {
                id: menuBar
                anchors.top: parent.top
                anchors.topMargin: 0
                width: parent.width
                height: 50
                color: "#000"

                RoundButton{
                    id:roundBtn
                    anchors.right: parent.right
                    anchors.verticalCenter: menuBar.verticalCenter

                    anchors.rightMargin: 5
                    Material.background: Material.BlueGrey
                    Menu_Icon {
                        anchors.centerIn: parent
                    }
                    onClicked:  {
                        addSong_Drawer.open()

                        console.log("Do something")
                }
            }
            }


        }
    }
    AddSong_Drawer {
        id: addSong_Drawer
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.125}
}
##^##*/
