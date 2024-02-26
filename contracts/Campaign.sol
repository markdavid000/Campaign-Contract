// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Campaign {
    address public manager;
    uint256 public goal;
    uint256 public deadline;
    uint256 public totalContributions;
    mapping(address => uint256) public contributions;
    bool public isFinalized;
    address public recipient;

    event Contribution(address indexed contributor, uint256 amount);
    event CampaignFinalized(uint256 totalAmount);

    modifier onlyManager() {
        require(msg.sender == manager, "Only the campaign manager can call this function");
        _;
    }

    constructor(uint256 _goal, uint256 _duration, address _recipient) {
        manager = msg.sender;
        goal = _goal;
        deadline = block.timestamp + _duration;
        recipient = _recipient;
    }

    function contribute() external payable {
        require(block.timestamp < deadline, "Campaign deadline has passed");
        require(!isFinalized, "Campaign is already finalized");

        contributions[msg.sender] += msg.value;
        totalContributions += msg.value;

        emit Contribution(msg.sender, msg.value);
    }

    function finalize() external onlyManager {
        require(block.timestamp >= deadline, "Cannot finalize before the deadline");
        require(!isFinalized, "Campaign is already finalized");

        isFinalized = true;
        payable(recipient).transfer(address(this).balance);

        emit CampaignFinalized(address(this).balance);
    }

    function getSummary() public view returns (
        address, uint256, uint256, uint256, uint256, bool
    ) {
        return (manager, goal, deadline, totalContributions, address(this).balance, isFinalized);
    }
}
