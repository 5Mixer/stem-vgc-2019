package system;

import game.Event;

class ZoneBehaviourSystem<Event> extends ecs.system.System<Event> {
	@:nodes var zones:ecs.node.Node<component.Position, component.ZonePolygon,component.Shape>;
	@:nodes var objects:ecs.node.Node<component.Position,component.Shape,component.Physical>;

	var factory:ecs.event.EventFactory<Event,{}>;

	override function update(dt:Float) {
		super.update(dt);
		for (zone in zones){
			for (object in objects){
				if (zone.shape == object.shape) continue;
				object.shape.shape.x = object.position.position.x;
				object.shape.shape.y = object.position.position.y;
				zone.shape.shape.x = zone.position.position.x;
				zone.shape.shape.y = zone.position.position.y;
				if (differ.Collision.shapeWithShape(zone.shape.shape,object.shape.shape) != null){
					object.physical.velocity.x = 500;
				}
			}
		}
	}
}