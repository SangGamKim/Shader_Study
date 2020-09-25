//에디터상에서 이름을 표시하는 역할
Shader "Custom/Shader_1_1"
{
    Properties
    {
    }

    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        //CG언어
        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows
        #pragma target 3.0

        struct Input
        {
            float2 uv_MainTex;
        };

        /*UNITY_INSTANCING_BUFFER_START(Props)
        UNITY_INSTANCING_BUFFER_END(Props)*/

        //SurfaceOutputStandard메모장에 멤버변수 써놓음

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            float3 r = float3(1, 0, 0);
            float3 g = float3(0, 1, 0);
            float3 b = float3(0, 0, 1);

            o.Albedo = r.rgb;
            //o.Albedo = r + g + b;
            //o.Albedo = float3(1, 1, 1);
        }
        ENDCG
        //CG마무리
    }
    FallBack "Diffuse"
}
