package system;

import ecs.node.Node;
import component.Position;
import component.RenderObject;

class ObjectRenderSystem<Event:EnumValue> extends ecs.system.System<Event> {
	@:nodes var nodes:Node<Position,RenderObject>;

	public function rendergraphics(graphics:kha.graphics2.Graphics) {
		for (node in nodes){
			graphics.color = node.renderObject.colour;
			graphics.fillRect(node.position.position.x-20,node.position.position.y-20,20,20);
			graphics.color = kha.Color.White;
		}
	}
}
