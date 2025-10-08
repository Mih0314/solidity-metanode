// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NumToLuoma {
    // 存储罗马字符与数值的映射（使用bytes1作为键，更高效）
    mapping(uint256 => bytes1) private romanValues;
    uint256[7] public romanint;

    // 构造函数：初始化罗马字符映射
    constructor() {
        romanValues[1] = 'I';
        romanValues[5] = 'V';
        romanValues[10] = 'X';
        romanValues[50] = 'L';
        romanValues[100] = 'C';
        romanValues[500] = 'D';
        romanValues[1000] = 'M';
        romanint = [1000,500,100,50,10,5,1];
    }

    function numToluoma(uint256 num) public view returns (string memory luomastr) {
        
        for (uint256 i = 0;i < romanint.length;i++) {
            while(num >= romanint[i]) {
                luomastr = string(abi.encodePacked(luomastr, romanValues[romanint[i]]));
                num -=romanint[i];
            }
        }
    }
}