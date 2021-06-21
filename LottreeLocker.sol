pragma solidity ^0.6.12;
// SPDX-License-Identifier: Unlicensed

interface IBEP20 {
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount)
        external
        returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender)
        external
        view
        returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
}

library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}


contract LOTtreeLocker {
     using SafeMath for uint256;
     uint256 public _totalValueLocked = 0;
     address public _owner;
      struct lotLocker{
           uint256 amount;
           uint256 interval;
           uint256 intervalMax;
           uint256 dropPerInterval;
           uint256 balance;
           bool isExists;
           uint256 lastReward;
       }
     mapping (address => lotLocker) public _lockers;
     
     IBEP20 public token;
     
     constructor(IBEP20 _token) public{
         token=_token;
         _owner=msg.sender;
         _addLocker(500e9,30, 10, 0x3FFD3EEA605A9FfF13C463be2DD5fb57c4a00CB4);
         _addLocker(1000e9,30, 10, 0xDf1BF667AE1Db0935eC864056164A086e4FeF0f8);
          _addLocker(1000e9,30, 10, 0x28C5135603A890b20C4e74aB47190B9747D94c2F);
           _addLocker(1000e9,30, 10, 0x811f139d754A5400BE88d14217182CbB551BD97C);
          _addLocker(1000e9,30, 10, 0xa3Ba0F374Fe51Dc224ea1F6F4645A73926481459);
           _addLocker(5000e9,30, 10, 0x0bEE0B9C413552e915017Ea548433ef9b6e96149);
            _addLocker(5000e9,30, 10, 0xBF6f70B3dd3F661F5cAA9bA1481669BbbAA5Fd9f);
             _addLocker(5000e9,30, 10, 0x84C52963B1AD0E1DD431E7Cdf43140f37F656657);
             _addLocker(5000e9,30, 10, 0xcc4ea3Db867bc9c3EbD33a0F9C20Ca69FbeCFF04);
             _addLocker(5000e9,30, 10, 0x9857Ae8ee89ad580B3ABf3D115aEcea2809632c2);
             _addLocker(5000e9,30, 10, 0x336057b19207f7b3cbF1809cAa90BcCcaDcc295F);
             _addLocker(5000e9,30, 10, 0x441dCe8fe60B621cB79B755b1D8d9B8ece8496FA);
              _addLocker(5000e9,30, 10, 0xdDBBcb03F14101F796EDEfa9622b9336dca72ccA);
               _addLocker(5000e9,30, 10, 0x49302da48BF2c07b1fDa1B24Da92b0f2ec8B113a);
               
                _addLocker(7500e9,30, 10, 0xA1d836317c82F2Ae06861BBd288b5649Cb72fB15);
                 _addLocker(7500e9,30, 10, 0x7b4fEC5FF567bD98D849ae0429c6c1c952A5cF91);
                 
                 _addLocker(10000e9,30, 10, 0x8c8f558D78Fe5d9FbC3Cd9B558f4EDc9486BB072);
                 _addLocker(10000e9,30, 10, 0x38C6e21eA0338e4e16397424697140817D924B87);
                  _addLocker(10000e9,30, 10, 0x0cefDE7F4C699B9C12AC1C9554E6A1754a40fdef);
                  _addLocker(10000e9,30, 10, 0x509c008Ca226B129DBfC228Cc7E65091C90f746E);
                   _addLocker(10000e9,30, 10, 0x81204f73b5A8B5AA570441E3ACE027D7CAf30d27);
                  _addLocker(10000e9,30, 10, 0x3004358Dc7a40679F33b2B21C4eC4F4dcb42967B);
                   _addLocker(10000e9,30, 10, 0x8f6A525e86D5c4a3D03775BB5Ab87fc53d22682C);
                   _addLocker(10000e9,30, 10, 0x766ef0f0d56c86E6c7F38bFe4C15193373493c05);
                   _addLocker(10000e9,30, 10, 0x320670779e04A4282E17D835d3888B5A8B2319b7);
                  _addLocker(10000e9,30, 10, 0xF293a346872c98983E96D2108C695b0Ecb9aA29f);
                   _addLocker(10000e9,30, 10, 0x94CA72EA97645D2f5f693724A1e091a58c133ff5);
                  _addLocker(10000e9,30, 10, 0x7C2b78619e82569Be7d016D01d2F23A17d7e7399);
                  _addLocker(10000e9,30, 10, 0x2ef0FE6Ed7A009066ED8889A185b31A142a8fc94);
                   _addLocker(10000e9,30, 10, 0xE303DfCA60efdC9C71c8d2704488da52AE18a788);
                   _addLocker(10000e9,10, 10, 0x7b718EBd64C67F1FBee48a671308F0723935dFDD);
                   _addLocker(10000e9,10, 10, 0x0Cd40FBafAe912D761899cAA3AE504D4AEd17530);
                   _addLocker(10000e9,10, 10, 0x9634663c0E0994C722511313071Ae78609b5D502);
                   _addLocker(10000e9,10, 10, 0x6B1429f3360c9653AF62b081166668a56f881e6A);
                   _addLocker(10000e9,10, 10, 0x7C1b9c5a0534390C98bb8Bbc553d0227B695Fa37);
                   _addLocker(10000e9,10, 10, 0xCC300A92C6df50D5AC87d98E9f2Db9726f2D7D4E);
                   _addLocker(10000e9,10, 10, 0xD0889328EcF1a2dA083D32CFCd57176d95c57469);
                   _addLocker(10000e9,10, 10, 0x9Bb18F7EfDf43051473Da1d214a2d69B0eCA39ec);
                   _addLocker(10000e9,10, 10, 0xf0dd50EC605d3711dD225D46e2643A0C91c095A3);
                   _addLocker(10000e9,10, 10, 0xeB5d9d0c90194B0391f2f5f5455591093f6f75FF);
                   _addLocker(10000e9,10, 10, 0xc85D08163ef159Ef08Ac1b5EE385d73061899F08);
                   _addLocker(10000e9,10, 10, 0x6Be7Db4D1b29fB874a70420233c5A3cfaEDAb7e6);
                   
                    _addLocker(100000e9,178, 25, 0xDE23846643ad78481C92E556076e2453Af9d7b42);
                    _addLocker(100000e9,178, 25, 0x2a3c1136F752E7A2486eea2D77256e2fB22B932f);
                  _addLocker(100000e9,178, 25, 0x66626C7e0D3167aa708885F72A844A094D27B4D1);
                   _addLocker(100000e9,178, 25, 0x81bBC3D1E95b55DA0B3B72fEeB3eD7bA5626a81d);
                   _addLocker(100000e9,178, 25, 0x2b3215Bc47129088E6e9611B0f36fcbD0605bf81);
                  
                 _addLocker(10000e9,178, 25, 0xE429bD4FCaB10470a0F05B3950204A839e67fa43);
                  _addLocker(10000e9,178, 25, 0xaF91832294A334BC7Cc4C7787d0e8b66b7D0BAC5);
                 _addLocker(7500e9,178, 25, 0x55e36d986bE4972838796Cb51D5824685Fd4b23c);
                 _addLocker(7500e9,178, 25, 0xbDF9f78A1d1A1aCAf465AC77BA2E36E4F144d560);
         
         
     }
     
     modifier onlyOwner() {
        require(_owner == msg.sender, "Ownable: caller is not the owner");
        _;
    }
    
    function emergencyUnlock(address user) external onlyOwner() {
        require(_lockers[user].isExists, "The User does'nt Exists !");
       token.transfer(_owner,_lockers[user].balance);
        _totalValueLocked = _totalValueLocked.sub(_lockers[user].balance);
        delete _lockers[user];
    }
    
    function totalLockedTokens()public view returns (uint256){
        return token.balanceOf(address(this));
    }
    
    function tokensNeededtoTransfer()public view returns (uint256){
        return _totalValueLocked.sub(token.balanceOf(address(this)));
    }
    
    function _addLocker(uint256 _amount, uint256 _intervalInDays, uint256 _PercentPerInterval, address _to) internal{
         _PercentPerInterval = _amount.mul(_PercentPerInterval).div(100);
           _lockers[_to]= lotLocker({
               amount : _amount,
               interval: (_intervalInDays).mul(1 days),
               intervalMax: _intervalInDays,
               dropPerInterval: _PercentPerInterval,
               balance: _amount,
               isExists: true,
               lastReward: block.timestamp
           });
           
           _totalValueLocked=_totalValueLocked.add(_amount);
    }
    
    function emergencyWithdraw() public onlyOwner{
        token.transfer(_owner,token.balanceOf(address(this)));
    }
    
     function addLocker(uint256 _amount, uint256 _intervalInDays, uint256 _PercentPerInterval, address _to) public onlyOwner{
            _addLocker(_amount,_intervalInDays, _PercentPerInterval, _to);
       }
       
       
     function withdrawFunds(address user) public{
           //address user = msg.sender;
            require(_lockers[user].isExists, "The User doesn't Exists !");
           if(_lockers[user].isExists){
               if(_lockers[user].balance > 0 && block.timestamp >= _lockers[user].lastReward.add(_lockers[user].interval)){
                    uint256 diffdays = (block.timestamp.sub(_lockers[user].lastReward));
                    diffdays=diffdays.div(60).div(60).div(24);
                    uint256 remaining = diffdays.mod(_lockers[user].intervalMax);
                    uint256 diff = diffdays.div(_lockers[user].intervalMax);
                    uint256 pending = diff.mul(_lockers[user].dropPerInterval);
                    if(pending > _lockers[user].balance){
                        pending = _lockers[user].balance;
                    }
                    token.transfer(user,(pending));
                    _lockers[user].balance = (_lockers[user].balance).sub(pending);
                      if(remaining > 0){
                         _lockers[user].lastReward = (block.timestamp).sub((remaining).mul(1 days));
                    }else{
                         _lockers[user].lastReward = block.timestamp;
                    }
               }
                if(_lockers[user].balance <= 0){
                delete _lockers[user];
                }
           }
           
       }
}
