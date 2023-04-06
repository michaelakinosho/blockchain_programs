pragma solidity >=0.7.0 <0.9.0;

contract HelloWorld {
    //string public x = "1Hello 2World";
    //bytes public y = "hello world";

    string x = "1Hello 2World";
    bytes y = "hello world";

    function testString() public {
        y[0] = "1";
    }

    function testReturnBytes() public view returns (bytes memory, bytes memory) {
        return (bytes(x), y);
    }

    function testReturnString() public view returns (string memory, string memory) {
        return (x, string(y));
    }

    function convertStringBytes(string memory str) public pure returns (string memory) {
        // bytes memory convertedStr = new bytes(bytes(str).length + 1);
        string memory newStr = string.concat(str, "s");
        return newStr;
    }
}