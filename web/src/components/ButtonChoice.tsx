import React, { useState } from "react";
import "./ButtonChoice.scss";

interface ButtonChoiceItem {
    type: string;
    label: string;
    logo: string;
    iconsSize?: number;
}

interface ButtonChoiceProps {
    title: string;
    defaultValue?: string;
    buttonChoice: ButtonChoiceItem[];
    changeChoice: (value: string) => void;
}

const ButtonChoice: React.FC<ButtonChoiceProps> = ({ title, defaultValue, buttonChoice, changeChoice }) => {
    const [selectedType, setSelectedType] = useState<string>(defaultValue || buttonChoice[0].type);

    const handleClick = (type: string) => {
        setSelectedType(type);
        changeChoice(type);
    };

    return (
        <>
            <div className="button-choice-container-principal">
                <div className="title">{title}</div>
                <div className="button-choice-container">
                    {buttonChoice.map((item) => (
                        <button
                            key={item.type}
                            className={`button-choice-item ${selectedType === item.type ? 'selected' : ''}`}
                            onClick={() => handleClick(item.type)}
                        >
                            <img src={item.logo} alt={`${item.label} logo`} className="button-logo" />
                            <span>{item.label}</span>
                        </button>
                    ))}
                </div>
            </div>
        </>
    );
};

export default ButtonChoice;
