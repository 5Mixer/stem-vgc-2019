package component;

class ZonePolygon extends ecs.component.Component {
	public var colour:kha.Color;
	public var temporaryEffects:Array<game.Property> = [];
	public var permanentEffects:Array<game.Property> = [];
	public var vertices:Array<kha.math.Vector2> = [];
	public function new (vertices){
		this.vertices = vertices;
		this.colour = kha.Color.fromString("#DD6E6E");
		this.temporaryEffects.push(game.Property.Antigravity);
	}
}
