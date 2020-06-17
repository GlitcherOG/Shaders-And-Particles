// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "ShieldLook"
{
	Properties
	{
		_TextureSample0("Texture Sample 0", 2D) = "white" {}
		_ShieldPatternScale("ShieldPatternScale", Range( 0 , 5)) = 0
		_TimeScaleY("TimeScaleY", Range( 0 , 1)) = 0
		_TimeScaleX("TimeScaleX", Range( 0 , 1)) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _TextureSample0;
		uniform float _ShieldPatternScale;
		uniform float _TimeScaleX;
		uniform float _TimeScaleY;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 appendResult4 = (float4(_ShieldPatternScale , _ShieldPatternScale , 0.0 , 0.0));
			float mulTime10 = _Time.y * _TimeScaleX;
			float mulTime5 = _Time.y * _TimeScaleY;
			float4 appendResult8 = (float4(mulTime10 , mulTime5 , 0.0 , 0.0));
			float2 uv_TexCoord3 = i.uv_texcoord * appendResult4.xy + appendResult8.xy;
			o.Albedo = tex2D( _TextureSample0, uv_TexCoord3 ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=17800
202;73;1441;633;1931.502;134.1604;1;True;False
Node;AmplifyShaderEditor.RangedFloatNode;6;-1595.272,304.682;Float;False;Property;_TimeScaleY;TimeScaleY;2;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-1592.442,149.8196;Float;False;Property;_TimeScaleX;TimeScaleX;3;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2;-1276.111,-27.11177;Float;False;Property;_ShieldPatternScale;ShieldPatternScale;1;0;Create;True;0;0;False;0;0;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;5;-1275.996,266.5258;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;10;-1280.502,154.8396;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;4;-963.5878,-16.2044;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.DynamicAppendNode;8;-1036.843,176.9194;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;3;-747.1877,-0.1719837;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1;-426.6728,-27.65871;Inherit;True;Property;_TextureSample0;Texture Sample 0;0;0;Create;True;0;0;False;0;-1;a49394b6dd59dd24fa36f77ac08d01f4;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;ShieldLook;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;5;0;6;0
WireConnection;10;0;7;0
WireConnection;4;0;2;0
WireConnection;4;1;2;0
WireConnection;8;0;10;0
WireConnection;8;1;5;0
WireConnection;3;0;4;0
WireConnection;3;1;8;0
WireConnection;1;1;3;0
WireConnection;0;0;1;0
ASEEND*/
//CHKSM=A275A00C15161355710E59127EF0E235BAB9E951