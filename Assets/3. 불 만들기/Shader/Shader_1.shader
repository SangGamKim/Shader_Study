Shader "Custom/Shader_3_1"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _speed("Speed", float) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows


        sampler2D _MainTex;
        sampler2D _MainTex2;

        float _speed;

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            float2 pos = float2(0, -_Time.y);

            fixed4 c = tex2D(_MainTex, IN.uv_MainTex + (pos * _speed));
            o.Albedo = c.rgb;
            o.Alpha = c.a;

        }
        ENDCG
    }
    FallBack "Diffuse"
}
