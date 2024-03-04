shader_type spatial;
uniform sampler2D Noise;
uniform float Height = 4.0;
void vertex() {
	vec4 tex = texture(Noise, UV);
	VERTEX.y = tex.b * Height;
	VERTEX.y = clamp(VERTEX.y, 0.0, 3.0);
	if(VERTEX.y > 0.6 * Height && VERTEX.y < 0.7 * Height){
		VERTEX.z += 0.1 * cos(TIME * 1.0);
	}
	if(VERTEX.y > 0.7 * Height){
		VERTEX.z += 0.15 * cos(TIME * 1.0);
	}
}

void fragment() {
	ALBEDO = vec3(0.1, 1.0, 1.0);
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
