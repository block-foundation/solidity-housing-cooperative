// SPDX-License-Identifier: Apache-2.0

pragma solidity ^0.8.19;


// ============================================================================
// Contracts
// ============================================================================

/**
 * Housing cooperative Contract
 * @dev 
 */
contract HousingCooperative {

    // Struct
    // ========================================================================

    struct House {
        address id;
        string owner;
        uint price;
        bool forSale;
    }


    // Parameters
    // ========================================================================

    House[] public houses;


    // Mappings
    // ========================================================================

    // Map the house id to their index in the houses array
    mapping(address => uint) houseIndex;

    // Member balances
    mapping(address => uint) public balances;


    // Modifiers
    // ========================================================================

    // Only the owner of the house can perform certain operations
    modifier onlyHouseOwner(address _houseId) {
        require(
            msg.sender == houses[houseIndex[_houseId]].id,
            "You are not the owner of this house."
        );
        _;
    }

    // Events
    // ========================================================================

    event NewHouse(
        address id,
        string owner
    );

    event HouseSold(
        address id,
        string newOwner
    );


    // Methods
    // ========================================================================

    function addHouse(
        address _houseId,
        string memory _owner,
        uint _price
    ) public {
        houses.push(House(_houseId, _owner, _price, false));
        houseIndex[_houseId] = houses.length - 1;
        emit NewHouse(_houseId, _owner);
    }
    
    function getHouse(
        address _houseId
    ) public view returns (
        address,
        string memory,
        uint,
        bool
    ) {
        return (
            houses[houseIndex[_houseId]].id,
            houses[houseIndex[_houseId]].owner,
            houses[houseIndex[_houseId]].price,
            houses[houseIndex[_houseId]].forSale
        );
    }
    
    function changeOwner(
        address _houseId,
        string memory _newOwner
    ) public onlyHouseOwner(_houseId) {
        houses[houseIndex[_houseId]].owner = _newOwner;
    }

    function putForSale(
        address _houseId
    ) public onlyHouseOwner(
        _houseId
    ) {
        houses[houseIndex[_houseId]].forSale = true;
    }

    function withdrawFunds(
        uint amount
    ) public {
        require(
            balances[msg.sender] >= amount,
            "Not enough funds."
        );
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    function buyHouse(
        address _houseId
    ) public payable {
        require(
            houses[houseIndex[_houseId]].forSale == true,
            "House not for sale."
        );
        require(
            msg.value >= houses[houseIndex[_houseId]].price,
            "Not enough Ether sent for the house."
        );
        balances[houses[houseIndex[_houseId]].id] += msg.value;
        houses[houseIndex[_houseId]].owner = msg.sender;
        houses[houseIndex[_houseId]].forSale = false;
        emit HouseSold(_houseId, msg.sender);
    }

}
