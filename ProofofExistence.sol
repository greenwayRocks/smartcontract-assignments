//SPDX-License-Identifier:NONE

pragma solidity 0.8.10;

contract ProofOfExistence1 {
      // state
      // bytes32 public proof;

      struct doc {
          address storedBy;
          uint256 storedOn;
      }

      mapping (bytes32 => doc) docs;


      // calculate and store the proof for a document
      // *transactional function*
      function notarize(string memory document) public {
        bytes32 proof = getHash(document);
        docs[proof].storedBy = msg.sender;
        docs[proof].storedOn = block.timestamp;
      }

      // helper function to get a document's sha256
      // *read-only function*
      function getHash(string memory document) public pure returns (bytes32) {
          return keccak256(abi.encodePacked(document));
      }
      

      // Who notarized a string doc and when ...
      function getDoc(string memory _document) public view returns(address,uint256){
          bytes32 proof = getHash(_document);
          return (docs[proof].storedBy,docs[proof].storedOn);
      }

}

