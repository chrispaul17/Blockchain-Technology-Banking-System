// SPDX-License-Identifier: MIT
pragma solidity  >=0.4.22;

contract banking
{
    mapping(address=>uint) public userAccount;
    function deposit() public payable returns(string memory)
    {
        userAccount[msg.sender]=userAccount[msg.sender]+msg.value;
        return "Deposited successfully";
    }
    function withdraw(uint amount) public payable returns(string memory)
    {
        require(userAccount[msg.sender]>amount, "Insufficeint balance in Bank account");
        userAccount[msg.sender]=userAccount[msg.sender]-amount;
        msg.sender.transfer(amount);
        return "Withdrawal successful";
    }
    function TransferAmount(address payable userAddress, uint amount) public returns(string memory)
    {
        require(userAccount[msg.sender]>amount, "Insufficeint balance in Bank account");
        userAccount[msg.sender]=userAccount[msg.sender]-amount;
        userAccount[userAddress]=userAccount[userAddress]+amount;
        return "Transfer successfully";
    }
}
