// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18 ;

// contract Mapping {
//     mapping(address => uint256) public balances;
//     mapping(address => mapping(address => bool)) public IsFriend;

//     function example() external {
//         balances[msg.sender] = 123;
//         //uint a = balances[msg.sender];
//         // uint b = balances[address(1)]; //0 - This line is unnecessary
//         balances[msg.sender] += 256;

//         delete balances[msg.sender];
// //         function IsFriend(address _primary, address _potentialFriend) public view returns (bool) {
// //            return IsFriend[_primary][_potentialFriend];
// // }
//     }
// }
contract ifesle{
     function takeval(uint256 _x) public pure returns(uint256){
        return _x<10 ? 1 : 2 ;
     }
}
