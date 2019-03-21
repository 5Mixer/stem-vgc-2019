package system;

import ecs.node.Node;
import component.Position;
import component.EntryPoint;
import component.ExitPoint;

class EntryExitRenderSystem<Event:EnumValue> extends ecs.system.System<Event> {
	@:nodes var nodesEntry:Node<Position,EntryPoint>;
	@:nodes var nodesExit:Node<Position,ExitPoint>;

	public function rendergraphics(graphics:kha.graphics2.Graphics) {
		for (node in nodesEntry){
			graphics.color = kha.Color.Yellow;
			graphics.fillRect(node.position.position.x-20,node.position.position.y-20,20,20);
			graphics.color = kha.Color.White;
		}
		for (node in nodesExit){
			graphics.color = kha.Color.Orange;
			graphics.fillRect(node.position.position.x-20,node.position.position.y-20,20,20);
			graphics.color = kha.Color.White;
		}
	}
}
