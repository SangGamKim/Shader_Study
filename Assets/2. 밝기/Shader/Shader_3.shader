Shader "Custom/Shader_2_3"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _brightness("밝기", Range(0,1)) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows


        sampler2D _MainTex;
        float _brightness;

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
            o.Emission = (c.r + c.g + c.b) / 3;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
