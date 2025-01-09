import React from "react";
import "./ItemList.scss";

interface Item {
    id: string;
    type: string;
}

interface ItemListProps {
    title: string;
    items: Item[];
    onItemSelect: (id: string, type: string) => void;
}

const ItemList: React.FC<ItemListProps> = ({ title, items, onItemSelect }) => {
    const handleItemClick = (id: string, type: string) => {
        onItemSelect(id, type);
    };

    return (
        <div className="item__list_container">
            <div className="title">{title}</div>
            <div className="item__list__container_wrapper">
                {items.map(item => (
                    <div
                        key={item.id}
                        className='item__list_item'
                        onClick={() => handleItemClick(item.id, item.type)}
                    >
                        <img src={`../images/${item.type}/${item.id}.png`} alt="" />
                    </div>
                ))}
            </div>
        </div>
    );
}

export default ItemList;
