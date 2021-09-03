import QtQuick.Window 2.2
import QtQuick.Controls 2.5

import QtQuick.Layouts 1.3
import "javascript.js" as Myscript
Popup {
    id: warningPopup
    anchors.centerIn: parent
    width: 200
    height: 150
    modal: true
    focus: true
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

    Rectangle {
        width: parent.width;
        height: parent.height;
        color: "red"
        ColumnLayout {

            width: parent.width-20
            anchors.centerIn: parent
            spacing: 25
        }
        Label {
            id: warningText
            width: parent.width
            horizontalAlignment: TextEdit.AlignHCenter
            text: "Attention! \n The following action will permanently remove selected data"
            wrapMode: "WordWrap"
            anchors.centerIn: parent
        }

        RowLayout {

            anchors.margins: 15
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            Button {
                text: "Accept"
                Layout.fillWidth: true
            }
            Button {
                text: "Cancel"
                Layout.fillWidth: true
            }
        }
    }

}
