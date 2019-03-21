package component;

class Zone extends ecs.component.Component {
	public var colour:kha.Color;
	public var temporaryEffects:Array<game.Property> = [];
	public var permanentEffects:Array<game.Property> = [];
	public function new (){
		this.colour = kha.Color.fromString("#DD6E6E");
		this.temporaryEffects.push(game.Property.Antigravity);
	}
}
