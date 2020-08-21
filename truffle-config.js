const HDWalletProvider = require("truffle-hdwallet-provider");

require("dotenv").config(); // Store environment-specific variable from '.env' to process.env

module.exports = {
  compilers: {
    solc: {
      version: "0.6.12", // ex:  "0.4.20". (Default: Truffle's installed solc)
    },
  },
  networks: {
    development: {
      host: "localhost",
      port: 7545,
      network_id: "*", // Match any network id
    },
    ropsten: {
      provider: () =>
        new HDWalletProvider(
          process.env.MNENOMIC,
          "https://ropsten.infura.io/v3/" + process.env.INFURA_API_KEY
        ),
      network_id: 3,
    },
    kovan: {
      provider: () =>
        new HDWalletProvider(
          process.env.MNENOMIC,
          "https://kovan.infura.io/v3/" + process.env.INFURA_API_KEY
        ),
      network_id: 42,
    },
    rinkeby: {
      provider: () =>
        new HDWalletProvider(
          process.env.MNENOMIC,
          "https://rinkeby.infura.io/v3/" + process.env.INFURA_API_KEY
        ),
      network_id: 4,
    },
    // main ethereum network(mainnet)
    main: {
      provider: () =>
        new HDWalletProvider(
          process.env.MNENOMIC,
          "https://mainnet.infura.io/v3/" + process.env.INFURA_API_KEY
        ),
      network_id: 1,
    },
  },
};
