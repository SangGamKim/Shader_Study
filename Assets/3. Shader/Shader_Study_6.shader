Shader "Study2/Shader_Study_6"
{
	Properties
	{
		_MainTex("Texture", 2D) = "white" {}
	}

		SubShader
		{
			Tags { "RenderType" = "Opaque" }

			CGPROGRAM
			#pragma surface surf Standard fullforwardshadows


			sampler2D _MainTex;

			struct Input
			{
				float2 uv_MainTex;
			};

			float _Brightness;

			void surf(Input IN, inout SurfaceOutputStandard o)
			{
				float2 posY = float2(0, _Time.y);
				//fixed4 c = tex2D(_MainTex, IN.uv_MainTex + posY);
				fixed4 c = tex2D(_MainTex, IN.uv_MainTex + posY);
				o.Albedo = c.rgb;
				o.Alpha = c.a;
			}
			ENDCG
		}
			FallBack "Diffuse"
}
