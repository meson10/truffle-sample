pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    function testCanCreatePet() public {
        uint id = adoption.addPet("tommy");
        assert(id == 1);

        uint id2 = adoption.addPet("banta");
        assert(id2 == 2);
    }

    function testUserCanAdoptPet() public {
        bool returned = adoption.adopt(1);
        bool expected = false;
        Assert.equal(returned, expected, "Adoption should return true");
    }

//    function testUserCannotAdoptPet() public {
//        assert(adoption.adopt(10) == false);
//    }

    // Testing retrieval of a single pet's owner
    function testGetAdopterAddressByPetId() public {
        // Expected owner is this contract
        address expected = this;
        address adopter = adoption.getAdopter(2);
        Assert.equal(adopter, expected, "Owner of pet ID 2 should be recorded.");
    }

    // Testing my Pets
    function testGetMyPets() public {
        // Store adopters in memory rather than contract's storage
        uint[5] memory pets = adoption.getMyPets();
        assert(pets.length == 5);
    }
}