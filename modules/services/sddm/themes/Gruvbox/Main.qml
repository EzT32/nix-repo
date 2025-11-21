import QtQuick 2.15
import Sddm 1.1

Rectangle {
    width: 1920
    height: 1080
    color: "#282828"   // Gruvbox dark background

    Text {
        anchors.centerIn: parent
        text: "Login"
        color: "#ebdbb2"
        font.pointSize: 48
    }

    Login {
        id: login
        anchors.centerIn: parent
    }
}

