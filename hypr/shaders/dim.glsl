#version 320 es
precision highp float;

in vec2 v_texcoord;
out vec4 fragColor;
uniform sampler2D tex;
uniform float is_active;

void main() {
    fragColor = texture(tex, v_texcoord);
    fragColor.rgb *= mix(0.6, 1.0, is_active);   // dim while unfocused
}
