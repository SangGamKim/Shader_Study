﻿Shader "Study3/Shader_Study_8"
{
	Properties
	{
		_MainTex("Texture", 2D) = "white" {}
	}

		SubShader
	{
		Tags { "RenderType" = "Queue"  }

		CGPROGRAM
		#pragma surface surf Lambert noambient 
		#pragma target 3.0


		sampler2D _MainTex;


		struct Input
		{
			float2 uv_MainTex;
		};

		void surf(Input IN, inout SurfaceOutput o)
		{
			fixed4 c = tex2D(_MainTex, IN.uv_MainTex);

			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	}
		FallBack "Diffuse"
}
