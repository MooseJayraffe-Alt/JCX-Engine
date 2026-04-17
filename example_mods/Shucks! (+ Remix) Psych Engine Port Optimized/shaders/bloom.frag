#ifdef GL_ES
precision mediump float;
#endif

varying float openfl_Alphav;
varying vec4 openfl_ColorMultiplierv;
varying vec4 openfl_ColorOffsetv;
varying vec2 openfl_TextureCoordv;

uniform sampler2D bitmap;
uniform vec2 openfl_TextureSize;
uniform bool hasTransform;
uniform bool hasColorTransform;

uniform float Threshold;
uniform float Intensity;

vec4 flixel_texture2D(sampler2D bmp, vec2 coord)
{
    vec4 color = texture2D(bmp, coord);

    if (!hasTransform) return color;
    if (color.a == 0.0) return vec4(0.0);

    if (!hasColorTransform)
        return color * openfl_Alphav;

    color.rgb /= color.a;

    color.rgb = clamp(color.rgb * openfl_ColorMultiplierv.rgb + openfl_ColorOffsetv.rgb, 0.0, 1.0);
    color.a   = clamp(color.a   * openfl_ColorMultiplierv.a   + openfl_ColorOffsetv.a,   0.0, 1.0);

    color *= openfl_Alphav;

    return color;
}

vec4 blurSmall(vec2 uv)
{
    vec2 texel = 4.0 / openfl_TextureSize.xy;

    vec4 sum = texture2D(bitmap, uv);

    sum += texture2D(bitmap, uv + vec2(texel.x, 0.0));
    sum += texture2D(bitmap, uv - vec2(texel.x, 0.0));
    sum += texture2D(bitmap, uv + vec2(0.0, texel.y));
    sum += texture2D(bitmap, uv - vec2(0.0, texel.y));

    sum += texture2D(bitmap, uv + texel);
    sum += texture2D(bitmap, uv - texel);
    sum += texture2D(bitmap, uv + vec2(texel.x, -texel.y));
    sum += texture2D(bitmap, uv + vec2(-texel.x, texel.y));

    return sum * (1.0 / 9.0);
}

void main()
{
    vec2 uv = openfl_TextureCoordv;

    vec4 Color = flixel_texture2D(bitmap, uv);

    vec4 Highlight = clamp(blurSmall(uv) - Threshold, 0.0, 1.0);
    Highlight *= 1.0 / (1.0 - Threshold);

    gl_FragColor = 1.0 - (1.0 - Color) * (1.2 - Highlight * Intensity);
}