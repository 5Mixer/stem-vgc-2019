package system;

import ecs.node.Node;
import component.Position;
import component.Physical;
import component.Effects;

class PhysicsSystem<Event:EnumValue> extends ecs.system.System<Event> {
	@:nodes var nodes:Node<{position:Position,physical:Physical,?effects:Effects}>;

	override public function update(dt:Float) {
		for (node in nodes){
			var pos = node.position.position;
			var physical = node.physical;
			
			if (node.effects.temporaryEffects.indexOf(game.Property.Antigravity) == -1){
				physical.velocity.x += physical.gravity.x;
				physical.velocity.y += physical.gravity.y;
			}

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
