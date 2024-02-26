// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Campaign.sol";

contract CampaignFactory {
    Campaign[] public deployedCampaigns;

    event CampaignCreated(address indexed campaignAddress, address indexed manager);

    function createCampaign(uint256 _goal, uint256 _duration, address _recipient) external {
        Campaign newCampaign = new Campaign(_goal, _duration, _recipient);
        deployedCampaigns.push(newCampaign);

        emit CampaignCreated(address(newCampaign), msg.sender);
    }

    function getDeployedCampaigns() external view returns (Campaign[] memory) {
        return deployedCampaigns;
    }
}
