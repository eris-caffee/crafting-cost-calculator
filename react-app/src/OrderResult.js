import React from 'react';
import { arrayOf, number, object, shape, } from 'prop-types';

const propTypes = {
    dbData: object.isRequired,
    orderData: shape({
        items: arrayOf(shape({
            item_id: number.isRequired,
            set_id: number.isRequired,
            motif_id: number.isRequired,
            trait_id: number.isRequired,
            price: number.isRequired,
        
        })).isRequired,
        total: number.isRequired,
    }).isRequired,
};

const OrderResult = ({
    dbData,
    orderData,
}) => {
    console.log(orderData);
    
    const get_item_name = (item_id) => {
        let item_name = 'no item';
        dbData.itemData.forEach(item_type => {
            item_type.forEach(item => {
                if (item.id === item_id) { item_name = item.name; }
            })
        });
        return item_name;
    };

    const get_trait_name = (trait_id) => {
        let trait_name = 'no trait';
        dbData.traitData.forEach(trait_type => {
            trait_type.forEach(trait => {
                if (trait.id === trait_id) { trait_name = trait.name; }
            })
        });
        return trait_name;
    };

    const get_set_name = (set_id) => {
        let set_name = 'no set';
        dbData.setData.forEach(set => {
            if (set.id === set_id) { set_name = set.name; }
        });
        return set_name;
    };

    const get_motif_name = (motif_id) => {
        let motif_name = 'no motif';
        dbData.motifData.forEach(motif => {
            if (motif.id === motif_id) { motif_name = motif.name; }
        });
        return motif_name;
    };

    return (
        <div className="order-result">
            {
                orderData.items.map((item, index) => (
                    <p>{get_item_name(item.item_id) + " with trait " + get_trait_name(item.trait_id) + " from set " + get_set_name(item.set_id) + " in " + get_motif_name(item.motif_id) + " style: " + (Math.round(item.price * 10)/10).toFixed(0)}</p>
                ))
            }
            <p>Total: {(Math.round(orderData.total * 10)/10).toFixed(0)}</p>
        </div>
    )
};


OrderResult.propTypes = propTypes;
export default OrderResult;
