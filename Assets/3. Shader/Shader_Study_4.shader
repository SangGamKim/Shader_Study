Shader "Study/Shader_Study_4"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _MainTex2("Texture2", 2D) = "white" {}

        _Brightness("밝기", Range(-1,1)) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows


        sampler2D _MainTex;
        sampler2D _MainTex2;


        struct Input
        {
            float2 uv_MainTex;
            float2 uv_MainTex2;
        };

        float _Brightness;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
            fixed4 c2 = tex2D(_MainTex2, IN.uv_MainTex2);

            o.Albedo = c2.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
