package;

import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import kha.Image;
import kha.Scaler;

class Game {
	var backbuffer:Image;

	public function new() {
		System.notifyOnRender(render);
		Scheduler.addTimeTask(update, 0, 1 / 60);

		// Eventually make this dynamic instead of hardcoded.
		backbuffer = Image.createRenderTarget(800,600);
	}

	function update() {
		
	}

	function render(framebuffer: Framebuffer) {		
		var graphics = backbuffer.g2;
		graphics.begin(true, kha.Color.Green);
		graphics.end();

		framebuffer.g2.begin();
		Scaler.scale(backbuffer, framebuffer, System.screenRotation);
		framebuffer.g2.end();
	}
}
