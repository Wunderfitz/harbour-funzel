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

Timer {
    property int myLed ;
    property int intensity : 0;
    property bool brighter : true;
    property bool upwards : true;
    property variant hoffModel;
    interval: 50
    repeat: true
    function powerOff() {
        stop();
        funzel.powerLed(myLed, 0, 0, 0);
    }

    onTriggered: {
        if (intensity === 3) {
            brighter = false;
            if (myLed === 1) {
                for (var i = 0; i <= 4; i++) {
                    hoffModel.get(i).upwards = true;
                }
                for (var j = 1; j <= 4; j++) {
                    hoffModel.get(j).brighter = true;
                }
                hoffModel.get(1).start();
            }
            if (myLed === 5) {
                for (var k = 0; k <= 4; k++) {
                    hoffModel.get(k).upwards = false;
                }
                for (var l = 0; l <= 3; l++) {
                    hoffModel.get(l).brighter = true;
                }
                hoffModel.get(3).start();
            }
        }
        if (intensity === 2) {
            if (upwards && myLed < 5) {
                hoffModel.get(myLed).start();
            }
            if (!upwards && myLed > 1) {
                hoffModel.get(myLed - 2).start();
            }
        }
        if (brighter) {
            intensity++;
        } else {
            intensity--;
        }
        funzel.powerLed(myLed, intensity, 0, 0);
        if (intensity === 0) {
            stop();
        }
    }
}
