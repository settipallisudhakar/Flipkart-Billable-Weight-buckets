

insert overwrite table profiler_weight_volume_fsn_estimate_l1_hive_fact
select
first_product_id as product_id,
percentile(cast(shipment_dead_weight as int),0.5) as median_fsn_dead_weight,
percentile(cast(profiled_volume_in_gms as int),0.5) as median_fsn_vol_weight
from
bigfoot_external_neo.scp_ekl__profiler_weight_volume_estimate_l0_hive_fact
group by first_product_id;