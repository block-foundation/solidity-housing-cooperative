// SPDX-License-Identifier: Apache-2.0


// Copyright 2023 Stichting Block Foundation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


// pragma solidity ^0.8.19;
pragma solidity >=0.8.0 <0.9.0;


// ============================================================================
// Contracts
// ============================================================================
// SPDX-License-Identifier: MIT

contract HousingCooperative {
    
    struct Member {
        address member;
        uint256 joinedAt;
    }

    struct Proposal {
        string description;
        uint256 voteCount;
        mapping(address => bool) voters;
    }

    Member[] public members;
    Proposal[] public proposals;
    
    mapping(address => bool) public isMember;

    event MemberAdded(address member);
    event ProposalAdded(string description);
    event VoteReceived(string description, address voter);

    function join() public {
        require(!isMember[msg.sender], "Already a member.");
        
        members.push(Member(msg.sender, block.timestamp));
        isMember[msg.sender] = true;

        emit MemberAdded(msg.sender);
    }

    function propose(string memory description) public {
        require(isMember[msg.sender], "Only members can propose.");

        Proposal memory newProposal;
        newProposal.description = description;

        proposals.push(newProposal);

        emit ProposalAdded(description);
    }

    function vote(uint256 proposalIndex) public {
        require(isMember[msg.sender], "Only members can vote.");
        require(!proposals[proposalIndex].voters[msg.sender], "Already voted.");

        proposals[proposalIndex].voteCount++;
        proposals[proposalIndex].voters[msg.sender] = true;

        emit VoteReceived(proposals[proposalIndex].description, msg.sender);
    }

    function getMemberCount() public view returns(uint256) {
        return members.length;
    }

    function getProposalCount() public view returns(uint256) {
        return proposals.length;
    }

    function getVoteCount(uint256 proposalIndex) public view returns(uint256) {
        return proposals[proposalIndex].voteCount;
    }
}