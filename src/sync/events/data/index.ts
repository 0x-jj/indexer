import { Interface } from "@ethersproject/abi";

import * as erc20 from "@/events-sync/data/erc20";
import * as erc721 from "@/events-sync/data/erc721";
import * as erc1155 from "@/events-sync/data/erc1155";

import * as blur from "@/events-sync/data/blur";
import * as cryptoPunks from "@/events-sync/data/cryptopunks";
import * as decentraland from "@/events-sync/data/decentraland";
import * as element from "@/events-sync/data/element";
import * as forward from "@/events-sync/data/forward";
import * as foundation from "@/events-sync/data/foundation";
import * as looksRare from "@/events-sync/data/looks-rare";
import * as nftx from "@/events-sync/data/nftx";
import * as nouns from "@/events-sync/data/nouns";
import * as infinity from "@/events-sync/data/infinity";
import * as flow from "@/events-sync/data/flow";
import * as quixotic from "@/events-sync/data/quixotic";
import * as rarible from "@/events-sync/data/rarible";
import * as seaport from "@/events-sync/data/seaport";
import * as sudoswap from "@/events-sync/data/sudoswap";
import * as universe from "@/events-sync/data/universe";
import * as wyvernV2 from "@/events-sync/data/wyvern-v2";
import * as wyvernV23 from "@/events-sync/data/wyvern-v2.3";
import * as x2y2 from "@/events-sync/data/x2y2";
import * as zeroExV4 from "@/events-sync/data/zeroex-v4";
import * as zora from "@/events-sync/data/zora";
import * as manifold from "@/events-sync/data/manifold";
import * as tofu from "@/events-sync/data/tofu";
import * as nftTrader from "@/events-sync/data/nft-trader";
import * as okex from "@/events-sync/data/okex";
import * as bendDao from "@/events-sync/data/bend-dao";
import * as superrare from "@/events-sync/data/superrare";

// All events we're syncing should have an associated `EventData`
// entry which dictates the way the event will be parsed and then
// handled (eg. persisted to the database and relayed for further
// processing to any job queues)

// Event kind by protocol/standard
export type EventKind =
  | "erc20"
  | "erc721"
  | "erc1155"
  | "blur"
  | "cryptopunks"
  | "element"
  | "forward"
  | "foundation"
  | "looks-rare"
  | "nftx"
  | "nouns"
  | "quixotic"
  | "seaport"
  | "sudoswap"
  | "wyvern"
  | "x2y2"
  | "zeroex-v4"
  | "zora"
  | "universe"
  | "infinity"
  | "rarible"
  | "manifold"
  | "tofu"
  | "decentraland"
  | "nft-trader"
  | "okex"
  | "bend-dao"
  | "superrare"
  | "flow";

// Event sub-kind in each of the above protocol/standard
export type EventSubKind =
  | "erc721-transfer"
  | "erc721-like-transfer"
  | "erc721-erc20-like-transfer"
  | "erc721-consecutive-transfer"
  | "erc1155-transfer-single"
  | "erc1155-transfer-batch"
  | "erc721/1155-approval-for-all"
  | "erc20-approval"
  | "erc20-transfer"
  | "weth-deposit"
  | "weth-withdrawal"
  | "wyvern-v2-orders-matched"
  | "wyvern-v2.3-orders-matched"
  | "looks-rare-cancel-all-orders"
  | "looks-rare-cancel-multiple-orders"
  | "looks-rare-taker-ask"
  | "looks-rare-taker-bid"
  | "zeroex-v4-erc721-order-cancelled"
  | "zeroex-v4-erc1155-order-cancelled"
  | "zeroex-v4-erc721-order-filled"
  | "zeroex-v4-erc1155-order-filled"
  | "foundation-buy-price-set"
  | "foundation-buy-price-invalidated"
  | "foundation-buy-price-cancelled"
  | "foundation-buy-price-accepted"
  | "x2y2-order-cancelled"
  | "x2y2-order-inventory"
  | "seaport-order-cancelled"
  | "seaport-order-filled"
  | "seaport-counter-incremented"
  | "rarible-match"
  | "rarible-cancel"
  | "element-erc721-sell-order-filled"
  | "element-erc721-sell-order-filled-v2"
  | "element-erc721-buy-order-filled"
  | "element-erc721-buy-order-filled-v2"
  | "element-erc1155-sell-order-filled"
  | "element-erc1155-sell-order-filled-v2"
  | "element-erc1155-buy-order-filled"
  | "element-erc1155-buy-order-filled-v2"
  | "element-erc721-order-cancelled"
  | "element-erc1155-order-cancelled"
  | "element-hash-nonce-incremented"
  | "quixotic-order-filled"
  | "zora-ask-filled"
  | "zora-ask-created"
  | "zora-ask-price-updated"
  | "zora-ask-cancelled"
  | "zora-auction-ended"
  | "nouns-auction-settled"
  | "cryptopunks-punk-offered"
  | "cryptopunks-punk-no-longer-for-sale"
  | "cryptopunks-punk-bought"
  | "cryptopunks-punk-transfer"
  | "cryptopunks-assign"
  | "cryptopunks-transfer"
  | "sudoswap-buy"
  | "sudoswap-sell"
  | "sudoswap-token-deposit"
  | "sudoswap-token-withdrawal"
  | "sudoswap-spot-price-update"
  | "sudoswap-delta-update"
  | "sudoswap-new-pair"
  | "universe-match"
  | "universe-cancel"
  | "nftx-redeemed"
  | "nftx-minted"
  | "nftx-user-staked"
  | "nftx-swapped"
  | "nftx-swap"
  | "nftx-vault-init"
  | "nftx-vault-shutdown"
  | "nftx-eligibility-deployed"
  | "nftx-enable-mint-updated"
  | "nftx-enable-target-redeem-updated"
  | "blur-orders-matched"
  | "infinity-match-order-fulfilled"
  | "infinity-take-order-fulfilled"
  | "infinity-cancel-all-orders"
  | "infinity-cancel-multiple-orders"
  | "flow-match-order-fulfilled"
  | "flow-take-order-fulfilled"
  | "flow-cancel-all-orders"
  | "flow-cancel-multiple-orders"
  | "blur-order-cancelled"
  | "blur-nonce-incremented"
  | "forward-order-filled"
  | "forward-order-cancelled"
  | "forward-counter-incremented"
  | "manifold-purchase"
  | "manifold-modify"
  | "manifold-cancel"
  | "manifold-finalize"
  | "tofu-inventory-update"
  | "decentraland-sale"
  | "nft-trader-swap"
  | "okex-order-filled"
  | "bend-dao-taker-ask"
  | "bend-dao-taker-bid"
  | "superrare-listing-filled"
  | "superrare-bid-filled";

export type EventData = {
  kind: EventKind;
  subKind: EventSubKind;
  addresses?: { [address: string]: boolean };
  topic: string;
  numTopics: number;
  abi: Interface;
};

const allEventData = [
  erc20.approval,
  erc20.transfer,
  erc20.deposit,
  erc20.withdrawal,
  erc721.transfer,
  erc721.likeTransfer,
  erc721.erc20LikeTransfer,
  erc721.approvalForAll,
  erc721.consecutiveTransfer,
  erc1155.transferSingle,
  erc1155.transferBatch,
  foundation.buyPriceAccepted,
  foundation.buyPriceCancelled,
  foundation.buyPriceInvalidated,
  foundation.buyPriceSet,
  looksRare.cancelAllOrders,
  looksRare.cancelMultipleOrders,
  looksRare.takerAsk,
  looksRare.takerBid,
  seaport.counterIncremented,
  seaport.orderCancelled,
  seaport.orderFulfilled,
  wyvernV2.ordersMatched,
  wyvernV23.ordersMatched,
  zeroExV4.erc721OrderCancelled,
  zeroExV4.erc1155OrderCancelled,
  zeroExV4.erc721OrderFilled,
  zeroExV4.erc1155OrderFilled,
  x2y2.orderCancelled,
  x2y2.orderInventory,
  rarible.match,
  rarible.cancel,
  element.erc721BuyOrderFilled,
  element.erc721BuyOrderFilledV2,
  element.erc721SellOrderFilled,
  element.erc721SellOrderFilledV2,
  element.erc1155BuyOrderFilled,
  element.erc1155BuyOrderFilledV2,
  element.erc1155SellOrderFilled,
  element.erc1155SellOrderFilledV2,
  element.erc721OrderCancelled,
  element.erc1155OrderCancelled,
  element.hashNonceIncremented,
  quixotic.orderFulfilled,
  zora.askFilled,
  zora.askCreated,
  zora.askCancelled,
  zora.askPriceUpdated,
  zora.auctionEnded,
  nouns.auctionSettled,
  cryptoPunks.punkOffered,
  cryptoPunks.punkNoLongerForSale,
  cryptoPunks.punkBought,
  cryptoPunks.punkTransfer,
  cryptoPunks.assign,
  cryptoPunks.transfer,
  sudoswap.buy,
  sudoswap.sell,
  sudoswap.tokenDeposit,
  sudoswap.tokenWithdrawal,
  sudoswap.spotPriceUpdate,
  sudoswap.deltaUpdate,
  sudoswap.newPair,
  universe.match,
  universe.cancel,
  nftx.minted,
  nftx.redeemed,
  nftx.swapped,
  nftx.swap,
  nftx.vaultInit,
  nftx.vaultShutdown,
  nftx.eligibilityDeployed,
  nftx.enableMintUpdated,
  nftx.enableTargetRedeemUpdated,
  blur.ordersMatched,
  infinity.matchOrderFulfilled,
  infinity.takeOrderFulfilled,
  infinity.cancelAllOrders,
  infinity.cancelMultipleOrders,
  flow.matchOrderFulfilled,
  flow.takeOrderFulfilled,
  flow.cancelAllOrders,
  flow.cancelMultipleOrders,
  blur.orderCancelled,
  blur.nonceIncremented,
  forward.orderFilled,
  forward.orderCancelled,
  forward.counterIncremented,
  manifold.modify,
  manifold.finalize,
  manifold.purchase,
  manifold.cancel,
  tofu.inventoryUpdate,
  decentraland.sale,
  nftTrader.swap,
  okex.orderFulfilled,
  bendDao.takerAsk,
  bendDao.takerBid,
  superrare.listingFilled,
  superrare.bidFilled,
];

export const getEventData = (events?: string[]) => {
  if (!events || events.length === 0) {
    return allEventData;
  } else {
    return allEventData.filter(({ subKind }) => events.some((e) => subKind.startsWith(e)));
  }
};
