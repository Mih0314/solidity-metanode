// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RomanToInteger {
    // 存储罗马字符与数值的映射（使用bytes1作为键，更高效）
    mapping(bytes1 => int256) private romanValues;

    // 构造函数：初始化罗马字符映射
    constructor() {
        romanValues['I'] = 1;
        romanValues['V'] = 5;
        romanValues['X'] = 10;
        romanValues['L'] = 50;
        romanValues['C'] = 100;
        romanValues['D'] = 500;
        romanValues['M'] = 1000;
    }

    function romanToInt(string calldata s) public view returns (int256) {
        bytes memory romanBytes = bytes(s);
        uint256 length = romanBytes.length;
        int256 result = 0;

        require(length > 0, "Empty input");

        for (uint256 i = 0; i < length; i++) {
            bytes1 currentChar = romanBytes[i];
            int256 currentValue = romanValues[currentChar];

            require(currentValue > 0, "Invalid Roman character");

            // 处理最后一个字符（直接累加）
            if (i == length - 1) {
                result += currentValue;
                break;
            }

            // 获取下一个字符的值
            bytes1 nextChar = romanBytes[i + 1];
            int256 nextValue = romanValues[nextChar];

            // 校验下一个字符
            require(nextValue > 0, "Invalid Roman character");

            // 核心逻辑：当前值 < 下一个值则减，否则加
            if (currentValue < nextValue) {
                result -= currentValue;
            } else {
                result += currentValue;
            }
            result += currentValue;
        }

        return result;
    }
}