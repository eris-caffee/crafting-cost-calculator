import React, { useState } from 'react';
import { v4 as uuidv4 } from 'uuid';
//import { string } from 'prop-types';
import DBData from './DBData';

import ItemList from './ItemList';
const propTypes = {
};

const Order = ({
    ...props
}) => {

    const getDbData = () => {
        let dbData = new DBData();
        dbData.getAllData();
        return dbData;
    };

    const id = uuidv4();
    const [dbData] = useState(getDbData);
    const [itemData, setItemData] = useState([]);
    const [nextItemKey, setNextItemKey] = useState(1);


    const handleAddNewItem = () => {

        let newItem = {
            key: nextItemKey,
            item_type_id: dbData.itemTypeData[0].id,
            armor_type_id: dbData.armorTypeData[0].id,
            set_id: dbData.setData[0].id,
            motif_id: dbData.motifData[0].id,
            trait_id: dbData.traitData[dbData.itemTypeData[0].id][0].id,
            item_id: dbData.itemData[dbData.itemTypeData[0].id][0].id,
            showArmorType: dbData.itemTypeData[0].name === "Armor",
            showMotif: dbData.itemTypeData[0].name !== "Jewelry",
        };

        let newItems = itemData;
        newItems.push(newItem);
        setItemData(newItems);
        setNextItemKey(nextItemKey + 1);
    };

    return (
        <div className="Order" id={id}>
            <h2>Your Order</h2>
            <ItemList itemData={itemData} dbData={dbData} onNewItemClick={handleAddNewItem} />
        </div>
    );
};

Order.propTypes = propTypes;
export default Order;
