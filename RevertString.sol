// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract RevertString {
    function revertstr(string calldata str) public pure returns(string memory res) {
        bytes memory b = bytes(str);
        bytes memory resbytes = new bytes(b.length);
        for(uint i=b.length; i >0 ; i--) {
            resbytes[b.length-i] = b[i-1];
        }
        res = string(resbytes);
        return res; 
    }
}