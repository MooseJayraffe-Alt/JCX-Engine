#pragma header

float blendOverlay(float base, float blend) {
    return base < 0.5 ? (2.0 * base * blend) : (1.0 - 2.0 * (1.0 - base) * (1.0 - blend));
}

vec3 blendOverlay(vec3 base, vec3 blend) {
    return mix(2.0 * base * blend, 1.0 - 2.0 * (1.0 - base) * (1.0 - blend), step(0.5, base));
}

vec3 blendOverlay(vec3 base, vec3 blend, float opacity) {
    return mix(base, blendOverlay(base, blend), opacity);
}

vec3 blendColorDodge(vec3 base, vec3 blend) {
    return min(base / (1.0 - blend), 1.0);
}

vec3 blendColorDodge(vec3 base, vec3 blend, float opacity) {
    return mix(base, blendColorDodge(base, blend), opacity);
}

vec3 blendLighten(vec3 base, vec3 blend) {
    return max(base, blend);
}

vec3 blendLighten(vec3 base, vec3 blend, float opacity) {
    return mix(base, blendLighten(base, blend), opacity);
}

vec3 blendMultiply(vec3 base, vec3 blend) {
    return base * blend;
}

vec3 blendMultiply(vec3 base, vec3 blend, float opacity) {
    return mix(base, blendMultiply(base, blend), opacity);
}

uniform vec4 overlayColor;
uniform vec4 satinColor;
uniform vec4 innerShadowColor;
uniform float innerShadowAngle;
uniform float innerShadowDistance;

const int SAMPLEDIST = 5;

void main() {
    vec2 uv = openfl_TextureCoordv.xy;
    vec4 spritecolor = flixel_texture2D(bitmap, uv);
    vec2 resFactor = 1.0 / openfl_TextureSize.xy;

    // Satin
    spritecolor.rgb = blendMultiply(spritecolor.rgb, satinColor.rgb, satinColor.a);

    // Inner shadow
    float offsetX = cos(innerShadowAngle);
    float offsetY = sin(innerShadowAngle);
    vec2 distMult = (innerShadowDistance * resFactor) / float(SAMPLEDIST);

    for (int i = 0; i < SAMPLEDIST; i++) {
        vec2 offset = vec2(offsetX, offsetY) * (distMult * float(i));
        vec4 col = flixel_texture2D(bitmap, uv + offset);
        float shadowMask = col.a; // invertido pra testar
        spritecolor.rgb = blendColorDodge(spritecolor.rgb, innerShadowColor.rgb, innerShadowColor.a * shadowMask);
    }

    // Overlay
    spritecolor.rgb = blendLighten(spritecolor.rgb, overlayColor.rgb, overlayColor.a);

    gl_FragColor = vec4(spritecolor.rgb * spritecolor.a, spritecolor.a);
}