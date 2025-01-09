import React, { useState, useEffect, useRef } from "react";
import "./InputRange.scss";

interface InputRangeProps {
    type: string;
    title: string;
    defaultValue: number;
    min: number;
    max: number;
    onChange: (value: number, type: string) => void;
}

const InputRange: React.FC<InputRangeProps> = ({ type, title, max, min, defaultValue, onChange }) => {
    const [value, setValue] = useState<number>(defaultValue);
    const rangeRef = useRef<HTMLInputElement>(null);

    const resetValue = () => {
        setValue(min);
        onChange(min, type);
    };

    useEffect(() => {
        resetValue();
    }, [type]);

    useEffect(() => {
        if (rangeRef.current) {
            const range = rangeRef.current;
            const min = Number(range.min);
            const max = Number(range.max);
            const value = Number(range.value);
            range.style.backgroundSize = ((value - min) * 100) / (max - min) + "% 100%";
        }
    }, [value]);

    const handleInput = (e: React.ChangeEvent<HTMLInputElement>) => {
        const newValue = Number(e.target.value);
        setValue(newValue);
        onChange(newValue, type);
    };

    return (
        <div className="input__range_container">
            <div className="title">{title}</div>
            <div className="input__range">
                <input
                    type="range"
                    className="input__range_item"
                    min={min}
                    max={max}
                    value={value}
                    onChange={handleInput}
                    ref={rangeRef}
                />
            </div>
        </div>
    );
};

export default InputRange;
