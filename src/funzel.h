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

#ifndef FUNZEL_H
#define FUNZEL_H

#include <QObject>
#include <QNetworkAccessManager>
#include "wagnis/wagnis.h"

class Funzel : public QObject
{
    Q_OBJECT
public:
    explicit Funzel(QObject *parent = 0);
    Wagnis *getWagnis();

signals:

public slots:

private:
    QNetworkAccessManager *networkAccessManager;
    Wagnis *wagnis;
};

#endif // FUNZEL_H
