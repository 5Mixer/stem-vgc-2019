
package system;

import ecs.node.Node;
import component.Position;
import component.ZonePolygon;
import component.Shape;
using kha.graphics2.GraphicsExtension;

class ZoneRenderSystem<Event:EnumValue> extends ecs.system.System<Event> {
	@:nodes var nodes:Node<Position,ZonePolygon,Shape>;

	public function rendergraphics(graphics:kha.graphics2.Graphics) {
		for (node in nodes){
			var pos = node.position.position;
			graphics.color = node.zonePolygon.colour;
			graphics.fillPolygon(pos.x,pos.y,node.zonePolygon.vertices);
			graphics.color = kha.Color.White;
		}
	}
}
