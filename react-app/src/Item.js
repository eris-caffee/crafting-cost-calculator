import React from 'react'
import { bool, number, object, shape } from 'prop-types';

import Selector from './Selector';

const propTypes = {
    item: shape({
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
    dbData: object.isRequired,
}

const Item = ({
    item,
    dbData,
    ...props
}) => {

    const onItemTypeChange = (id) => {
    };

    const onArmorTypeChange = (id) => {
    };

    const onSetChange= (id) => {
    };

    const onMotifChange = ( id ) => {
    };

    const onTraitChange = ( id ) => {
    };

    const onItemChange = (id) => {
    };

    return (
        <div className="Item" >
            <Selector
                name="Item Type"
                onValueChange={onItemTypeChange}
                data={dbData.itemTypeData}
            />
            {item.showArmorType &&
                <Selector
                    name="Armor Type"
                    onValueChange={onArmorTypeChange}
                    data={dbData.armorTypeData}
                />}
            <Selector
                name="Item"
                onValueChange={onItemChange}
                data={dbData.itemData[item.item_type_id]}
            />
            <Selector
                name="Trait"
                onValueChange={onTraitChange}
                data={dbData.traitData[item.item_type_id]}
            />
            <Selector
                name="Set"
                onValueChange={onSetChange}
                data={dbData.setData}
            />
            {item.showMotif &&
                <Selector
                    name="Motif"
                    onValueChange={onMotifChange}
                    data={dbData.motifData}
                />}
        </div>
    );
};

Item.propTypes = propTypes;
export default Item;
