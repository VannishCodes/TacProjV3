shader_type canvas_item;

uniform float alpha : hint_range(0.0, 1.0) = 0.5;

void fragment() {
	vec4 tex_color = texture(TEXTURE, UV);
	COLOR = tex_color;
	COLOR.a *= alpha;
}
