// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Water"
{
	Properties
	{
		_NoiseScale("Noise Scale", Float) = 10
		_NoiseAngleChangeSpeed("Noise Angle Change Speed", Range( 1 , 10)) = 6
		[Toggle]_CustomDisplacementTextureEnable1("Custom Displacement Texture Enable", Float) = 0
		_DisplacementTexture1("Displacement Texture", 2D) = "white" {}
		_NoiseSpeed("Noise Speed", Vector) = (0.1,0,0,0)
		_VoronoiColour1("Voronoi Colour", Color) = (0,0,0,0)
		[Toggle]_NoiseColourMultiplyAddToggle1("Noise Colour Multiply/Add Toggle", Float) = 1
		[Toggle]_ToggleSwitch7("Toggle Switch6", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.5
		#pragma surface surf StandardSpecular keepalpha noshadow 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float _ToggleSwitch7;
		uniform float _NoiseColourMultiplyAddToggle1;
		uniform float _CustomDisplacementTextureEnable1;
		uniform float _NoiseScale;
		uniform float _NoiseAngleChangeSpeed;
		uniform float2 _NoiseSpeed;
		uniform sampler2D _DisplacementTexture1;
		uniform float4 _VoronoiColour1;


		float2 voronoihash34( float2 p )
		{
			
			p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
			return frac( sin( p ) *43758.5453);
		}


		float voronoi34( float2 v, float time, inout float2 id, float smoothness )
		{
			float2 n = floor( v );
			float2 f = frac( v );
			float F1 = 8.0;
			float F2 = 8.0; float2 mr = 0; float2 mg = 0;
			for ( int j = -1; j <= 1; j++ )
			{
				for ( int i = -1; i <= 1; i++ )
			 	{
			 		float2 g = float2( i, j );
			 		float2 o = voronoihash34( n + g );
					o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = g - f + o;
					float d = 0.5 * dot( r, r );
			 		if( d<F1 ) {
			 			F2 = F1;
			 			F1 = d; mg = g; mr = r; id = o;
			 		} else if( d<F2 ) {
			 			F2 = d;
			 		}
			 	}
			}
			return F1;
		}


		void surf( Input i , inout SurfaceOutputStandardSpecular o )
		{
			float4 color8 = IsGammaSpace() ? float4(0,0.7868185,1,0) : float4(0,0.581726,1,0);
			float time34 = ( _Time.y / _NoiseAngleChangeSpeed );
			float2 panner30 = ( _Time.y * ( _NoiseSpeed / _NoiseScale ) + i.uv_texcoord);
			float2 coords34 = panner30 * _NoiseScale;
			float2 id34 = 0;
			float voroi34 = voronoi34( coords34, time34,id34, 0 );
			float4 temp_cast_0 = (voroi34).xxxx;
			float4 temp_cast_1 = (voroi34).xxxx;
			float4 temp_cast_2 = (voroi34).xxxx;
			float4 temp_cast_3 = (voroi34).xxxx;
			o.Albedo = (( _ToggleSwitch7 )?( ( color8 * (( _NoiseColourMultiplyAddToggle1 )?( ( (( _CustomDisplacementTextureEnable1 )?( tex2D( _DisplacementTexture1, panner30 ) ):( temp_cast_1 )) + _VoronoiColour1 ) ):( ( (( _CustomDisplacementTextureEnable1 )?( tex2D( _DisplacementTexture1, panner30 ) ):( temp_cast_0 )) * _VoronoiColour1 ) )) ) ):( ( color8 + (( _NoiseColourMultiplyAddToggle1 )?( ( (( _CustomDisplacementTextureEnable1 )?( tex2D( _DisplacementTexture1, panner30 ) ):( temp_cast_1 )) + _VoronoiColour1 ) ):( ( (( _CustomDisplacementTextureEnable1 )?( tex2D( _DisplacementTexture1, panner30 ) ):( temp_cast_0 )) * _VoronoiColour1 ) )) ) )).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=17800
0;740;1311;379;175.3833;1701.627;1.483376;True;True
Node;AmplifyShaderEditor.Vector2Node;24;-49.00302,-1212.465;Inherit;False;Property;_NoiseSpeed;Noise Speed;4;0;Create;True;0;0;False;0;0.1,0;0.01,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;23;369.9691,-1050.43;Inherit;False;Property;_NoiseScale;Noise Scale;0;0;Create;True;0;0;False;0;10;200;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;25;31.99589,-1358.607;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleDivideOpNode;27;305.6161,-1140.889;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;22;-74.10239,-1458.621;Inherit;False;Property;_NoiseAngleChangeSpeed;Noise Angle Change Speed;1;0;Create;True;0;0;False;0;6;3.17;1;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;28;30.68736,-1051.451;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;29;277.698,-1461.152;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;30;319.0908,-1319.867;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;32;486.1662,-1426.258;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;-10;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;33;620.6166,-1229.57;Inherit;True;Property;_DisplacementTexture1;Displacement Texture;3;0;Create;True;0;0;False;0;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.VoronoiNode;34;627.7264,-1449.793;Inherit;False;0;0;1;0;1;False;1;False;False;4;0;FLOAT2;0,0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;2;FLOAT;0;FLOAT;1
Node;AmplifyShaderEditor.ColorNode;4;935.5873,-1257.644;Inherit;False;Property;_VoronoiColour1;Voronoi Colour;5;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ToggleSwitchNode;35;867.5323,-1431.649;Inherit;False;Property;_CustomDisplacementTextureEnable1;Custom Displacement Texture Enable;2;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6;1207.935,-1407.513;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;7;1233.987,-1280.834;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;9;1369.355,-1379.499;Inherit;True;Property;_NoiseColourMultiplyAddToggle1;Noise Colour Multiply/Add Toggle;6;0;Create;True;0;0;False;0;1;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;8;1401.171,-1579.097;Inherit;False;Constant;_AlbedoColour1;AlbedoColour;13;0;Create;True;0;0;False;0;0,0.7868185,1,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;13;1754.338,-1446.722;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;12;1747.751,-1352.841;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ToggleSwitchNode;14;1890.685,-1443.384;Inherit;True;Property;_ToggleSwitch7;Toggle Switch6;7;0;Create;True;0;0;False;0;0;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;2165.579,-1428.39;Float;False;True;-1;3;ASEMaterialInspector;0;0;StandardSpecular;Water;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Translucent;0.5;True;False;0;False;Opaque;;Transparent;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;0;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;27;0;24;0
WireConnection;27;1;23;0
WireConnection;30;0;25;0
WireConnection;30;2;27;0
WireConnection;30;1;28;0
WireConnection;32;0;29;0
WireConnection;32;1;22;0
WireConnection;33;1;30;0
WireConnection;34;0;30;0
WireConnection;34;1;32;0
WireConnection;34;2;23;0
WireConnection;35;0;34;0
WireConnection;35;1;33;0
WireConnection;6;0;35;0
WireConnection;6;1;4;0
WireConnection;7;0;35;0
WireConnection;7;1;4;0
WireConnection;9;0;6;0
WireConnection;9;1;7;0
WireConnection;13;0;8;0
WireConnection;13;1;9;0
WireConnection;12;0;8;0
WireConnection;12;1;9;0
WireConnection;14;0;13;0
WireConnection;14;1;12;0
WireConnection;0;0;14;0
ASEEND*/
//CHKSM=60D8E211EF6B96A45BA1D6AC3B29A2115C9F491E