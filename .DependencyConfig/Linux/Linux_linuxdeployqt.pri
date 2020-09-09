# linuxdeployqt
#   https://github.com/probonopd/linuxdeployqt
#
# Qt INSTALL
#   https://doc.qt.io/qt-5/qmake-advanced-usage.html#installing-files


!macx:unix {
    target.path = "/bin"

    message("target.path = $${target.path}")
    message("target.CONFIG = $${target.CONFIG}")

    desktop.path = "/share/applications"
    desktop.files *= "$$PWD/linuxdeployqt_requirements/BesLyric-for-X.desktop"
    desktop.CONFIG *= nostrip

    message("desktop.path = $${desktop.path}")
    message("desktop.files = $${desktop.files}")
    message("desktop.CONFIG = $${desktop.CONFIG}")

    pixels = \
        16 \
        24 \
        32 \
        48 \
        64 \
        128 \
        256

    for(pixel, pixels) {
        icon_$${pixel}.path = "/share/icons/hicolor/$${pixel}x$${pixel}/apps"
        icon_$${pixel}.files *= "$$PWD/linuxdeployqt_requirements/icons/$${pixel}x$${pixel}/BesLyric-for-X.png"
        icon_$${pixel}.CONFIG *= nostrip

        message("icon_$${pixel}.path = $$eval(icon_$${pixel}.path)")
        message("icon_$${pixel}.files = $$eval(icon_$${pixel}.files)")
        message("icon_$${pixel}.CONFIG = $$eval(icon_$${pixel}.CONFIG)")

        icon_targets *= icon_$${pixel}
    }

    INSTALLS *= target desktop $$eval(icon_targets)
}
