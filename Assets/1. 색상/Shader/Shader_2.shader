//에디터상에서 이름을 표시하는 역할
Shader "Custom/Shader_1_2"
{
    Properties
    {
        _r("Red", Range(0,1)) = 1.0
        _g("Green", Range(0,1)) = 1.0
        _b("Blue", Range(0,1)) = 1.0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200


        //CG언어
        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows
        #pragma target 3.0

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        float _r;
        float _g;
        float _b;


        UNITY_INSTANCING_BUFFER_START(Props)
        UNITY_INSTANCING_BUFFER_END(Props)

        //SurfaceOutputStandard메모장에 멤버변수 써놓음

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            o.Emission = float3(_r, _g, _b);
        }
        ENDCG
        //CG마무리
    }
    FallBack "Diffuse"
}
