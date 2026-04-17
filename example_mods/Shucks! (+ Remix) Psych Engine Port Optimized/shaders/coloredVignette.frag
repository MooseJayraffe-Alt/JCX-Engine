#pragma header

uniform vec3 color;
uniform float amount;
uniform float strength;
uniform bool transperency;

void main()
{
    vec2 uv = openfl_TextureCoordv.xy;

    vec4 flixelColor = flixel_texture2D(bitmap, uv);

    if (transperency)
    {
        float dist = distance(uv, vec2(0.5, 0.5));

        float vignette = mix(1.0, 1.0 - amount, dist);
        float shapedVignette = pow(vignette, strength);

        float vignetteStrength = flixelColor.a - shapedVignette;

        vec3 vignetteColor = color * vignetteStrength;

        gl_FragColor = flixelColor + vec4(vignetteColor, vignetteStrength);
    }
    else
    {
        vec3 col = pow(flixelColor.rgb, vec3(1.0 / strength));

        float vignette = mix(1.0, 1.0 - amount, distance(uv, vec2(0.5, 0.5)));
        col = pow(mix(col * color, col, vignette), vec3(strength));

        gl_FragColor = vec4(col, flixelColor.a);
    }
}