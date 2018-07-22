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
    id: overviewPage

    allowedOrientations: Orientation.All

    TheHoffModel {
        id: hoffModel
    }

    Component.onCompleted: {
        funzelSwitch.checked = funzel.getUseAnimation();
        funzelColor.currentIndex = funzel.getAnimationColor();
    }

    Connections {
        target: funzel
        onPowerOn: {
            if (funzelSwitch.checked) {
                hoffModel.startTheHoff();
            }
        }
        onPowerOff: {
            hoffModel.stopTheHoff();
        }
    }

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: overviewColumn.height

        PullDownMenu {
            MenuItem {
                text: qsTr("About Funzel")
                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }
        }

        Column {
            id: overviewColumn

            width: overviewPage.width
            spacing: Theme.paddingMedium
            PageHeader {
                title: qsTr("Welcome to Funzel")
            }

            TextSwitch {
                id: funzelSwitch
                text: qsTr("Enable LED animation on incoming call")
                description: qsTr("When your Gemini PDA receives a call, the backside LEDs will show an animation.")
                onCheckedChanged: {
                    funzel.setUseAnimation(checked);
                }
            }

            ComboBox {
                id: funzelColor
                label: qsTr("Animation Color")
                menu: ContextMenu {
                    MenuItem {
                        text: qsTr("Red")
                    }
                    MenuItem {
                        text: qsTr("Green")
                    }
                    MenuItem {
                        text: qsTr("Blue")
                    }
                    MenuItem {
                        text: qsTr("Yellow")
                    }
                    MenuItem {
                        text: qsTr("Light Blue")
                    }
                    MenuItem {
                        text: qsTr("Purple")
                    }
                    MenuItem {
                        text: qsTr("White")
                    }
                }
                enabled: funzelSwitch.checked
                onCurrentIndexChanged: {
                    funzel.setAnimationColor(currentIndex);
                    switch (currentIndex) {
                    case 0:
                        hoffModel.red   = 1;
                        hoffModel.green = 0;
                        hoffModel.blue  = 0;
                        break;
                    case 1:
                        hoffModel.red   = 0;
                        hoffModel.green = 1;
                        hoffModel.blue  = 0;
                        break;
                    case 2:
                        hoffModel.red   = 0;
                        hoffModel.green = 0;
                        hoffModel.blue  = 1;
                        break;
                    case 3:
                        hoffModel.red   = 1;
                        hoffModel.green = 1;
                        hoffModel.blue  = 0;
                        break;
                    case 4:
                        hoffModel.red   = 0;
                        hoffModel.green = 1;
                        hoffModel.blue  = 1;
                        break;
                    case 5:
                        hoffModel.red   = 1;
                        hoffModel.green = 0;
                        hoffModel.blue  = 1;
                        break;
                    case 6:
                        hoffModel.red   = 1;
                        hoffModel.green = 1;
                        hoffModel.blue  = 1;
                        break;
                    }
                }
            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Test Animation")
                enabled: funzelSwitch.checked
                onClicked: {
                    hoffModel.startTheHoff();
                    testAnimationTimer.start();
                }
            }

            Timer {
                id: testAnimationTimer
                interval: 3000
                repeat: false
                onTriggered: {
                    hoffModel.stopTheHoff();
                }
            }
        }
    }
}

