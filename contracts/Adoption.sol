pragma solidity ^0.4.17;

contract Adoption {
    struct Pet {
        string name;
        address owner;
    }

    Pet[] pets;

    function addPet(string name) public returns (uint) {
        return pets.push(Pet({name: name, owner: msg.sender}));
    }

    // Adopting a pet
    function adopt(uint petId) public returns (bool) {
        require(petId > 0 && petId < pets.length);
        Pet memory pet = pets[petId-1];
        if (pet.owner == msg.sender) {
            return false;
        }

        pet.owner = msg.sender;
        return true;
    }


    // Retrieving the adopter
    function getAdopter(uint petId) public returns (address) {
        return pets[petId - 1].owner;
    }

    // Retrieve my Pets
    function getMyPets() public returns (uint[5]) {
        uint[5] memory myPets;

        for (uint i = 0; i < pets.length; i++) {
            if (pets[i].owner == msg.sender) {
                myPets[i] = i+1;
            }
        }

        return myPets;
    }
}
