package component;

class Shape extends ecs.component.Component {
	public var shape:differ.shapes.Shape;
	public var vertices:Array<kha.math.Vector2> = [];
	public function new (shape:differ.shapes.Shape){
		this.shape = shape;
		if (Std.is(shape, differ.shapes.Polygon)){
			for (v in cast(this.shape,differ.shapes.Polygon).transformedVertices){
				this.vertices.push(new kha.math.Vector2(v.x,v.y));
			}
		}
	}
}
