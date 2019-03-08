package component;

class Shape extends ecs.component.Component {
	public var shape:differ.shapes.Shape;
	public var vertices:Array<kha.math.Vector2> = [];
	public function new (shape:differ.shapes.Shape){
		this.shape = shape;
	}
}
