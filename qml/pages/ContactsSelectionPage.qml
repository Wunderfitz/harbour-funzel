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
    id: contactsSelectionPage
    allowedOrientations: Orientation.All

    focus: true
    Keys.onLeftPressed: {
        pageStack.pop();
    }
    Keys.onEscapePressed: {
        pageStack.pop();
    }
    Keys.onDownPressed: {
        contactsListView.flick(0, - parent.height);
    }
    Keys.onUpPressed: {
        contactsListView.flick(0, parent.height);
    }
    Keys.onPressed: {
        if (event.key === Qt.Key_T) {
            contactsListView.scrollToTop();
            event.accepted = true;
        }
        if (event.key === Qt.Key_B) {
            contactsListView.scrollToBottom();
            event.accepted = true;
        }
        if (event.key === Qt.Key_PageDown) {
            contactsListView.flick(0, - parent.height * 2);
            event.accepted = true;
        }
        if (event.key === Qt.Key_PageUp) {
            contactsListView.flick(0, parent.height * 2);
            event.accepted = true;
        }
    }

    property variant contactsModel;
    property bool loaded : false;

    Component.onCompleted: {
        if (!contactsModel) {
            console.log("Loading contacts from database.");
            funzel.loadContacts();
        } else {
            loaded = true;
        }
    }

    Connections {
        target: funzel
        onContactsLoaded: {
            contactsModel = contacts;
            loaded = true;
        }
        onErrorLoadingContacts: {
            loaded = true;
        }
    }

    SilicaFlickable {
        id: contactsContainer
        width: parent.width
        height: parent.height

        PullDownMenu {
            MenuItem {
                text: qsTr("Refresh")
                onClicked: {
                    contactsSelectionPage.loaded = false;
                    contactsSelectionPage.contactsModel = null;
                    funzel.loadContacts();
                }
            }
        }

        LoadingIndicator {
            id: contactsLoadingIndicator
            visible: !loaded
            Behavior on opacity { NumberAnimation {} }
            opacity: loaded ? 0 : 1
            height: parent.height
            width: parent.width
        }

        Column {
            anchors.fill: parent

            PageHeader {
                id: contactsHeader
                title: qsTr("Select a Contact")
            }

            SilicaListView {
                id: contactsListView


                anchors.left: parent.left
                anchors.right: parent.right
                height: parent.height - contactsHeader.height

                clip: true

                model: contactsModel
                delegate: ListItem {
                    contentHeight: Theme.itemSizeSmall
                    Label {
                        id: singleContact
                        text: modelData.displayName
                        width: parent.width - 2 * Theme.horizontalPageMargin
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    onClicked: {
                        console.log("Selected contact: " + modelData.contactId);
                        pageStack.push(Qt.resolvedUrl("ColorSelectionPage.qml"), {"contactId": modelData.contactId});
                    }
                }
                VerticalScrollDecorator {}
            }

        }

    }
}


