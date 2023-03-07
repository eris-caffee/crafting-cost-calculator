import React from 'react'
import { bool, func, number, object, shape } from 'prop-types';

import Selector from './Selector';

const propTypes = {
    itemData: shape({
        key: number.isRequired,
        item_type_id: number.isRequired,
        armor_type_id: number.isRequired,
        set_id: number.isRequired,
        motif_id: number.isRequired,
        trait_id: number.isRequired,
        item_id: number.isRequired,
        showArmorType: bool.isRequired,
        showMotif: bool.isRequired,
    }).isRequired,
    onItemDataChange: func.isRequired,
    onItemDelete: func.isRequired,
    dbData: object.isRequired,
}

const Item = ({
    itemData,
    onItemDataChange,
    onItemDelete,
    dbData,
    ...props
}) => {

    const handleItemTypeChange = (id) => {
        onItemDataChange(itemData.key, 'item_type_id', id);
    };

    const handleArmorTypeChange = (id) => {
        onItemDataChange(itemData.key, 'armor_type_id', id);
    };

    const handleSetChange= (id) => {
        onItemDataChange(itemData.key, 'set_id', id);
    };

    const handleMotifChange = ( id ) => {
        onItemDataChange(itemData.key, 'motif_id', id);
    };

    const handleTraitChange = ( id ) => {
        onItemDataChange(itemData.key, 'trait_id', id);
    };

    const handleItemChange = (id) => {
        onItemDataChange(itemData.key, 'item_id', id);
    };

    return (
        <div className="Item" >
            <Selector
                name="Item Type"
                onValueChange={handleItemTypeChange}
                data={dbData.itemTypeData}
            />
            {itemData.showArmorType &&
                <Selector
                    name="Armor Type"
                    onValueChange={handleArmorTypeChange}
                    data={dbData.armorTypeData}
                />}
            <Selector
                name="Item"
                onValueChange={handleItemChange}
                data={dbData.itemData[itemData.item_type_id]}
            />
            <Selector
                name="Trait"
                onValueChange={handleTraitChange}
                data={dbData.traitData[itemData.item_type_id]}
            />
            <Selector
                name="Set"
                onValueChange={handleSetChange}
                data={dbData.setData}
            />
            {itemData.showMotif &&
                <Selector
                    name="Motif"
                    onValueChange={handleMotifChange}
                    data={dbData.motifData}
                />}
            <div>
                <h6>&nbsp;</h6>
                <button onClick={() => onItemDelete(itemData.key)}>Delete</button>
            </div>
        </div>
    );
};

Item.propTypes = propTypes;
export default Item;
