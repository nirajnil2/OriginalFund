
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


// interface OperatorInterface is OracleInterface, ChainlinkRequestInterface {
//   function operatorRequest(
//     address sender,
//     uint256 payment,
//     bytes32 specId,
//     bytes4 callbackFunctionId,
//     uint256 nonce,
//     uint256 dataVersion,
//     bytes calldata data
//   ) external;

//   function fulfillOracleRequest2(
//     bytes32 requestId,
//     uint256 payment,
//     address callbackAddress,
//     bytes4 callbackFunctionId,
//     uint256 expiration,
//     bytes calldata data
//   ) external returns (bool);

//   function ownerTransferAndCall(address to, uint256 value, bytes calldata data) external returns (bool success);

//   function distributeFunds(address payable[] calldata receivers, uint256[] calldata amounts) external payable;
// }
import {Priceconvertor} from "./Priceconvertor.sol" ;
contract FundMe {
    using Priceconvertor for uint256;
    uint256 minimumUSD = 5e18;
    address[] public funders;
    mapping(address funder => uint256 amountFunded) public AddresstoamountFunded;

    function fund() public payable {
        
       require(msg.value.getConversionRate() >= minimumUSD, "Did not send enough ETH");
        funders.push(msg.sender);
        AddresstoamountFunded[msg.sender] = AddresstoamountFunded[msg.sender] + msg.value;

    }

    function withdraw() public {
        for(uint256 funderIndex=0 ; funderIndex < funders.length ; funderIndex++){
            //code
            //jo v funders[0]  (ak list hai) pe address save hoga uslo funder me save kr dega
            address funder = funders[funderIndex];
            AddresstoamountFunded[funder] = 0;
            
        }
        //reset the array
        funders = new address[](0);
        //actually withdraw all the funds

        //msg.sender = address
        //transfer
        payable(msg.sender).transfer(address(this).balance);

        //send
        bool sendSuccess = payable(msg.sender).send(address(this).balance);
        require(sendSuccess , "Send failed");

        //call
      (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
        // send all the Ether held by the contract to the address that called the
        // function (msg.sender) using the low-level .call method

    }

   
}
