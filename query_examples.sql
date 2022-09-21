
-- Get costs for an Infused Jerkin

select
items.name as item,
items.num_materials as number_materials,
crafting_types.name as crafting_skill,
item_types.name as item_type,
armor_types.name as armor_type,
(select
        items.num_materials * materials.cost
        from
        items
        inner join materials on items.material_id = materials.id
        where
        items.name = 'Jerkin') as material_cost,
(select
        materials.cost from traits
        inner join materials on traits.material_id = materials.id
        inner join item_types on item_types.id = traits.item_type_id
        where
        traits.name = 'Infused'
        and item_types.name = 'Armor'
        ) as trait_cost

from
items
inner join item_types on items.item_type_id = item_types.id
inner join crafting_types on items.crafting_type_id = crafting_types.id
inner join armor_types on items.armor_type_id = armor_types.id
inner join traits on traits.item_type_id = items.item_type_id

where
items.name = 'Jerkin'
and traits.name = 'Infused';

