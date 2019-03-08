package component;

class RenderObject extends ecs.component.Component {
	public var colour:kha.Color;
	public function new (colour){
		this.colour = colour;
	}
}
