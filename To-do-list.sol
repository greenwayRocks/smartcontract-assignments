//SPDX-License-Identifier:MIT
pragma solidity 0.8.10;
contract Todo{
    address owner;
    /*
    Create struct called task 
    The struct has 3 fields : id,title,Completed
    Choose the appropriate variable type for each field.

    */
    struct Task {
        uint256 id;
        string title;
        bool completed;
    }
  
    ///Create a counter to keep track of added tasks
    uint256 counter;
    /*
    create a mapping that maps the counter created above with the struct taskcount
    key should of type integer
    */
    mapping(uint256 => Task) public tasks;
   
    /*
    Define a constructor
    the constructor takes no arguments
    Set the owner to the creator of the contract
    Set the counter to  zero
    */
    constructor() {
        owner = msg.sender;
        counter = 0;
    }
    
    /*

    Define 2 events
    taskadded should provide information about the title of the task and the id of the task
    taskcompleted should provide information about task status and the id of the task
    */
    event taskadded(string title, uint256 indexed id);
    event taskcompleted(bool completed, uint256 indexed id); 
    
 /*
        Create a modifier that throws an error if the msg.sender is not the owner.
    */
    modifier checkadmin() {
        require(msg.sender == owner, "Only owner can access this function");
        _;
    }

    /*
    Define a function called addTask()
    This function allows anyone to add task
    This function takes one argument , title of the task
    Be sure to check :
    taskadded event is emitted
     */

    function addTask(string memory _title) public {
        tasks[counter].title = _title;
        tasks[counter].completed = false;
        tasks[counter].id = counter;
        emit taskadded(_title, counter);
        counter ++;
    }    

    /*Define a function  to get total number of task added in this contract*/
    function totalTasks() public view returns (uint256) {
        return counter;
    }    

    /**
    Define a function gettask()
    This function takes 1 argument ,task id and 
    returns the task name ,task id and status of the task
     */
    function gettask(uint256 id) public view returns (string memory, uint256, bool) {
        return (tasks[id].title, tasks[id].id, tasks[id].completed);
    }
    
    /**Define a function marktaskcompleted()
    This function takes 1 argument , task id and 
    set the status of the task to completed 
    Be sure to check:
    taskcompleted event is emitted
     */
    function marktaskcompleted(uint256 id) public {
        tasks[id].completed = true;
        emit taskcompleted(tasks[id].completed, tasks[id].id);
    }
    
}
