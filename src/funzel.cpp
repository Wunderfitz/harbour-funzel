#include "funzel.h"

Funzel::Funzel(QObject *parent) : QObject(parent)
{
    this->networkAccessManager = new QNetworkAccessManager(this);
    wagnis = new Wagnis(this->networkAccessManager, "harbour-funzel", "0.1", this);
}

Wagnis *Funzel::getWagnis()
{
    return this->wagnis;
}
