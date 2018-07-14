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
