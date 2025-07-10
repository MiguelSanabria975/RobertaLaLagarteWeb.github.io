uniform sampler2D texture;
uniform vec3 keyColor;
uniform float similarity;
uniform float smoothness;
varying vec2 vUv;

void main() {
  vec4 color = texture2D(texture, vUv);
  float diff = distance(color.rgb, keyColor);
  float alpha = smoothstep(similarity, similarity + smoothness, diff);
  gl_FragColor = vec4(color.rgb, color.a * (1.0 - alpha));
}
