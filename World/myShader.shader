shader_type spatial;
uniform float yPosition;
uniform float xPosition;

void fragment(){
	ALBEDO = vec3(xPosition, yPosition, 0);
}

