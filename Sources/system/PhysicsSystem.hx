package system;

import ecs.node.Node;
import component.Position;
import component.Physical;

class PhysicsSystem<Event:EnumValue> extends ecs.system.System<Event> {
	@:nodes var nodes:Node<Position,Physical>;

	override public function update(dt:Float) {
		for (node in nodes){
			var pos = node.position.position;
			var physical = node.physical;
			
			physical.velocity.x += physical.gravity.x;
			physical.velocity.y += physical.gravity.y;


			pos.x += physical.velocity.x * dt;
			pos.y += physical.velocity.y * dt;

			if (pos.y > 600-15){
				physical.velocity.y *= -.55;
				pos.y = 600-15;
				physical.velocity.x *= .7;
				pos.y = 585;
			}
		}
	}
}
