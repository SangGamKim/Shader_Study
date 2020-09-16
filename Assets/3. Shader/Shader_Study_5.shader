Shader "Study/Shader_Study_5"
{
	Properties
	{
		_MainTex("Texture", 2D) = "white" {}
		_MainTex2("Texture2", 2D) = "white" {}

		_Lerp("Lerp", Range(0,1)) = 0.5
	}
		SubShader
		{
			Tags { "RenderType" = "Opaque" }

			CGPROGRAM
			#pragma surface surf Standard fullforwardshadows


			sampler2D _MainTex;
			sampler2D _MainTex2;

			float _Lerp;

			struct Input
			{
				float2 uv_MainTex;
				float2 uv_MainTex2;
			};

			float _Brightness;

			void surf(Input IN, inout SurfaceOutputStandard o)
			{
				fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
				fixed4 c2 = tex2D(_MainTex2, IN.uv_MainTex2);

				//o.Emission = float3(IN.uv_MainTex2.x, IN.uv_MainTex2.y, 0);
				//o.Emission = float3(IN.uv_MainTex2.y, IN.uv_MainTex2.x, 1);
				o.Emission = lerp(c.rgb, c2.rgb, _Lerp);
				//o.Emission = lerp(c2.rgb, c.rgb,1- _Lerp);

			}
			ENDCG
		}
			FallBack "Diffuse"
}
