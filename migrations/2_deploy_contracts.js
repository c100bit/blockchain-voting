const PollFactory = artifacts.require("PollFactory");
const VotingHelper = artifacts.require("VotingHelper");
const Voting = artifacts.require("Voting");

module.exports = function (deployer) {
  deployer.deploy(PollFactory);
  deployer.deploy(VotingHelper);
  deployer.deploy(Voting);
};
