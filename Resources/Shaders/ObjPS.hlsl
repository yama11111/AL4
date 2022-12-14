#include "Obj.hlsli"

Texture2D<float4> tex : register(t0); // 0�ԃX���b�g�ɐݒ肳�ꂽ�e�N�X�`��
SamplerState smp : register(s0);      // 0�ԃX���b�g�ɐݒ肳�ꂽ�T���v���[

float4 main(VSOutput input) : SV_TARGET
{
	float4 texcolor = float4(tex.Sample(smp, input.uv));
	float3 light = normalize(float3(1, -1, 1)); // �E���� �����̃��C�g
	float diffuse = saturate(dot(-light, input.normal)); // diffuse��[0,1]�͈̔͂�clamp����
	float3 shaderColor = mAmbient; // �A���r�G���g��
	shaderColor += mDiffuse * diffuse; // �f�B�t���[�Y��
	return float4(texcolor.rgb * shaderColor, texcolor.a * mAlpha) * color; // �P�x��RGB�ɑ�����ďo��
}