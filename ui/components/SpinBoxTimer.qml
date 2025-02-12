import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
	id: root

	property bool isHourField

	RowLayout {
		id: layout

		Rectangle {
			width: 100
			height: 100
			color: "white"
			border.color: "black"
			border.width: 2
			radius: 10

			TextInput {
				id: value

				width: parent.width
				height: parent.height

				horizontalAlignment: Text.AlignHCenter
				verticalAlignment: Text.AlignVCenter

				font.pixelSize: 40
				color: "black"
				validator: IntValidator { bottom: 0; top: 60 }
				clip: true

				onTextChanged: {
					let num = parseInt(text, 10) || 0;
					text = num.toString().padStart(2, "0");
				}

				text: "00"
			}
		}

		ColumnLayout {
			Rectangle {
				width: 50
				height: 45
				color: "lightgray"
				border.color: "black"
				border.width: 2
				radius: 5

				MouseArea {
					anchors.fill: parent
					onClicked: internal.increaseValue()
					onPressed: upTimer.start()
					onReleased: upTimer.stop()
				}

				Timer {
					id: upTimer
					interval: 100
					repeat: true
					onTriggered: internal.increaseValue()
				}

				Text {
					anchors.centerIn: parent
					text: "+"
					font.pixelSize: 30
					color: "black"
				}
			}

			Rectangle {
				width: 50
				height: 45
				color: "lightgray"
				border.color: "black"
				border.width: 2
				radius: 5

				MouseArea {
					anchors.fill: parent
					onClicked: internal.decreaseValue()
					onPressed: downTimer.start()
					onReleased: downTimer.stop()
				}

				Text {
					anchors.centerIn: parent
					text: "-"
					font.pixelSize: 30
					color: "black"
				}
			}

			Timer {
				id: downTimer
				interval: 100
				repeat: true
				onTriggered: internal.decreaseValue()
			}

		}
	}

	QtObject {
		id: internal

		property int currentValue: 0

		property int maximumValue: {
			return root.isHourField ? 23 : 59;
		}

		function increaseValue() {
			let num = parseInt(value.text, 10) || 0;
			if (num < internal.maximumValue) {
				num++;
				value.text = num.toString().padStart(2, "0");
			}
			else {
				value.text = "00";
			}
		}

		function decreaseValue() {
			let num = parseInt(value.text, 10) || 0;
			if (num > 0) {
				num--;
				value.text = num.toString().padStart(2, "0");
			}
			else {
				value.text = maximumValue;
			}
		}
	}
}
