// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract HousingCooperative {

    struct House {
        address id;
        string owner;
    }
    
    House[] public houses;
    
    // Map the house id to their index in the houses array
    mapping(address => uint) houseIndex;
    
    // Only the owner of the house can perform certain operations
    modifier onlyHouseOwner(address _houseId) {
        require(msg.sender == houses[houseIndex[_houseId]].id, "You are not the owner of this house.");
        _;
    }

    event NewHouse(address id, string owner);
    
    function addHouse(address _houseId, string memory _owner) public {
        houses.push(House(_houseId, _owner));
        houseIndex[_houseId] = houses.length - 1;
        emit NewHouse(_houseId, _owner);
    }
    
    function getHouse(address _houseId) public view returns (address, string memory) {
        return (houses[houseIndex[_houseId]].id, houses[houseIndex[_houseId]].owner);
    }
    
    function changeOwner(address _houseId, string memory _newOwner) public onlyHouseOwner(_houseId) {
        houses[houseIndex[_houseId]].owner = _newOwner;
    }
}
