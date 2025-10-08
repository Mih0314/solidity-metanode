// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract ErSearch {
    int256[] arr;

    constructor() {
        arr = [int256(1), int256(3), int256(5), int256(7), int256(9), int256(11), int256(13)];
    }


    function search(int256 num)public view returns(int256 index) {
        int256 left = 0;
        int256 right = int256(arr.length-1);
        
        index = -1;
        while (left<=right) {
            int256 mid = left + (right - left) / 2;
            int256 midValue = arr[uint256(mid)];
            if ( num == midValue) {
                index = mid;
                break;
            }else if ( num > midValue) {
                left = mid + 1;
            }else{
                right = mid - 1;
            }
        }
    }
}