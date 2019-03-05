package;

import kha.System;

class Main {
	public static function main() {
		System.init("VGC Game", 1024, 768, function () {
			new Game();
		});
	}
}
