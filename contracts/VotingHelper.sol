// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

import "./PollFactory.sol";

contract VotingHelper is PollFactory {
	function getVoted(address _voter, uint256 _pollID)
		internal
		view
		returns (int256)
	{
		Poll storage poll = polls[_pollID];
		int256 result = 0;
		int256 true_int = 1;
		int256 false_int = -1;
		for (uint256 i = 0; i < poll.numberOfVotes; i++) {
			if (poll.votes[i].voter == _voter) {
				result = poll.votes[i].inSupport ? true_int : false_int;
				break;
			}
		}
		return result;
	}
}
