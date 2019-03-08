package component;

class Physical extends ecs.component.Component {
	public var velocity:util.Vector;
	public var gravity:util.Vector;
	public function new (x,y){
		gravity = new util.Vector(0,70);
		velocity = new util.Vector(x,y);
	}
}
