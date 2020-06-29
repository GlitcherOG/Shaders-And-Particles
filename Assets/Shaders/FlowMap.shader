// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "FlowMap"
{
	Properties
	{
		_FlowMap("FlowMap", 2D) = "white" {}
		_Speed("Speed", Float) = 1
		_Dif("Dif", 2D) = "white" {}
		_Temp("Temp", Range( 0 , 1)) = 1
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
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows exclude_path:deferred 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _Dif;
		uniform sampler2D _FlowMap;
		uniform float4 _FlowMap_ST;
		uniform float _Speed;
		uniform float _Temp;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_FlowMap = i.uv_texcoord * _FlowMap_ST.xy + _FlowMap_ST.zw;
			float2 blendOpSrc14 = i.uv_texcoord;
			float2 blendOpDest14 = (tex2D( _FlowMap, uv_FlowMap )).rg;
			float2 temp_output_14_0 = ( saturate( (( blendOpDest14 > 0.5 ) ? ( 1.0 - 2.0 * ( 1.0 - blendOpDest14 ) * ( 1.0 - blendOpSrc14 ) ) : ( 2.0 * blendOpDest14 * blendOpSrc14 ) ) ));
			float temp_output_10_0 = ( _Time.y * _Speed );
			float temp_output_1_0_g1 = temp_output_10_0;
			float TimeA18 = -(0.0 + (( ( temp_output_1_0_g1 - floor( ( temp_output_1_0_g1 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
			float2 lerpResult15 = lerp( i.uv_texcoord , temp_output_14_0 , TimeA18);
			float2 FlowA16 = lerpResult15;
			float temp_output_1_0_g2 = (temp_output_10_0*1.0 + 0.5);
			float TimeB33 = -(0.0 + (( ( temp_output_1_0_g2 - floor( ( temp_output_1_0_g2 + 0.5 ) ) ) * 2 ) - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
			float2 lerpResult36 = lerp( i.uv_texcoord , temp_output_14_0 , TimeB33);
			float2 FlowB37 = lerpResult36;
			float4 lerpResult41 = lerp( tex2D( _Dif, FlowA16 ) , tex2D( _Dif, FlowB37 ) , _Temp);
			float4 Albedo25 = lerpResult41;
			o.Albedo = Albedo25.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=17800
0;740;1309;379;2311.397;232.2488;1.6;True;True
Node;AmplifyShaderEditor.CommentaryNode;21;-1774.573,-206.6173;Inherit;False;2035.446;801.8908;;12;18;13;12;11;10;9;8;30;31;32;33;34;Time;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;9;-1721.182,119.1082;Inherit;False;Property;_Speed;Speed;1;0;Create;True;0;0;False;0;1;0.09;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;8;-1716.314,-61.37573;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;10;-1549.544,4.42801;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;34;-1374.472,241.0862;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;11;-1345.473,-30.65682;Inherit;True;Sawtooth Wave;-1;;1;289adb816c3ac6d489f255fc3caf5016;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;30;-1170.446,267.3211;Inherit;True;Sawtooth Wave;-1;;2;289adb816c3ac6d489f255fc3caf5016;0;1;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;12;-1088.742,-44.61387;Inherit;True;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;20;-2381.339,-1125.988;Inherit;False;1537.871;712.7937;;10;16;15;14;22;2;6;1;36;37;38;UV;1,1,1,1;0;0
Node;AmplifyShaderEditor.TFHCRemapNode;31;-923.7621,183.1279;Inherit;True;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;32;-603.9384,171.0978;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;13;-737.0059,-72.54629;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1;-2328.078,-602.435;Inherit;True;Property;_FlowMap;FlowMap;0;0;Create;True;0;0;False;0;-1;None;aebdc2d125b83214b8615594400e31be;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;33;-462.0061,169.6477;Inherit;False;TimeB;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;18;-404.9589,-27.22475;Inherit;False;TimeA;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;6;-2332.583,-966.8312;Inherit;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;2;-2068.789,-771.7415;Inherit;False;True;True;False;False;1;0;COLOR;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.BlendOpsNode;14;-1864.385,-908.1644;Inherit;False;Overlay;True;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;22;-1833.458,-567.5083;Inherit;False;18;TimeA;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;38;-2050.271,-1059.429;Inherit;False;33;TimeB;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;36;-1565.133,-990.311;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;15;-1652.305,-733.1241;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;37;-1150.605,-990.372;Inherit;False;FlowB;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;29;-815.255,-1121.818;Inherit;False;1194.82;669.0098;;8;25;7;26;28;39;40;41;42;Diffuse;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;16;-1251.135,-600.9366;Inherit;False;FlowA;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;40;-716.1245,-642.0468;Inherit;False;37;FlowB;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexturePropertyNode;26;-775.9506,-963.0323;Inherit;True;Property;_Dif;Dif;2;0;Create;True;0;0;False;0;None;97f11ea6b0f849544ba645ff55321e69;False;white;Auto;Texture2D;-1;0;1;SAMPLER2D;0
Node;AmplifyShaderEditor.GetLocalVarNode;28;-495.8673,-897.1461;Inherit;False;16;FlowA;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;39;-444.572,-748.8065;Inherit;True;Property;_TextureSample0;Texture Sample 0;3;0;Create;True;0;0;False;0;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;42;-413.1616,-538.5756;Float;False;Property;_Temp;Temp;3;0;Create;True;0;0;False;0;1;0.087;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;7;-307.356,-1071.572;Inherit;True;Property;_Albedo;Albedo;1;0;Create;True;0;0;False;0;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;41;25.46685,-900.5356;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;25;138.0021,-1029.503;Inherit;False;Albedo;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;27;49.8964,-367.9492;Inherit;False;25;Albedo;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;333.2157,-360.298;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;FlowMap;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;ForwardOnly;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;10;0;8;0
WireConnection;10;1;9;0
WireConnection;34;0;10;0
WireConnection;11;1;10;0
WireConnection;30;1;34;0
WireConnection;12;0;11;0
WireConnection;31;0;30;0
WireConnection;32;0;31;0
WireConnection;13;0;12;0
WireConnection;33;0;32;0
WireConnection;18;0;13;0
WireConnection;2;0;1;0
WireConnection;14;0;6;0
WireConnection;14;1;2;0
WireConnection;36;0;6;0
WireConnection;36;1;14;0
WireConnection;36;2;38;0
WireConnection;15;0;6;0
WireConnection;15;1;14;0
WireConnection;15;2;22;0
WireConnection;37;0;36;0
WireConnection;16;0;15;0
WireConnection;39;0;26;0
WireConnection;39;1;40;0
WireConnection;7;0;26;0
WireConnection;7;1;28;0
WireConnection;41;0;7;0
WireConnection;41;1;39;0
WireConnection;41;2;42;0
WireConnection;25;0;41;0
WireConnection;0;0;27;0
ASEEND*/
//CHKSM=596CD6BC75395E849C4ABA9A83DF1DE6F76CD6AD