package component;

class Region extends ecs.component.Component {
	public var points:Array<util.Vector> = []
	public var temporaryProperties:Array<game.Property> = []
	public var permanentProperties:Array<game.Property> = []
	public function new (points){
		this.points = points;
	}
}
