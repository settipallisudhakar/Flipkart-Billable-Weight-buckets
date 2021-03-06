insert overwrite table profiler_weight_volume_category_estimate_l1_hive_fact
select
analytic_category,
percentile(cast(shipment_dead_weight as int),0.5) as median_category_dead_weight,
percentile(cast(profiled_volume_in_gms as int),0.5) as median_category_vol_weight
from
bigfoot_external_neo.scp_ekl__profiler_weight_volume_estimate_l0_hive_fact
group by analytic_category;