Shader "Study/Shader_Study_3"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Brightness("밝기", Range(-1,1)) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows


        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        float _Brightness;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
            //Albedo값은 빛이 들어가고
            //Emission값은 빛이 안 들어가고
            o.Albedo = (c.rgb + _Brightness) / 3;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
