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
#include <QDBusConnection>
#include <QDBusInterface>
#include <QDBusMessage>
#include <QSettings>
#include <QVariantList>
#include <QVariantMap>
#include <QSqlDatabase>
#include <QSqlQuery>
#include "wagnis/wagnis.h"

class Funzel : public QObject
{
    Q_OBJECT
public:
    explicit Funzel(QObject *parent = 0);
    ~Funzel();
    Wagnis *getWagnis();

    Q_INVOKABLE void powerLed(const int &ledNumber, const int &intensityRed, const int &intensityGreen, const int &intensityBlue);
    Q_INVOKABLE void setUseAnimation(const bool &useAnimation);
    Q_INVOKABLE bool getUseAnimation();
    Q_INVOKABLE void setAnimationColor(const int &animationColor);
    Q_INVOKABLE int getAnimationColor();
    Q_INVOKABLE bool isGeminiFound();
    Q_INVOKABLE bool isContactsDbAvailable();
    Q_INVOKABLE void loadContacts();
    Q_INVOKABLE void assignAnimationColor(const QString &animationColor, const QString &contactId);
    Q_INVOKABLE void deleteContactAssignment(const QString &contactId);
    Q_INVOKABLE QVariantMap getColorAssignments();
    Q_INVOKABLE QString getContactDisplayName(const QString &contactId);
    Q_INVOKABLE QString getColorId(const int &colorIndex);
    Q_INVOKABLE int getColorIndex(const QString &colorId);

signals:
    void powerOn();
    void powerColor(const int &colorIndex);
    void powerOff();
    void useAnimationChanged();
    void animationColorChanged();
    void contactAssignmentsInvalidated();
    void contactsLoaded(const QVariantList &contacts);
    void errorLoadingContacts();

public slots:
    void onIncomingCall(const QDBusMessage &dBusMessage);
    void onCallStatusChanged(const QDBusMessage &dBusMessage);
    void onVoiceCallsChanged(const QDBusMessage &dBusMessage);

private:
    QNetworkAccessManager *networkAccessManager;
    Wagnis *wagnis;
    QSettings settings;
    bool geminiFound;
    bool canUseContactsDb;
    QSqlDatabase database;
    QVariantMap contacts;
    QVariantMap colorAssignments;
    QVariantMap contactAssignments;
    int currentColorIndex = -1;

    void initializeDatabase();
    void initializeContactAssignments();
    void synchronizeData();
};

#endif // FUNZEL_H
