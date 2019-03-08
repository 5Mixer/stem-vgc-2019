package system;

import ecs.node.Node;
import component.Position;
import component.RenderObject;

class ObjectRenderSystem<Event:EnumValue> extends ecs.system.System<Event> {
	@:nodes var nodes:Node<Position,RenderObject>;

	public function render(graphics:kha.graphics2.Graphics) {
		for (node in nodes){
			graphics.color = node.renderObject.colour;
			graphics.fillRect(node.position.position.x,node.position.position.y,15,15);
			graphics.color = kha.Color.White;
		}
	}
}
