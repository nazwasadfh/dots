#version 320 es
precision highp float;
// @duration 0.4

in  vec2 v_texcoord;
out vec4 fragColor;
uniform sampler2D tex;
uniform float progress;   // 0 -> 1 over the animation
uniform float seed;       // differs per window

void main() {
    // Dissolve in from noise, scaled so each window breaks up differently.
    float n = fract(sin(dot(v_texcoord + seed, vec2(12.9898, 78.233))) * 43758.5453);
    fragColor = texture(tex, v_texcoord);
    fragColor *= step(n, progress);
}
