import React from "react";
import "./ContextMenu.scss";

import translation from "../../../translation";

interface ContextMenuProps {
    options: string[];
    selectedOption: string;
    onSelect: (selectedOption: string) => void;
}

const ContextMenu: React.FC<ContextMenuProps> = ({ options, selectedOption, onSelect }) => {
    const handleSelectChange = (event: React.ChangeEvent<HTMLSelectElement>) => {
        const selectedValue = event.target.value;
        onSelect(selectedValue);
    }

    return (
        <div className="context-menu">
            <div className="title">{translation["disease"]["blood_group"]}</div>
            <select 
                className="select-input" 
                value={selectedOption}
                onChange={handleSelectChange}
            >
                {options.map((option, index) => (
                    <option key={index} value={option}>
                        {option}
                    </option>
                ))}
            </select>
        </div>
    );
};

export default ContextMenu;
