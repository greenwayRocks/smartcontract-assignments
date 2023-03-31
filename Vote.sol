pragma solidity 0.8.10;

contract cityPoll {
    
    struct City {
        string cityName;
        uint256 vote;
        uint256 population;
        uint256 id;
    }

    mapping(uint256 => City) public cities;
    mapping(address => bool) hasVoted;

    address owner;
    uint256 public cityCount = 0; // number of city added

    constructor() public {
        owner = msg.sender;
        addCity("Kathmandu", 999);
        addCity("Chitwan", 578);
    }
 
 
    function addCity(string memory name, uint256 popn) public {
        //  TODO: add city to the CityStruct
        cities[cityCount].cityName = name;
        cities[cityCount].population = popn;
        cities[cityCount].id = cityCount;
        cityCount = cityCount + 1;
    }
    
    function voteCity(uint256 id) public {
        require(!hasVoted[msg.sender], "You already voted!");
        //TODO Vote the selected city through cityID
        cities[id].vote ++;
        hasVoted[msg.sender] = true;
    }

    function getCity(uint256 id) public view returns (string memory) {
        // TODO get the city details through cityID    
        return(cities[id].cityName);
    }

    function getVote(uint256 id) public view returns (uint256) {
        // TODO get the vote of the city with its ID
        return(cities[id].vote);
    }

}

