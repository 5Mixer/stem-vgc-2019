package component;

class Position extends ecs.component.Component {
	public var position:kha.math.Vector2;
	public function new (x,y){
		position = new kha.math.Vector2(x,y);
	}
}
