import React from "react";
import "./InputText.scss"

interface InputTextProps {
    type?: string;
    title: string;
    placeholder: string;
    value: string;
    changeValue: (value: string) => void;
}

const InputText: React.FC<InputTextProps> = ({ type="default", title, placeholder, value, changeValue }) => {
    return (
        <>
            <div className="input__text_container">
                <div className="title">{title}</div>
                <input style={{width: type === "date" ? "120px" : "100%"}} type={type} value={value} className="input__text" placeholder={placeholder} onInput={(e) => changeValue(e.target.value)} />
            </div>
        </>
    )
}

export default InputText;