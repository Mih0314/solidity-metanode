// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract SortArr {
    uint256[5] public sortarr1;
    uint256[5] public sortarr2;

    constructor () {
        sortarr1 = [1, 3, 5, 7, 9];
        sortarr2 = [2, 4, 6, 8, 10];
    }

    function sort() public view returns (uint256[10] memory result) {
        uint256 i = 0;
        uint256 j = 0;
        uint256 k = 0;

        while (i < sortarr1.length && j < sortarr2.length) {
            if (sortarr1[i] < sortarr2[j]) {
                result[k] = sortarr1[i];
                i++; 
            } else {
                result[k] = sortarr2[j];
                j++;
            }
            k++; 
        }

        while (i < sortarr1.length) {
            result[k] = sortarr1[i];
            i++;
            k++;
        }

        while (j < sortarr2.length) {
            result[k] = sortarr2[j];
            j++;
            k++;
        }
    }
}