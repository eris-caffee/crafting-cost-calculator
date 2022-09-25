
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



SELECT items.id, 
       items.name, 
       items.num_materials, 
       items.material_id, 
       materials.name AS material_name, 
       items.item_type_id, 
       item_types.name AS item_type_name, 
       items.crafting_type_id, 
       crafting_types.name AS crafting_type_name, 
       items.armor_type_id, 
       armor_types.name AS armor_type_name 
FROM items 
     INNER JOIN materials ON items.material_id = materials.id 
     INNER JOIN item_types ON items.item_type_id = item_types.id 
     LEFT JOIN armor_types ON items.armor_type_id = armor_types.id 
     INNER JOIN crafting_types ON items.crafting_type_id = crafting_types.id 
WHERE items.item_type_id = 1;
