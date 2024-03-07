shader_type spatial;
uniform float health_life;

void fragment() {
	if (UV.y > health_life){
			ALBEDO = vec3(1.0, 0.0, 0.0);
	} else{
		ALBEDO = vec3(0.2, 0.0, 0.0);
	}
	
}

