
package system;

import ecs.node.Node;
import component.Position;
import component.Zone;
import component.Shape;
using kha.graphics2.GraphicsExtension;

class ZoneRenderSystem<Event:EnumValue> extends ecs.system.System<Event> {
	@:nodes var nodes:Node<Position,Zone,Shape>;

	public function rendergraphics(graphics:kha.graphics2.Graphics) {
		for (node in nodes){
			var pos = node.position.position;
			graphics.color = node.zone.colour;
			graphics.fillPolygon(pos.x,pos.y,node.shape.vertices);
			graphics.color = kha.Color.White;
		}
	}
}
