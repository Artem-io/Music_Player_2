import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

Item {
    id: root
    width: 30
    height: 32

    property bool enabled: true
    property alias image: playPauseIcon.source

    signal clicked()

    Button {
        id: playPause
        enabled: audioPlayer.curSongList.length > 0
        width: root.width
        height: root.height

        contentItem: Image {
            id: playPauseIcon
            anchors.fill: parent
            source: "assets/icons/pause.png"
            fillMode: Image.PreserveAspectFit
        }

        background: Rectangle {
            color: "transparent"
        }
        onClicked: {
            playPauseAnimation.start()
            root.clicked()
        }

        SequentialAnimation {
            id: playPauseAnimation
            NumberAnimation {
                target: playPauseIcon
                property: "scale"
                to: 0.9
                duration: 100
                easing.type: Easing.InOutQuad
            }

            NumberAnimation {
                target: playPauseIcon
                property: "scale"
                to: 1.0
                duration: 100
                easing.type: Easing.InOutQuad
            }
        }
    }
}
