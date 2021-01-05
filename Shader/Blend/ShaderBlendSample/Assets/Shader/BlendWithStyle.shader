/*
Copyright (C) Odney do Nascimento<{ odney.nascimento@gmail.com }>

This file is part of the HelphAndLearm project.

The HelphAndLearm project can be copied and/or distributed without the express
permission of Odney do Nascimento<{ odney.nascimento@gmail.com }>.

But please, at least put my name in credits and send me an email, 
at notice interests in this project, i will improve my efforts toward this project
*/
Shader "Custom/ODN/BlendTests"
{
    Properties
    {
        _MainTex("Texture", 2D) = "black" {}
    //\Editor\Data\Managed\UnityEngine\UnityEngine.CoreModule.xml
    [Enum(UnityEngine.Rendering.BlendMode)] _BG("Source Blend Mode", float) = 1
    [Enum(UnityEngine.Rendering.BlendMode)] _Texture("Destination Blend Mode", float) = 1
    [Toggle]_ZWrite("Write in Z Depth", Float) = 1.0
    [Enum(UnityEngine.Rendering.BlendOp)] _BOperation("Blend Operation", float) = 0
    }
        SubShader
    {
        Tags { "Queue" = "Transparent" }
        /* https://docs.unity3d.com/2019.3/Documentation/Manual/SL-Blend.html
        One 	The value of one - use this to let either the source or the destination color come through fully.
        Zero 	The value zero - use this to remove either the source or the destination values.
        SrcColor 	The value of this stage is multiplied by the source color value.
        SrcAlpha 	The value of this stage is multiplied by the source alpha value.
        DstColor 	The value of this stage is multiplied by frame buffer source color value.
        DstAlpha 	The value of this stage is multiplied by frame buffer source alpha value.
        OneMinusSrcColor 	The value of this stage is multiplied by (1 - source color).
        OneMinusSrcAlpha 	The value of this stage is multiplied by (1 - source alpha).
        OneMinusDstColor 	The value of this stage is multiplied by (1 - destination color).
        OneMinusDstAlpha 	The value of this stage is multiplied by (1 - destination alpha).
        */
        Blend[_BG][_Texture]

        /* https://docs.unity3d.com/2019.3/Documentation/Manual/SL-Blend.html
        Add 	Add source and destination together.
        Sub 	Subtract destination from source.
        RevSub 	Subtract source from destination.
        Min 	Use the smaller of source and destination.
        Max 	Use the larger of source and destination.
        */
        BlendOp[_BOperation]

        ZWrite[_ZWrite]

        Pass
        {
            SetTexture[_MainTex] {combine texture}
        }

    }
}
