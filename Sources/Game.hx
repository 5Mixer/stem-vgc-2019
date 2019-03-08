package;

import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import kha.Image;
import kha.Scaler;

import ecs.Engine;
import ecs.entity.Entity;

class Game {
	var backbuffer:Image;
	var engine:Engine<game.Event>;
	var renderSystem:system.ObjectRenderSystem<game.Event>;

	public function new() {
		System.notifyOnRender(render);
		Scheduler.addTimeTask(update, 0, 1 / 60);

		engine = new Engine<game.Event>();
		var entity = new Entity();
		entity.add(new component.Position(0,0));
		entity.add(new component.Physical(300,0));
		entity.add(new component.RenderObject(kha.Color.Blue));
		engine.entities.add(entity);

		renderSystem = new system.ObjectRenderSystem();
		engine.systems.add(renderSystem);
		engine.systems.add(new system.PhysicsSystem());

		// Eventually make this dynamic instead of hardcoded.
		backbuffer = Image.createRenderTarget(800,600);
	}

	function update() {
		engine.update(1 / 60); //change hardcoded dt.
	}

	function render(framebuffer: Framebuffer) {		
		var graphics = backbuffer.g2;
		graphics.begin(true, kha.Color.fromString("#E1E1DA"));
		
		renderSystem.render(graphics);

		graphics.end();
		framebuffer.g2.begin();
		Scaler.scale(backbuffer, framebuffer, System.screenRotation);
		framebuffer.g2.end();
	}
}
