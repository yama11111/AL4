#pragma once
#include "Vec3.h"
#include "Random.h"

namespace Math
{
	class Shake {
	private:
		Vec3 value{};			// 実数値
		bool isShake = false;	// 揺れているか
		float swingValue = 0;	// 揺れる量 (乱数)
		float dekey = 0;		// 減衰量
		Random* rand = nullptr;
	public:
		void Initialize();
		void Update();
		void Shaking(const float swing, const float dekey);
		Vec3 GetValue() { return value; }
		bool IsShake() { return isShake; }
		float Ratio() { return 1.0f - dekey / swingValue; }
	};
}
