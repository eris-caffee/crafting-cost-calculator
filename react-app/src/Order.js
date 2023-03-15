import React, { useState } from 'react';
import { v4 as uuidv4 } from 'uuid';
//import { string } from 'prop-types';
import CraftDatabase from './CraftDatabase';

import ItemList from './ItemList';
import OrderResult from './OrderResult';

const propTypes = {
};

const Order = ({
    ...props
}) => {

    const getDbData = () => {
        let dbData = new CraftDatabase();
        console.log("fetching db data");
        dbData.getAllData();
        return dbData;
    };

    const id = uuidv4();
    const [db] = useState(getDbData);
    const [itemData, setItemData] = useState([]);
    const [nextItemKey, setNextItemKey] = useState(1);
    const [orderResult, setOrderResult] = useState({ items: [], total: 0 });


    const handleAddNewItem = () => {

        let newItem = {
            key: nextItemKey,
            item_type_id: db.itemTypeData[0].id,
            armor_type_id: db.armorTypeData[0].id,
            set_id: db.setData[0].id,
            motif_id: db.motifData.filter( item => item.name === "Breton")[0].id,
            trait_id: db.traitData[db.itemTypeData[0].id][0].id,
            item_id: db.itemData[db.itemTypeData[0].id][0].id,
            showArmorType: db.itemTypeData[0].name === "Armor",
            showMotif: db.itemTypeData[0].name !== "Jewelry",
        };

        let newItems = itemData;
        newItems.push(newItem);
        setItemData(newItems);
        setNextItemKey(nextItemKey + 1);
    };
    console.log(db.motifData.filter(item => item.name === "Breton"));
    const handleItemChange = (key, field, id) => {
        const newItems = itemData.map((item) => {
            if (item.key === key) {
                item[field] = id;
                const type_data = db.itemTypeData.find((type) => type.id === item.item_type_id);
                item.showArmorType = type_data.name === "Armor";
                item.showMotif = type_data.name !== "Jewelry";

                if (field === 'item_type_id') {
                    item.item_id = db.itemData[type_data.id][0].id;
                    item.trait_id = db.traitData[type_data.id][0].id;
                }
            }
            return item;
        });
        setItemData(newItems);
    };

    const handleItemDelete = (key) => {
        setItemData(itemData.filter(item => item.key!== key));
    };

    const handleOrderSubmitSuccess = (order_result) => {
        console.log("order result ",order_result);
        if (order_result !== undefined) {
            setOrderResult(order_result);
        }
    };

    const submitOrder = () => {
        let order = {
            items: itemData.map((item) => {
                return {
                    item_id: item.item_id,
                    item_type_id: item.item_type_id,
                    trait_id: item.trait_id,
                    motif_id: item.motif_id,
                    set_id: item.set_id,
                }
             }),
        }
        db.submitOrder(order, handleOrderSubmitSuccess);
    };

    return (
        <>
            <div className="Order" id={id}>
                <h2>Your Order</h2>
                <button onClick={submitOrder}>Submit Order</button>
                <ItemList
                    itemData={itemData}
                    dbData={db}
                    onNewItemClick={handleAddNewItem}
                    onItemChange={handleItemChange}
                    onItemDelete={handleItemDelete}
                />
            </div>
            <hr />
            <div className="OrderResult">
                <h2>Prices</h2>
                <OrderResult dbData={db} orderData={orderResult} />
            </div>
        </>
    );
};

Order.propTypes = propTypes;
export default Order;
