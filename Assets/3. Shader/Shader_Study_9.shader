Shader "Study3/Shader_Study_9"
{
	Properties
	{
		_MainTex("Texture", 2D) = "white" {}
	_specColor("Specular Color", Color) = (1,1,1,1)
	}

		SubShader
	{
		Tags { "RenderType" = "Queue"  }

		CGPROGRAM
		#pragma surface surf BlinnPhong
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
			o.Specular = 0.5f;
			o.Gloss = 1;
			o.Alpha = c.a;
		}
		ENDCG
	}
		FallBack "Diffuse"
}
