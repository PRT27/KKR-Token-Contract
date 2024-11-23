solidity
// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/// @custom:security-contact nhlanhlathwala27@gmail.com
contract KKRTokenContract is ERC20, Ownable {
    constructor(address initialOwner)
        ERC20("KKR-Token-Contract", "KKR")
        Ownable(initialOwner)
    {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}

contract KkakarotToken is ERC20 {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    string public constant name = "Kkakarot";
    string public constant symbol = "KKR";
    uint8 public constant decimals = 18;
    uint256 public constant totalSupply = 1000000000 * (10 ** decimals); // 1,000,000,000 KKR

    constructor() public ERC20(name, symbol) {
        _mint(msg.sender, totalSupply);
    }
}
contract KkakarotToken {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    string public constant name = "Kkakarot";
    string public constant symbol = "KKR";
    uint8 public constant decimals = 18;
    uint256 public constant totalSupply = 1000000000000000000; // 1,000,000 KKR

    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) allowed;

    constructor() public {
        balances[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return balances[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_to != address(0));
        require(_value <= balances[msg.sender]);

        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public view returns (uint256) {
        return allowed[_owner][_spender];
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        require(_to != address(0));
        require(_value <= balances[_from]);
        require(_value <= allowed[_from][msg.sender]);

        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
        emit Transfer(_from, _to, _value);
        return true;
    }

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}
