Shader "Custom/Shader_2_4"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _MainTex2("Texture2", 2D) = "white"{}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows


        sampler2D _MainTex;
        sampler2D _MainTex2;

        float _brightness;

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_MainTex2;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D(_MainTex, IN.uv_MainTex+3);
            fixed4 c2 = tex2D(_MainTex2, IN.uv_MainTex2);

            o.Emission = float3(IN.uv_MainTex2.x, IN.uv_MainTex2.y, 0.5);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
