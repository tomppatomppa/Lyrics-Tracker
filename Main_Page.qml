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
            }
            delegate: MouseArea {
                id: myDelegate
                width: parent.width
                height: 30

//                onPressAndHold: {
//                    listView.currentIndex = index
//                    addSong_Drawer.itemIndex = listView.currentIndex
//                    var title_data = myListModel.get(listView.currentIndex).titleText
//                    var lyrics_data = Myscript.readData(title_data)
//                    addSong_Drawer.titleString = title_data
//                    if(lyrics_data) {
//                        addSong_Drawer.lyricString = lyrics_data
//                    }
//                    addSong_Drawer.open()
//                }

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
                    updateListView()
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

                        console.log(loadSpotifyBtn.checked)
                        popup.open()

//                        for(var i in Myscript.getSpotifyTitle()) {
//                            console.log(i)
//                        }
                    }
                }
//                Menu_Icon {
//                    id: addNewSetlistBtn
//                    anchors.left: set_List_Drawer.right
//                    anchors.verticalCenter: parent.verticalCenter
//                }

//                Set_List_Drawer {
//                    anchors.left: parent.left
//                    anchors.verticalCenter: menuBar.verticalCenter
//                }


//                RoundButton {
//                    id:addData
//                    text: databutton

//                    anchors.centerIn: parent
//                    onClicked: {
//                        myListModel.clear()
//                        console.log("component")
//                        var data_container = [Myscript.readAllData()]
//                        var data_size = data_container.length
//                        if(!data_size) {
//                            console.log("empty database")
//                            return
//                        }
//                        else {
//                            for(var i = 0; i < data_size;i++ ) {
//                                console.log("Add do listview "+data_container[i])
//                                myListModel.append({"titleText": data_container[i], "lyricText": "default" })
//                            }
//                        }
//                    }
//                }
            }
        }
    }

    function updateListView() {
        myListModel.clear()
        var data_container = Myscript.dbReadAll()
        for(var i = 0; i < Myscript.dbReadAll().length;i++) {
            myListModel.append({"titleText": data_container[i]} )
        }

    }

    AddSong_Drawer {
        id: addSong_Drawer
    }
    Setlist_Popup_Menu {
        id: popup
    }

}

