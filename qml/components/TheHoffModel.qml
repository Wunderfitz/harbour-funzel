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

VisualItemModel {

    property int red: 1;
    property int green: 0;
    property int blue: 0;

    function setColorIndex(chosenIndex) {
        switch (chosenIndex) {
        case 0:
            red   = 1;
            green = 0;
            blue  = 0;
            break;
        case 1:
            red   = 0;
            green = 1;
            blue  = 0;
            break;
        case 2:
            red   = 0;
            green = 0;
            blue  = 1;
            break;
        case 3:
            red   = 1;
            green = 1;
            blue  = 0;
            break;
        case 4:
            red   = 0;
            green = 1;
            blue  = 1;
            break;
        case 5:
            red   = 1;
            green = 0;
            blue  = 1;
            break;
        case 6:
            red   = 1;
            green = 1;
            blue  = 1;
            break;
        }
    }

    function startTheHoff() {
        console.log("[Funzel] Starting the Hoff...", red, green, blue);
        timerOne.start();
    }

    function stopTheHoff() {
        console.log("[Funzel] Stopping the Hoff...");
        timerOne.powerOff();
        timerTwo.powerOff();
        timerThree.powerOff();
        timerFour.powerOff();
        timerFive.powerOff();
    }

    TheHoffTimer {
        id: timerOne
        myLed: 1;
        hoffModel: parent
    }
    TheHoffTimer {
        id: timerTwo
        myLed: 2;
        hoffModel: parent
    }
    TheHoffTimer {
        id: timerThree
        myLed: 3;
        hoffModel: parent
    }
    TheHoffTimer {
        id: timerFour
        myLed: 4;
        hoffModel: parent
    }
    TheHoffTimer {
        id: timerFive
        myLed: 5;
        hoffModel: parent
    }
}
