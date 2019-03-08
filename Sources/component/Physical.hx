package component;

class Physical extends ecs.component.Component {
	public var velocity:kha.math.Vector2;
	public var gravity:kha.math.Vector2;
	public function new (x,y){
		gravity = new kha.math.Vector2(0,70);
		velocity = new kha.math.Vector2(x,y);
	}
}
