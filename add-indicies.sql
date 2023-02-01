CREATE INDEX "nft_balances_owner_last_token_appraisal_value_index"
ON "nft_balances" ("owner", "last_token_appraisal_value" DESC NULLS LAST)
WHERE ("amount" > 0);

CREATE INDEX "fill_events_2_block_block_hash_index"
  ON "fill_events_2" ("block", "block_hash");

CREATE INDEX "fill_events_2_timestamp_index"
  ON "fill_events_2" ("timestamp", "log_index", "batch_index");

CREATE INDEX "fill_events_2_contract_timestamp_index"
  ON "fill_events_2" ("contract", "timestamp", "log_index", "batch_index");

CREATE INDEX "fill_events_2_contract_token_id_timestamp_index"
  ON "fill_events_2" ("contract", "token_id", "timestamp", "log_index", "batch_index");

CREATE INDEX "fill_events_2_order_id_timestamp_index"
  ON "fill_events_2" ("order_id", "timestamp");

CREATE INDEX "fill_events_2_created_at_tx_hash_index"
  ON "fill_events_2" ("created_at", "tx_hash", "log_index", "batch_index");

CREATE INDEX "fill_events_2_maker_taker_contract"
  ON "fill_events_2" ("maker", "taker", "contract");

CREATE INDEX "orders_conversion_index"
  ON "orders" ("id")
  WHERE ("needs_conversion" AND "fillability_status" = 'fillable' AND "approval_status" = 'approved');

CREATE INDEX "collections_normalized_floor_sell_value_index"
ON "collections" ("normalized_floor_sell_value", "id");

CREATE INDEX "collection_normalized_floor_sell_events_created_at_id_index"
  ON "collection_normalized_floor_sell_events"("created_at", "id");

CREATE INDEX "collection_normalized_floor_sell_events_collection_id_created_at_id_index"
  ON "collection_normalized_floor_sell_events"("collection_id", "created_at", "id");

CREATE INDEX "bid_events_created_at_id_index"
  ON "bid_events" ("created_at", "id");

CREATE INDEX "bid_events_contract_created_at_id_index"
  ON "bid_events" ("contract", "created_at", "id");

CREATE INDEX "removed_attribute_keys_deleted_at_id_index"
  ON "removed_attribute_keys" ("deleted_at", "id");

CREATE INDEX "removed_attributes_deleted_at_id_index"
  ON "removed_attributes" ("deleted_at", "id");

CREATE INDEX "removed_token_attributes_deleted_at_contract_token_id_attribute_id_index"
  ON "removed_token_attributes" ("deleted_at", "contract", "token_id", "attribute_id");

CREATE INDEX "nft_approval_events_block_block_hash_index"
  ON "nft_approval_events" ("block", "block_hash");

CREATE INDEX "nft_approval_events_address_owner_operator_block_index"
  ON "nft_approval_events" ("address", "owner", "operator", "block" DESC)
  INCLUDE ("approved");

CREATE INDEX "token_sets_collection_id_top_buy_value_index"
  ON "token_sets" ("collection_id", "top_buy_value" DESC NULLS LAST)
  WHERE ("collection_id" IS NOT NULL);

CREATE INDEX "token_sets_attribute_id_top_buy_value_index"
  ON "token_sets" ("attribute_id", "top_buy_value" DESC NULLS LAST)
  WHERE ("attribute_id" IS NOT NULL);

CREATE INDEX "token_sets_tokens_contract_token_id_index"
  ON "token_sets_tokens" ("contract", "token_id")
  INCLUDE ("token_set_id");

CREATE INDEX "tokens_contract_floor_sell_value_index"
  ON "tokens" ("contract", "floor_sell_value");

CREATE INDEX "tokens_collection_id_contract_token_id_index"
  ON "tokens" ("collection_id", "contract", "token_id");

CREATE INDEX "tokens_collection_id_source_id_floor_sell_value_index"
  ON "tokens" ("collection_id", "floor_sell_source_id", "floor_sell_value");

CREATE INDEX "tokens_contract_top_buy_value_index"
  ON "tokens" ("contract", "top_buy_value" DESC NULLS LAST);

CREATE INDEX "tokens_collection_id_floor_sell_value_token_id_index"
  ON "tokens" ("collection_id", "floor_sell_value", "token_id");

CREATE INDEX "tokens_collection_id_rarity_rank_token_id_index"
  ON "tokens" ("collection_id", "rarity_rank" DESC NULLS LAST, "token_id");

CREATE INDEX "tokens_collection_id_top_buy_value_token_id_index"
  ON "tokens" ("collection_id", "top_buy_value" DESC NULLS LAST, "token_id" DESC);

CREATE INDEX "tokens_top_buy_maker_collection_id_index"
  ON "tokens" ("top_buy_maker", "collection_id")
  INCLUDE ("top_buy_value");

CREATE INDEX "tokens_contract_token_id_index"
  ON "tokens" ("contract", "token_id")
  INCLUDE ("floor_sell_value", "top_buy_value");

CREATE INDEX "tokens_updated_at_contract_token_id_index"
  ON "tokens" ("updated_at", "contract", "token_id");

CREATE INDEX "cancel_events_block_block_hash_index"
  ON "cancel_events" ("block", "block_hash");

CREATE INDEX "cancel_events_order_id_timestamp_index"
  ON "cancel_events" ("order_id", "timestamp");

CREATE INDEX "collection_floor_sell_events_created_at_id_index"
  ON "collection_floor_sell_events"("created_at", "id");

CREATE INDEX "collection_floor_sell_events_collection_id_created_at_id_index"
  ON "collection_floor_sell_events"("collection_id", "created_at", "id");

CREATE INDEX "nonce_cancel_events_block_block_hash_index"
  ON "nonce_cancel_events" ("block", "block_hash");

CREATE INDEX "nonce_cancel_events_order_kind_maker_nonce_index"
  ON "nonce_cancel_events" ("order_kind", "maker", "nonce");

CREATE INDEX "bundle_items_token_set_id_bundle_id_index"
  ON "bundle_items" ("token_set_id", "bundle_id");

CREATE INDEX "orders_offer_bundle_id_index"
  ON "orders" ("offer_bundle_id")
  WHERE "offer_bundle_id" IS NOT NULL;

CREATE INDEX "orders_consideration_bundle_id_index"
  ON "orders" ("consideration_bundle_id")
  WHERE "consideration_bundle_id" IS NOT NULL;

CREATE INDEX "tokens_last_flag_change_is_flagged_index"
  ON "tokens" ("last_flag_change" DESC NULLS LAST, "is_flagged");

CREATE INDEX "order_events_created_at_id_index"
  ON "order_events"("created_at", "id");

CREATE INDEX "order_events_contract_created_at_id_index"
  ON "order_events"("contract", "created_at", "id");

CREATE INDEX "attribute_keys_collection_id_rank_key_index"
  ON "attribute_keys" ("collection_id", "rank" DESC)
  WHERE ("rank" IS NOT NULL);

CREATE INDEX "attribute_keys_updated_at_id_index"
  ON "attribute_keys" ("updated_at", "id");

CREATE INDEX "attributes_collection_id_floor_sell_value_index"
  ON "attributes" ("collection_id" ASC NULLS LAST, "floor_sell_value" DESC NULLS LAST);

CREATE INDEX attributes_key_collection_id_floor_sell_value_index
  ON attributes (key ASC NULLS LAST, collection_id ASC NULLS LAST, floor_sell_value DESC NULLS LAST);

CREATE INDEX "attributes_updated_at_id_index"
  ON "attributes" ("updated_at", "id");

CREATE INDEX "token_attributes_contract_token_id_key_value_index"
  ON "token_attributes" ("contract", "token_id", "key", "value");

CREATE INDEX "token_attributes_collection_id_key_value_index"
  ON "token_attributes" ("collection_id", "key", "value")
  INCLUDE(contract, token_id);

CREATE INDEX "token_attributes_updated_at_contract_token_id_attribute_id_index"
  ON "token_attributes" ("updated_at", "contract", "token_id", "attribute_id");

CREATE INDEX "collections_contract_token_id_range_index"
  ON "collections" ("contract", "token_id_range")
  INCLUDE ("id");

CREATE INDEX "collections_community_index"
  ON "collections" ("community");

CREATE INDEX "collections_slug_index"
  ON "collections" ("slug");

CREATE INDEX "collections_created_at_index"
  ON "collections"("created_at");

CREATE INDEX "collections_name_index"
  ON "collections"
  USING GIN ("name" gin_trgm_ops);

CREATE INDEX "collections_minted_timestamp_index"
    ON collections USING btree
    (minted_timestamp DESC NULLS LAST);

CREATE INDEX "collections_updated_at_id_index"
  ON "collections" ("updated_at", "id");

CREATE INDEX "collections_floor_sell_value_index"
  ON "collections" ("floor_sell_value", "id");

CREATE INDEX "collections_day1_volume_index"
  ON "collections" ("day1_volume" DESC);

CREATE INDEX "collections_day7_volume_index"
    ON "collections" ("day7_volume" DESC);

CREATE INDEX "collections_day30_volume_index"
    ON "collections" ("day30_volume" DESC);

CREATE INDEX "collections_all_time_volume_index"
  ON "collections" ("all_time_volume" DESC);

CREATE INDEX "tokens_collection_id_is_flagged_index"
  ON "tokens" ("collection_id", "is_flagged")
  INCLUDE ("token_id");

CREATE INDEX "tokens_collection_id_normalized_floor_sell_value_token_id_index"
ON "tokens" ("collection_id", "normalized_floor_sell_value", "token_id");

CREATE INDEX "token_normalized_floor_sell_events_created_at_id_index"
  ON "token_normalized_floor_sell_events"("created_at", "id");

CREATE INDEX "token_normalized_floor_sell_events_contract_created_at_id_index"
  ON "token_normalized_floor_sell_events"("contract", "created_at", "id");

CREATE INDEX "token_normalized_floor_sell_events_contract_token_id_created_at_id_index"
  ON "token_normalized_floor_sell_events"("contract", "token_id", "created_at", "id");

CREATE INDEX "tokens_contract_normalized_floor_sell_value_index"
  ON "token_normalized_floor_sell_events"("contract", "price");

CREATE INDEX "transactions_to_index"
  ON "transactions" ("to");

CREATE INDEX "nft_transfer_events_block_block_hash_index"
  ON "nft_transfer_events" ("block", "block_hash");

CREATE INDEX "nft_transfer_events_timestamp_index"
  ON "nft_transfer_events" ("timestamp" DESC);

CREATE INDEX "nft_transfer_events_address_timestamp_index"
  ON "nft_transfer_events" ("address", "timestamp" DESC);

CREATE INDEX "nft_transfer_events_address_token_id_timestamp_index"
  ON "nft_transfer_events" ("address", "token_id", "timestamp" DESC);

CREATE INDEX "ft_transfer_events_block_block_hash_index"
  ON "ft_transfer_events" ("block", "block_hash");

CREATE INDEX "token_floor_sell_events_created_at_id_index"
  ON "token_floor_sell_events"("created_at", "id");

CREATE INDEX "token_floor_sell_events_contract_created_at_id_index"
  ON "token_floor_sell_events"("contract", "created_at", "id");

CREATE INDEX "token_floor_sell_events_contract_token_id_created_at_id_index"
  ON "token_floor_sell_events"("contract", "token_id", "created_at", "id");

CREATE INDEX "collections_non_flagged_floor_sell_value_index"
ON "collections" ("non_flagged_floor_sell_value", "id");

CREATE INDEX "collection_non_flagged_floor_sell_events_created_at_id_index"
  ON "collection_non_flagged_floor_sell_events"("created_at", "id");

CREATE INDEX "collection_non_flagged_floor_sell_events_collection_id_created_at_id_index"
  ON "collection_non_flagged_floor_sell_events"("collection_id", "created_at", "id");

CREATE INDEX user_activities_address_event_timestamp_type_index
    ON user_activities (address, event_timestamp DESC NULLS LAST, type);

CREATE INDEX user_activities_address_created_at_type_index
    ON user_activities (address, created_at DESC NULLS LAST, type);

CREATE INDEX user_activities_contract_token_id_collection_id_index
    ON user_activities (contract, token_id, collection_id);

CREATE INDEX user_activities_block_hash_index
    ON user_activities (block_hash);

CREATE INDEX "bulk_cancel_events_block_block_hash_index"
  ON "bulk_cancel_events" ("block", "block_hash");

CREATE INDEX "bulk_cancel_events_order_kind_maker_min_nonce"
  ON "bulk_cancel_events" ("order_kind", "maker", "min_nonce" DESC);

CREATE INDEX "nft_balances_owner_contract_token_id_index"
  ON "nft_balances" ("owner", "contract", "token_id")
  WHERE ("amount" > 0);

CREATE INDEX "nft_balances_contract_owner_index"
  ON "nft_balances" ("contract", "owner")
  INCLUDE ("amount")
  WHERE ("amount" > 0);

CREATE INDEX "nft_balances_owner_acquired_at_index"
  ON "nft_balances" ("owner", "acquired_at" DESC)
  WHERE ("amount" > 0);

CREATE INDEX "collection_top_bid_events_created_at_id_index"
  ON "collection_top_bid_events"("created_at", "id");

CREATE INDEX "collection_top_bid_events_collection_id_created_at_id_index"
  ON "collection_top_bid_events"("collection_id", "created_at", "id");

CREATE INDEX "orders_token_set_id_side_value_maker_index"
  ON "orders" ("token_set_id", "side", "value", "maker")
  INCLUDE ("id")
  WHERE ("fillability_status" = 'fillable' AND "approval_status" = 'approved');

CREATE INDEX "orders_maker_side_token_set_id_index"
  ON "orders" ("maker", "side", "token_set_id")
  INCLUDE ("id")
  WHERE ("fillability_status" = 'fillable' OR "fillability_status" = 'no-balance');

CREATE INDEX "orders_upper_valid_between_index"
  ON "orders" (UPPER("valid_between"))
  INCLUDE ("id")
  WHERE ("fillability_status" = 'fillable' OR "fillability_status" = 'no-balance');

CREATE INDEX "orders_conduit_index"
  ON "orders" ("maker", "side", "conduit")
  WHERE ("fillability_status" = 'fillable' OR "fillability_status" = 'no-balance');

CREATE INDEX "orders_kind_maker_nonce_full_index"
  ON "orders" ("kind", "maker", "nonce")
  WHERE ("contract" IS NOT NULL);

CREATE INDEX "orders_not_expired_maker_side_created_at_id_index"
  ON "orders" ("maker", "side", "created_at" DESC, "id" DESC)
  INCLUDE ("approval_status")

CREATE INDEX "orders_dynamic_index"
  ON "orders" ("id")
  WHERE ("dynamic" AND ("fillability_status" = 'fillable' OR "fillability_status" = 'no-balance'));

CREATE INDEX "orders_side_created_at_id_index"
  ON "orders" ("side", "created_at" DESC, "id" DESC)
  WHERE ("fillability_status" = 'fillable' OR "fillability_status" = 'no-balance');

CREATE INDEX orders_side_value_source_id_int_contract_index
  ON public.orders USING btree
  (side, value ASC NULLS LAST, source_id_int ASC NULLS LAST, contract)
  WHERE fillability_status = 'fillable' AND approval_status = 'approved';

CREATE INDEX "orders_side_contract_created_at_id_index"
  ON "orders" ("side", "contract", "created_at" DESC, "id" DESC)
  WHERE ("fillability_status" = 'fillable' AND "approval_status" = 'approved');

CREATE INDEX "orders_updated_at_id_index"
  ON "orders" ("updated_at", "id");

CREATE INDEX "orders_side_contract_created_at_index"
  ON "orders" ("side", "contract", "created_at" DESC, "id" DESC);

CREATE INDEX activities_collection_id_event_timestamp_type_index
    ON activities (collection_id, event_timestamp DESC NULLS LAST, type);

CREATE INDEX activities_contract_token_id_event_timestamp_type_index
    ON activities (contract, token_id, event_timestamp DESC NULLS LAST, type);

CREATE INDEX activities_collection_id_created_at_type_index
    ON activities (collection_id, created_at DESC NULLS LAST, type);

CREATE INDEX activities_contract_token_id_created_at_type_index
    ON activities (contract, token_id, created_at DESC NULLS LAST, type);

CREATE INDEX activities_block_hash_index
    ON activities (block_hash);

CREATE INDEX activities_event_timestamp_index
  ON activities (event_timestamp DESC);

CREATE INDEX "fill_events_2_updated_at_tx_hash_index"
  ON "fill_events_2" ("updated_at", "tx_hash", "log_index", "batch_index");

