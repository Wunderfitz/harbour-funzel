/*
    Copyright (C) 2018 Sebastian J. Wolf

    This file is part of Funzel.

    Funzel is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Funzel is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Funzel. If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0
import "../components"

Page {
    id: colorSelectionPage
    allowedOrientations: Orientation.All

    property string contactId;

    focus: true
    Keys.onLeftPressed: {
        pageStack.pop();
    }
    Keys.onEscapePressed: {
        pageStack.pop();
    }
    Keys.onDownPressed: {
        colorListView.flick(0, - parent.height);
    }
    Keys.onUpPressed: {
        colorListView.flick(0, parent.height);
    }
    Keys.onPressed: {
        if (event.key === Qt.Key_T) {
            colorListView.scrollToTop();
            event.accepted = true;
        }
        if (event.key === Qt.Key_B) {
            colorListView.scrollToBottom();
            event.accepted = true;
        }
        if (event.key === Qt.Key_PageDown) {
            colorListView.flick(0, - parent.height * 2);
            event.accepted = true;
        }
        if (event.key === Qt.Key_PageUp) {
            colorListView.flick(0, parent.height * 2);
            event.accepted = true;
        }
    }

    SilicaFlickable {
        id: colorContainer
        width: parent.width
        height: parent.height

        Column {
            anchors.fill: parent

            PageHeader {
                id: colorHeader
                title: qsTr("Select a Color")
            }

            SilicaListView {
                id: colorListView

                anchors.left: parent.left
                anchors.right: parent.right
                height: parent.height - colorHeader.height

                clip: true

                model: ListModel {
                    id: colorModel
                    ListElement {
                        colorName: qsTr("Red")
                        colorId: "red"
                    }
                    ListElement {
                        colorName: qsTr("Green")
                        colorId: "green"
                    }
                    ListElement {
                        colorName: qsTr("Blue")
                        colorId: "blue"
                    }
                    ListElement {
                        colorName: qsTr("Yellow")
                        colorId: "yellow"
                    }
                    ListElement {
                        colorName: qsTr("Light Blue")
                        colorId: "lightBlue"
                    }
                    ListElement {
                        colorName: qsTr("Purple")
                        colorId: "purple"
                    }
                    ListElement {
                        colorName: qsTr("White")
                        colorId: "white"
                    }
                }

                delegate: ListItem {
                    contentHeight: Theme.itemSizeSmall
                    Label {
                        id: singleContact
                        text: colorName
                        width: parent.width - 2 * Theme.horizontalPageMargin
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    onClicked: {
                        console.log("We selected contact ID " + contactId + " with color " + colorModel.get(index).colorId);
                        funzel.assignAnimationColor(colorModel.get(index).colorId, contactId);
                        pageStack.clear();
                        pageStack.push(Qt.resolvedUrl("OverviewPage.qml"));
                    }
                }
                VerticalScrollDecorator {}
            }

        }

    }
}


