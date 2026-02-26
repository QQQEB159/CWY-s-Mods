#pragma header

// BLOOM SHADER BY BBPANZU (modified for subtle glow)

const float amount = 0.7;       
const float dim = 1.7;
const float Directions = 10.5;
const float Quality = 10.0;
const float Size = 10.0;         

void main(void)
{
    vec2 uv = openfl_TextureCoordv.xy;
    float Pi = 6.28318530718;    

    vec4 original = texture2D(bitmap, uv);
    vec4 accum = original;       

    for (float d = 0.0; d < Pi; d += Pi / Directions)
    {
        for (float i = 1.0 / Quality; i <= 1.0; i += 1.0 / Quality)
        {
            float ex = (cos(d) * Size * i) / openfl_TextureSize.x;
            float why = (sin(d) * Size * i) / openfl_TextureSize.y;
            accum += flixel_texture2D(bitmap, uv + vec2(ex, why));
        }
    }

    accum /= (dim * Quality) * Directions - 25.0;

    vec4 bloom = (original / dim) + accum;
    gl_FragColor = original + amount * (bloom - original);
}