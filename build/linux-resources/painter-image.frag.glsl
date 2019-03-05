#version 110
// Unknown execution mode
uniform sampler2D tex;
varying vec2 texCoord;
varying vec4 color;


void main()
{
	vec4 texcolor;
	texcolor = (texture2D(tex, texCoord) * color);
	texcolor = vec4((vec3(texcolor[0], texcolor[1], texcolor[2]) * color[3])[0], (vec3(texcolor[0], texcolor[1], texcolor[2]) * color[3])[1], (vec3(texcolor[0], texcolor[1], texcolor[2]) * color[3])[2], texcolor[3]);
	gl_FragColor = texcolor;
	return;
}

