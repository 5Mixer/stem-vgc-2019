package component;

class Position extends ecs.component.Component {
	public var position:util.Vector;
	public function new (x,y){
		position = new util.Vector(x,y);
	}
}
