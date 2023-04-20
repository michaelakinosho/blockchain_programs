const { keccak256 } = require("ethereum-cryptography/keccak");
const { utf8ToBytes } = require("ethereum-cryptography/utils");

function hashMessage(message) {
    let hash = keccak256(utf8ToBytes(message));
    //console.log(hash);
    return hash;
}

module.exports = hashMessage;