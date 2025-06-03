pragma ComponentBehavior: Bound
// for permitting access to window.themeColor
// from inside any component declarations in this file

import QtQuick

Window {
    id: window

    /* Your solution should contain these key features:

    - Add image resources to your project and use them in your
      design and try to show how the image URL might be changed
      using bindings inside a string template expression.

    - Add a font to your project and use a FontLoader to be able
      to use the font in your Text components.

    - Create re-usable items using inline components adding any
      "required" properties where necessary

    - Using bindings and signal handlers to connect your UI
      elements to the provided tvControl object (below) so that
      interacting with your Buttons for example, could change
      the visible, enabled, or color of some of the other
      elements based on the changed state of the tvControl
      object’s properties.

    */

    width: 240
    height: 740
    visible: true
    color: "black"

    property color themeColor: "silver"

    FontLoader {
        id: silkscreenFont
        source: Qt.resolvedUrl("fonts/Silkscreen/Silkscreen-Regular.ttf")
    }

    /* Here are a few components you can use to get you going */

    component BorderGradient: Rectangle {
        id: borderGradientRectangle

        color: window.themeColor
        property color color2: borderGradientRectangle.color.darker()

        gradient: Gradient {
            GradientStop {
                position: 0
                color: borderGradientRectangle.color
            }
            GradientStop {
                position: 1
                color: borderGradientRectangle.color2
            }
        }
    }

    component DoubleBorderGradient: BorderGradient {
        id: doubleBorderGradient

        property int innerMargin: 2

        BorderGradient {
            // inner gradient
            anchors {
                fill: parent
                margins: doubleBorderGradient.innerMargin
            }

            radius: doubleBorderGradient.radius - doubleBorderGradient.innerMargin

            // swap the colors around
            color: doubleBorderGradient.color2
            color2: doubleBorderGradient.color
        }
    }

    component Button: DoubleBorderGradient {
        id: button

        readonly property alias pressed: tapHandler.pressed
        signal clicked

        implicitWidth: 100
        implicitHeight: 40

        radius: Math.min(width, height) / 2

        color: tapHandler.pressed ? window.themeColor : window.themeColor.darker()
        color2: tapHandler.pressed ? window.themeColor.darker() : window.themeColor

        TapHandler {
            id: tapHandler
            gesturePolicy: TapHandler.WithinBounds
            onTapped: button.clicked()
        }
    }

    component CircleButton: Button {
        id: circleButton

        width: 200
        height: width // a circle

        // The CircleButton uses Item's containmentMask
        // property to return the boolean result of a
        // simplified test to check if the point is inside
        // the circle or not.
        containmentMask: QtObject {
            function contains(clickPoint: point) : bool {
                return (Math.pow(clickPoint.x - circleButton.radius, 2) +
                        Math.pow(clickPoint.y - circleButton.radius, 2))
                        < Math.pow(circleButton.radius, 2)
            }
        }
    }

    QtObject {
        id: tvControl

        property int channelNumber: 0
        readonly property string channelNumberString: `Channel ${channelNumber.toString().padStart(2,"0")}`
        readonly property string channelName: channelNames[channelNumber]

        // TV Features
        property bool closedCaptionsEnabled: true
        property bool hdrEnabled: true
        property bool castConnected: true
        property bool listening: false
        property bool muted: false
        property real volume: 0.75
        readonly property bool soundOn: !muted && volume > 0

        function incrementVolume() {
            volume = Math.min(1, volume + 0.1)
        }

        function decrementVolume() {
            volume = Math.max(0, volume - 0.1)
        }

        function incrementChannel() {
            channelNumber = Math.min(channelNames.length - 1, channelNumber + 1)
        }

        function decrementChannel() {
            channelNumber = Math.max(0, channelNumber - 1)
        }

        property list<string> channelNames: [
            "News Station",
            "Comedy Cable",
            "Eats and Beats",
            "Weather",
            "Cartoons",
            "Reality TV"
        ]
    }

    // Here we provide a suggested remote control background
    DoubleBorderGradient {
        id: remoteControlBackground

        anchors.fill: parent
        innerMargin: 8
        radius: 40
    }

    // As a demonstration of one of the Button types,
    // we add a power button.
    CircleButton {
        id: powerButton

        anchors {
            top: parent.top
            right: parent.right
            topMargin: 20
            rightMargin: 20
        }
        width: 40
        height: 40
        color: "darkred"

        onClicked: window.close()
    }

    DoubleBorderGradient{
        id: screen

        width: 210
        height: 100
        radius: 10

        color: "lightblue"
        opacity: 0.5

        anchors{
            top: remoteControlBackground.top
            horizontalCenter: remoteControlBackground.horizontalCenter
            topMargin: 90
        }

        Text {
            id: channelNumberText

            anchors {
                top: parent.top
                topMargin: 5
                left: parent.left
                leftMargin: 5
            }

            font {
                family: silkscreenFont.font.family
                pixelSize: 20
            }

            text: tvControl.channelNumberString
            color: "black"
        }

        Text {
            id: channelName
            anchors {
                top: channelNumberText.bottom
                left: parent.left
                leftMargin: 5
            }

            font {
                family: silkscreenFont.font.family
                pixelSize: 16
            }

            text: tvControl.channelName
            color: "black"
        }

        Row { // bottom LCD Icons
            anchors{
                left: screen.left
                right: screen.right
                bottom: screen.bottom
                margins: 5
            }

            spacing: 5

            Image {
                width: 32
                height: 32
                source: "images/closed_caption.svg"
                fillMode: Image.PreserveAspectFit
                opacity: tvControl.closedCaptionsEnabled ? 1 : 0.2
            }

            Image {
                width: 32
                height: 32
                source: "images/hdr_on.svg"
                fillMode: Image.PreserveAspectFit
                opacity: tvControl.hdrEnabled ? 1 : 0.2
            }

            Image {
                width: 32
                height: 32
                source: "images/cast_connected.svg"
                fillMode: Image.PreserveAspectFit
                opacity: tvControl.castConnected ? 1 : 0.2
            }

            Image {
                id: listeningIcon
                width: 32
                height: 32
                source: "images/mic.svg"
                fillMode: Image.PreserveAspectFit
                opacity: 0.2

                Timer {
                    interval: 500
                    repeat: true
                    running: tvControl.listening
                    triggeredOnStart: true
                    onTriggered: {
                        if (listeningIcon.opacity === 1) {
                            listeningIcon.opacity = 0.2;
                        } else {
                            listeningIcon.opacity = 1;
                        }
                    }
                    onRunningChanged: if(!running) listeningIcon.opacity = 0.2
                }
            }

            Image {
                width: 32
                height: 32
                source: tvControl.muted ? "images/speaker_muted.svg" : "images/speaker.svg"
                fillMode: Image.PreserveAspectFit
            }
        }

        Rectangle{
            id: volumeBarFrame

            width: 12
            height: 80

            color: "transparent"
            border.color: screen.color.darker(160)
            border.width: 2

            anchors{
                right: parent.right
                top: parent.top
                rightMargin: 10
                topMargin: 10
            }

            Rectangle{
                width: 8
                height: (volumeBarFrame.height-4)*tvControl.volume
                color: screen.color.darker(5)
                anchors{
                    bottom: parent.bottom
                    left: parent.left
                    margins: 2
                }
            }
        }
    }


    Row { // select buttons
        anchors {
            left: screen.left
            top: screen.bottom
            topMargin: 15
        }
        spacing: 7 // between buttons

        Button {
            width: 47
            Image {
                source: "images/closed_caption_white.svg"
                anchors.fill: parent
                anchors.margins: 5
                fillMode: Image.PreserveAspectFit

            }
            onClicked: tvControl.closedCaptionsEnabled = !tvControl.closedCaptionsEnabled
        }

        Button {
            width: 47
            Image {
                source: "images/hdr_on_white.svg"
                anchors.fill: parent
                anchors.margins: 5
                fillMode: Image.PreserveAspectFit
            }
            onClicked: tvControl.hdrEnabled = !tvControl.hdrEnabled
        }

        Button {
            width: 47
            Image {
                source: "images/cast_white.svg"
                anchors.fill: parent
                anchors.margins: 5
                fillMode: Image.PreserveAspectFit
            }
            onClicked: tvControl.castConnected = !tvControl.castConnected
        }

        Button {
            width: 47
            Image {
                source: "images/speaker_muted_white.svg"
                anchors.fill: parent
                anchors.margins: 5
                fillMode: Image.PreserveAspectFit
            }

            onClicked: {
                if (tvControl.volume > 0) {
                    tvControl.muted = !tvControl.muted;
                }
            }

            Connections {
                target: tvControl

                function onVolumeChanged() {
                    tvControl.muted = (tvControl.volume === 0);
                }
            }
        }
    }

    Button{
        id: channelButton

        height: 180
        width: 47

        anchors{
            right: parent.horizontalCenter
            bottom: parent.bottom
            rightMargin: 25
            bottomMargin: 70
        }

        Image { // + sign for button
            anchors{
                top: parent.top
                left: parent.left
                right: parent.right
                margins: 5
                topMargin: 15
            }
            source: "images/plus.svg"
            fillMode: Image.PreserveAspectFit

        }

        Image { // - sign for button
            anchors{
                bottom: parent.bottom
                left: parent.left
                right: parent.right
                margins: 5
                bottomMargin: 15
            }
            source: "images/minus.svg"
            fillMode: Image.PreserveAspectFit
        }

        MouseArea{
            id: channelUp

            height: 90

            anchors{
                top: channelButton.top
                left: channelButton.left
                right: channelButton.right
            }
            onClicked: tvControl.incrementChannel()
        }

        MouseArea{
            id: channelDown

            height: 90

            anchors{
                bottom: channelButton.bottom
                left: channelButton.left
                right: channelButton.right
            }
            onClicked: tvControl.decrementChannel()
        }

    }

    Button{
        id: volumeButton

        height: 180
        width: 47

        anchors{
            left: parent.horizontalCenter
            bottom: parent.bottom
            leftMargin: 25
            bottomMargin: 70
        }

        Image { // + sign for button
            anchors{
                top: parent.top
                left: parent.left
                right: parent.right
                margins: 5
                topMargin: 15
            }
            source: "images/volume_up.svg"
            fillMode: Image.PreserveAspectFit

        }

        Image { // - sign for button
            anchors{
                bottom: parent.bottom
                left: parent.left
                right: parent.right
                margins: 5
                bottomMargin: 15
            }
            source: "images/volume_down.svg"
            fillMode: Image.PreserveAspectFit
        }

        MouseArea{
            id: volumeUp

            height: 90

            anchors{
                top: volumeButton.top
                left: volumeButton.left
                right: volumeButton.right
            }
            onClicked: tvControl.incrementVolume()
        }

        MouseArea{
            id: volumeDown

            height: 90

            anchors{
                bottom: volumeButton.bottom
                left: volumeButton.left
                right: volumeButton.right
            }
            onClicked: tvControl.decrementVolume()
        }
    }

    Item{
        id: controlPad

        anchors{
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }

        width: 200
        height: 200

        Item {
            id: rotatedButtons

            anchors.fill: parent

            rotation: 45

            Item {
                id: topButton

                width: 100
                height: 100

                anchors {
                    left: parent.left
                    top: parent.top
                }

                clip: true

                CircleButton {
                    rotation: -45

                    Image {
                        anchors {
                            top: parent.top
                            topMargin: 10
                            horizontalCenter: parent.horizontalCenter
                        }
                        width: 32
                        height: 32
                        source: Qt.resolvedUrl("images/settings.svg")
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }

            Item {
                id: rightButton

                width: 100
                height: 100

                anchors {
                    right: parent.right
                    top: parent.top
                }

                clip: true

                CircleButton {
                    anchors.horizontalCenter: parent.left
                    rotation: -45

                    Image {
                        anchors {
                            right: parent.right
                            rightMargin: 10
                            verticalCenter: parent.verticalCenter
                        }
                        width: 32
                        height: 32
                        source: Qt.resolvedUrl("images/fast_forward.svg")
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }

            Item {
                id: bottomButton

                anchors {
                    right: parent.right
                    bottom: parent.bottom
                }

                width: 100
                height: 100

                clip: true

                CircleButton {
                    anchors {
                        horizontalCenter: parent.left
                        verticalCenter: parent.top
                    }
                    rotation: -45

                    Image {
                        anchors {
                            bottom: parent.bottom
                            bottomMargin: 10
                            horizontalCenter: parent.horizontalCenter
                        }
                        width: 32
                        height: 32
                        source: Qt.resolvedUrl("images/play_pause.svg")
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }

            Item {
                id: leftButton

                anchors {
                    left: parent.left
                    bottom: parent.bottom
                }

                width: 100
                height: 100

                clip: true

                CircleButton {
                    anchors {
                        horizontalCenter: parent.right
                        verticalCenter: parent.top
                    }
                    rotation: -45

                    Image {
                        anchors {
                            left: parent.left
                            leftMargin: 10
                            verticalCenter: parent.verticalCenter
                        }
                        width: 32
                        height: 32
                        source: Qt.resolvedUrl("images/fast_rewind.svg")
                        fillMode: Image.PreserveAspectFit
                    }
                }
            }

            Rectangle {
                anchors {
                    left: parent.left
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                    margins: 2
                }

                height: 2
                color: window.themeColor
                opacity: 0.5

                Rectangle {
                    y: 1
                    width: parent.width
                    height: 2
                    color: window.themeColor.darker()
                }
            }

            Rectangle {
                anchors {
                    top: parent.top
                    bottom: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                    margins: 2
                }
                width: 2
                color: window.themeColor
                opacity: 0.5

                Rectangle {
                    x: -1
                    height: parent.height
                    width: 2
                    color: window.themeColor.darker()
                }
            }
        }

        CircleButton {
            id: centerButton

            anchors.centerIn: parent
            width: 100
            height: 100
            onClicked: tvControl.listening = !tvControl.listening

            Image {
                anchors.centerIn: parent
                width: 48
                height: 48
                source: Qt.resolvedUrl("images/mic_white.svg")
                fillMode: Image.PreserveAspectFit
            }
        }
    }
}




















