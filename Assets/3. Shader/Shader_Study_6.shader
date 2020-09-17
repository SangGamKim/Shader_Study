Shader "Study2/Shader_Study_6"
{
	Properties
	{
		_MainTex("Texture", 2D) = "white" {}
		_MainTex2("Texture2", 2D) = "white" {}

		_bright("밝기", Range(0,10)) = 1
		_alpha("Alpha", Range(0,1)) = 0
	}

		SubShader
		{
			Tags { "RenderType" = "Transparent"  "Queue" = "Transparent"}

			CGPROGRAM
			#pragma surface surf Standard alpha:fade


			sampler2D _MainTex;
			sampler2D _MainTex2;

			float _bright;
			fixed _alpha;

			struct Input
			{
				float2 uv_MainTex;
				float2 uv_MainTex2;
			};

			void surf(Input IN, inout SurfaceOutputStandard o)
			{
				float2 posY = float2(0, _Time.y);
				fixed4 c = tex2D(_MainTex, IN.uv_MainTex + posY);
				fixed4 c2 = tex2D(_MainTex2, IN.uv_MainTex2);

				o.Emission = c.rgb * c2.rgb* _bright;
				o.Alpha = c.a;
				//o.Alpha = _alpha;
				//질문 알파 값에 왜 float수 넣으면 그림에 맞춰 안나오고 네모난 모양으로 나오는지 모르 겠음
			}
			ENDCG
		}
			FallBack "Diffuse"
}
