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

#include "funzel.h"
#include <QFile>

Funzel::Funzel(QObject *parent) : QObject(parent)
{
    this->networkAccessManager = new QNetworkAccessManager(this);
    wagnis = new Wagnis(this->networkAccessManager, "harbour-funzel", "0.1", this);
}

Funzel::~Funzel()
{
    powerLed(1, 0, 0, 0);
    powerLed(2, 0, 0, 0);
    powerLed(3, 0, 0, 0);
    powerLed(4, 0, 0, 0);
    powerLed(5, 0, 0, 0);
}

Wagnis *Funzel::getWagnis()
{
    return this->wagnis;
}

void Funzel::powerLed(const int &ledNumber, const int &intensityRed, const int &intensityGreen, const int &intensityBlue)
{
    // qDebug() << "Funzel::powerLed" << ledNumber << intensityRed << intensityGreen << intensityBlue;
    QFile ledFile("/proc/aw9120_operation");
    if (ledNumber < 1 || ledNumber > 5) {
        qDebug() << "Invalid LED number" << ledNumber;
        return;
    }
    if (intensityRed < 0 || intensityRed > 3) {
        qDebug() << "Invalid red LED intensity" << intensityRed;
        return;
    }
    if (intensityGreen < 0 || intensityGreen > 3) {
        qDebug() << "Invalid green LED intensity" << intensityGreen;
        return;
    }
    if (intensityBlue < 0 || intensityBlue > 3) {
        qDebug() << "Invalid blue LED intensity" << intensityBlue;
        return;
    }
    if (ledFile.open(QIODevice::WriteOnly)) {
        QString ledString;
        ledString.append(QString::number(ledNumber));
        ledString.append(" ");
        ledString.append(QString::number(intensityRed));
        ledString.append(" ");
        ledString.append(QString::number(intensityGreen));
        ledString.append(" ");
        ledString.append(QString::number(intensityBlue));
        ledFile.write(ledString.toUtf8());
        ledFile.flush();
        ledFile.close();
    } else {
        qDebug() << "[Funzel] Unable to acquire write access to LED";
    }
}
