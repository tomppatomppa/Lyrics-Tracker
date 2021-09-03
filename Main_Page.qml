import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtQuick.LocalStorage 2.12
import "javascript.js" as Myscript
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
                property int indexValue;
            }
            delegate: MouseArea {
                id: myDelegate
                width: bgRec.width
                height: 30

                onPressAndHold: {
                    listView.currentIndex = index
                    warningPopup.removeIndex = listView.currentIndex
                    //addSong_Drawer.itemIndex = listView.currentIndex
                    //myListModel.remove(listView.currentIndex)
                    warningPopup.open()




                }

                onClicked: {
                    listView.currentIndex = index
                    var title_data = myListModel.get(listView.currentIndex).titleText
                    var lyrics_data = Myscript.getLyricsData(title_data)
                    addSong_Drawer.titleString = title_data
                    addSong_Drawer.lyricString = lyrics_data
                    //Myscript.setMenuBtnState()
                    addSong_Drawer.open()


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
            }

            Component.onCompleted: {
                    Myscript.updateListView()
//                if(addSong_Drawer.closed) {
//                    addSong_Drawer.titleString = ""
//                    addSong_Drawer.lyricString = ""
//                }
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
                        console.log("Open drawer button")
                    }
                }
                Button {
                    id: setlistBtn
                    Material.background: Material.BlueGrey
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    text: "Setlists"
                    anchors.leftMargin: 5
                    anchors.bottomMargin: 0
                    implicitWidth: parent.width/4
                    onClicked: {
                        Myscript.toggleSetList()




                    }
                    Set_List_Drawer {
                        id: set_List_Drawer
                        visible: false
                        anchors.top: setlistBtn.bottom
                        anchors.horizontalCenter: setlistBtn.horizontalCenter
                        anchors.topMargin: 0
                        width: parent.width

                    }


                }
                Button {
                    id: addSetListBtn
                    Material.background: Material.BlueGrey
                    anchors.left: setlistBtn.right
                    anchors.verticalCenter: parent.verticalCenter
                    text: "New Setlist"
                    anchors.leftMargin: 5
                    anchors.bottomMargin: 0
                    implicitWidth: parent.width/4
                    onClicked: {
                        console.log("add setlist")
                        popup.open()

                    }
                }
                Button {
                    checkable: true
                    id: loadSpotifyBtn
                    Material.background: Material.BlueGrey
                    anchors.left: addSetListBtn.right
                    anchors.verticalCenter: parent.verticalCenter
                    text: "Spotify"
                    anchors.leftMargin: 5
                    anchors.bottomMargin: 0
                    implicitWidth: parent.width/4
                    onClicked: {
                        popup.open()
                    }
                }
            }
        }
    }



    AddSong_Drawer {
        id: addSong_Drawer
    }
    Setlist_Popup_Menu {
        id: popup
    }
    Warning_Remove_Item {
        id: warningPopup
    }

}

