insert overwrite table profiler_weight_volume_estimate_l0_hive_fact
select distinct
a.vendor_tracking_id,
a.shipment_id,
a.profiled_volume_in_gms,
a.shipment_dead_weight,
a.first_product_id,
b.analytic_vertical,
b.analytic_super_category,
b.analytic_sub_category,
b.analytic_category
from bigfoot_external_neo.scp_ekl__profiler_weight_volume_l0_hive_fact a
inner join bigfoot_external_neo.sp_product__product_categorization_hive_dim b
on a.first_product_id = b.product_id
where seller_type = 'Non-FA'
and profiled_volume_in_gms is not null
and shipment_dead_weight is not null
and no_of_items = 1
--quant filter
and first_item_quantity = 1
and shipment_dead_weight < 30000
and profiled_volume_in_gms < 30000
and a.profiled_date_key > 20160116;