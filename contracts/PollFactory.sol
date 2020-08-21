// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract PollFactory is Ownable {
	event NewPoll(uint256 pollID);

	Poll[] public polls;

	struct Vote {
		bool inSupport;
		address voter;
	}

	struct Poll {
		uint256 externalID;
		uint256 textHash;
		uint256 startsAt;
		uint256 endsAt;
		uint256 numberOfVotes;
		uint256 currentResult;
		uint256[] documents;
		Vote[] votes;
		mapping(address => bool) voted;
	}

	function _createPoll(
		uint256 _externalID,
		string memory _text,
		uint256 _startsAt,
		uint256 _endsAt,
		uint256[] memory _documents
	) internal returns (uint256 pollID) {
		pollID = polls.length + 1;
		Poll storage poll = polls[pollID];
		poll.externalID = _externalID;
		poll.startsAt = _startsAt;
		poll.textHash = uint256(keccak256(abi.encode(_text)));
		poll.endsAt = _endsAt;
		poll.numberOfVotes = 0;
		poll.currentResult = 0;
		for (uint256 i = 0; i < _documents.length; i++) {
			poll.documents.push(_documents[i]);
		}
		emit NewPoll(pollID);
		return pollID;
	}
}
