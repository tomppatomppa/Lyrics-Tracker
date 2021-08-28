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

                onPressAndHold: {
                    listView.currentIndex = index
                    addSong_Drawer.itemIndex = listView.currentIndex
                    var title_data = myListModel.get(listView.currentIndex).titleText
                    var lyrics_data = Myscript.readData(title_data)
                    addSong_Drawer.titleString = title_data
                    if(lyrics_data) {
                        addSong_Drawer.lyricString = lyrics_data
                    }

                    //myListModel.set(listView.currentIndex, {"titleText":"test", "lyricText": "random"})
                    //console.log(myListModel.get(listView.currentIndex).lyricText)
                    addSong_Drawer.open()
                }

                //not working
                onClicked: {
                    listView.currentIndex = index
                    var lyrics_data = Myscript.readData(myListModel.get(listView.currentIndex).titleText)
                    var title_data = myListModel.get(listView.currentIndex).titleText
                    console.log("Open Existing Item")

                    addSong_Drawer.open()
                    //EditText_Drawer.aString === myListModel.get(listView.currentIndex).titleText

                    //console.log(myListModel.get(listView.currentIndex).lyricText)
//                    addSong_Drawer.titleString = myListModel.get(listView.currentIndex).titleText
//                    addSong_Drawer.lyricString = myListModel.get(listView.currentIndex).lyricText
//                    addSong_Drawer.itemIndex = listView.currentIndex

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
            RoundButton {
                id:addData
                text: databutton

                anchors.centerIn: parent
                onClicked: {
                    myListModel.clear()
                    console.log("component")
                    var data_container = [Myscript.readAllData()]
                    var data_size = data_container.length
                    if(!data_size) {
                        console.log("empty database")
                        return
                    }
                    else {
                        for(var i = 0; i < data_size;i++ ) {
                            console.log("Add do listview "+data_container[i])
                            myListModel.append({"titleText": data_container[i], "lyricText": "default" })
                        }
                    }

                }
            }

            Component.onCompleted:     {

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
            }


        }
    }

    AddSong_Drawer {
        id: addSong_Drawer

    }
    EditText_Drawer {
        id: editText_Drawer


    }


}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.125}
}
##^##*/
