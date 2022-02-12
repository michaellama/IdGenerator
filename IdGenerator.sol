//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract IdGenerator {
    uint256 idLength = 16;
    uint256 idModulus = 10**idLength;
    uint256 controlNumber;

    struct Member {
        string name;
        uint256 memberId;
    }

    Member[] public members;

    function _createMember(string memory _name, uint256 _memberId) private {
        members.push(Member(_name, _memberId));
    }

    function _generateRandomId(string memory _str)
        private
        view
        returns (uint256)
    {
        uint256 rand = uint256(keccak256(abi.encode(_str))) + controlNumber;
        return rand % idModulus;
    }

    function createRandomIdMember(string memory _name) public {
        uint256 randomId = _generateRandomId(_name);
        controlNumber = randomId;
        _createMember(_name, randomId);
    }
}
