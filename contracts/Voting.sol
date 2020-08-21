// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

import "./VotingHelper.sol";

contract Voting is VotingHelper {
	function createPoll(
		uint256 _externalID,
		string memory _text,
		uint256 _startsAt,
		uint256 _endsAt,
		uint256[] memory _documents
	) external onlyOwner returns (uint256 pollID) {
		pollID = _createPoll(_externalID, _text, _startsAt, _endsAt, _documents);
		return pollID;
	}

	function getPoll(address _voter, uint256 _pollID)
		external
		view
		returns (
			uint256,
			uint256,
			uint256,
			uint256,
			uint256,
			uint256,
			int256
		)
	{
		Poll storage poll = polls[_pollID];
		int256 vote = getVoted(_voter, _pollID);
		return (
			poll.externalID,
			poll.textHash,
			poll.startsAt,
			poll.endsAt,
			poll.numberOfVotes,
			poll.currentResult,
			vote
		);
	}

	function vote(
		uint256 _pollID,
		address _voter,
		bool _supportsPoll
	) external onlyOwner returns (uint256 voteID) {
		Poll storage p = polls[_pollID];
		require(p.voted[_voter] != true);
		p.voted[_voter] = true;
		p.numberOfVotes++;
		if (_supportsPoll) {
			p.currentResult++;
		} else {
			p.currentResult--;
		}
		voteID = p.votes.length + 1;
		p.votes[voteID] = Vote(_supportsPoll, _voter);
		return voteID;
	}
}
