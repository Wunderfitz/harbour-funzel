# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-funzel

CONFIG += sailfishapp

QT += core dbus sql

include(src/wagnis/wagnis.pri)
SOURCES += src/harbour-funzel.cpp \
    src/funzel.cpp

SAILFISHAPP_ICONS = 86x86 108x108 128x128

gui.files = qml
gui.path = /usr/share/$${TARGET}

images.files = images
images.path = /usr/share/$${TARGET}

ICONPATH = /usr/share/icons/hicolor

86.png.path = $${ICONPATH}/86x86/apps/
86.png.files += icons/86x86/harbour-piepmatz.png

108.png.path = $${ICONPATH}/108x108/apps/
108.png.files += icons/108x108/harbour-piepmatz.png

128.png.path = $${ICONPATH}/128x128/apps/
128.png.files += icons/128x128/harbour-piepmatz.png

256.png.path = $${ICONPATH}/256x256/apps/
256.png.files += icons/256x256/harbour-piepmatz.png

funzel.desktop.path = /usr/share/applications/
funzel.desktop.files = harbour-funzel.desktop

INSTALLS += 86.png 108.png 128.png 256.png \
            piepmatz.funzel gui images

CONFIG += sailfishapp_i18n

TRANSLATIONS += translations/harbour-funzel-de.ts

HEADERS += \
    src/funzel.h

DISTFILES += qml/harbour-funzel.qml \
    qml/cover/CoverPage.qml \
    rpm/harbour-funzel.changes.in \
    rpm/harbour-funzel.changes.run.in \
    rpm/harbour-funzel.spec \
    rpm/harbour-funzel.yaml \
    translations/*.ts \
    images/*.png \
    harbour-funzel.desktop \
    qml/pages/*.qml \
    qml/components/*.qml \
    qml/components/TheHoffModel.qml
