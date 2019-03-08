package;

import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import kha.Image;
import kha.Scaler;
import kha.math.Vector2;

import differ.math.Vector;

import ecs.Engine;
import ecs.entity.Entity;


class Game {
	var backbuffer:Image;
	var zonefb:Image;
	var engine:Engine<game.Event>;
	var renderSystem:system.ObjectRenderSystem<game.Event>;
	var zoneRenderSystem:system.ZoneRenderSystem<game.Event>;

	public function new() {
		System.notifyOnRender(render);
		Scheduler.addTimeTask(update, 0, 1 / 60);

		engine = new Engine<game.Event>();
		
		var zone = new Entity();
		zone.add(new component.Position(40,100));
		zone.add(new component.Shape(new differ.shapes.Polygon(0,0,[new Vector(0,0),new Vector(0,400),new Vector(100,400)])));
		zone.add(new component.ZonePolygon([new Vector2(0,0), new Vector2(0,400),new Vector2(100,400)]));
		var dot = new Entity();
		dot.add(new component.Position(0,0));
		dot.add(new component.Physical(70,0));
		dot.add(new component.Shape(new differ.shapes.Circle(0,0,5)));
		dot.add(new component.RenderObject(kha.Color.fromString("#2E79EE")));

		engine.entities.add(zone);

		engine.entities.add(dot);

		zoneRenderSystem = new system.ZoneRenderSystem();
		renderSystem = new system.ObjectRenderSystem();
		engine.systems.add(zoneRenderSystem);
		engine.systems.add(renderSystem);
		engine.systems.add(new system.PhysicsSystem());
		engine.systems.add(new system.ZoneBehaviourSystem());

		// Eventually make this dynamic instead of hardcoded.
		backbuffer = Image.createRenderTarget(800,600);
		zonefb = Image.createRenderTarget(800,600);
	}

	function update() {
		engine.update(1 / 60); //change hardcoded dt.
	}

	function render(framebuffer: Framebuffer) {		
		var graphics = backbuffer.g2;
		
		zonefb.g2.begin(true,kha.Color.fromBytes(0,0,0,0));
		zoneRenderSystem.rendergraphics(zonefb.g2);
		zonefb.g2.end();

		graphics.begin(true, kha.Color.fromString("#E1E1DA"));
		graphics.drawImage(zonefb,0,0);
		renderSystem.rendergraphics(graphics);

		graphics.end();
		framebuffer.g2.begin();
		Scaler.scale(backbuffer, framebuffer, System.screenRotation);
		framebuffer.g2.end();
	}
}
