/*
    Copyright (C) 2018 Sebastian J. Wolf

    This file is part of Funzel.

    Funzel is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 2 of the License, or
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
import "."

CoverBackground {

//    Image {
//        source: "../../images/background.png"
//        anchors {
//            verticalCenter: parent.verticalCenter

//            bottom: parent.bottom
//            bottomMargin: Theme.paddingMedium

//            right: parent.right
//            rightMargin: Theme.paddingMedium
//        }

//        fillMode: Image.PreserveAspectFit
//        opacity: 0.1
//    }

    Label {
        text: "Funzel"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: Theme.fontSizeExtraLarge
        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }
    }

}
