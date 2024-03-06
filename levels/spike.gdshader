shader_type spatial;

uniform sampler2D noise;
uniform sampler2D noise2;
void vertex() {
	vec4 tex = texture(noise, UV * vec2(0.2, 0.1) * TIME);
	vec4 tex2 = texture(noise2, UV * vec2(0.1, 0.2) * TIME);
	float energy = tex.r * tex2.r;
	//VERTEX = NORMAL * energy;
	VERTEX += NORMAL * energy;
	//VERTEX.z = NORMAL.z * tex2.b;
}

void fragment() {
	
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
