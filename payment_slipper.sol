pragma solidity ^0.8.0;

contract PaymentSplitter {
    address payable[] recipients;
    uint256[] shares;
    uint256 totalShares;

    function distribute() external payable {
        require(msg.value > 0, "No Ether sent");
        require(recipients.length > 0, "No recipients set");
        
        for (uint256 i = 0; i < recipients.length; i++) {
            uint256 amount = (msg.value * shares[i]) / totalShares;
            recipients[i].transfer(amount);
        }
    }
}
