import QtQuick

import ui.components 1.0 // dep r nay

Window {
	width: 640
	height: 480
	visible: true
	title: qsTr("Hello World")

	SpinBoxTimer {
		id: spinBox

		anchors.fill: parent
	}
}
