// SPDX-Licence-Identifier: MIT


pragma solidity ^0.8.0;

import"https://github.com/1inch/limit-order-protocol/blob/master/contracts/LimitOrderProtocol.sol";

contract {
    constructor() {
      
    }
    
    function isValidSignature(bytes32 hash, bytes memory signature) public view override returns(bytes4){
      uint256 info;
      address makerAsset;
      address takerAsset;
      bytes memory makerAssetData;
      bytes memory takerAssetData;
      assembly {
        info := mload(add(signature, 0x40))
        makerAsset :=  mload(add(signature, 0x60))
        takerAsset :=  mload(add(signature, 0x80))
        makerAssetData := add(mload(add(signature, 0x60)),  mload(add(signature, 0xA0)))
        takerAssetData := add(mload(add(signature, 0x80)),  mload(add(signature, 0xC0)))
      }
      
      require(
        {
          takerAsset == address (token0) && makerAsset == address(token1) || takerAsset == address (token1) && makerAsset == address(token0) 
        } &&
        makerAssetData.decodeUint256(_AMOUNT_INDEX) * fee <= takerAssetData.decodeUint256(_AMOUNT_INDEX) * 1e18 && 
        takerAssetData.decodeAdrress(_TO_INDEX) == address (this) &&
        _hash(info, makerAsset, tatakerAsset makerAssetData, takerAssetData)
        
    }

}