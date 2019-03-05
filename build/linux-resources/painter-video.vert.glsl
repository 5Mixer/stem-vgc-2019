#version 110
uniform mat4 projectionMatrix;
attribute vec3 vertexPosition;
varying vec2 texCoord;
attribute vec2 texPosition;
varying vec4 color;
attribute vec4 vertexColor;


void main()
{
	gl_Position = (projectionMatrix * vec4(vertexPosition[0], vertexPosition[1], vertexPosition[2], 1.0));
	texCoord = texPosition;
	color = vertexColor;
	return;
}

