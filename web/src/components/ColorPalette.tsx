import React, { useState } from "react";
import "./ColorPalette.scss";

interface ColorPaletteProps {
  type: string;
  title: string;
  handleFunct: (index: number, type: string) => void;
}

const ColorPaletteComponent: React.FC<ColorPaletteProps> = ({ type, title, handleFunct }) => {
  const [selectedColorIndex, setSelectedColorIndex] = useState<number | null>(null);
  const [isDragging, setIsDragging] = useState<boolean>(false);
  const [scrollStartX, setScrollStartX] = useState<number>(0);
  const [scrollLeftStart, setScrollLeftStart] = useState<number>(0);

  const colors = [
    "linear-gradient(rgb(28, 31, 33) 0%, rgb(28, 31, 33) 100%)", 
    "linear-gradient(rgb(39, 42, 44) 0%, rgb(39, 42, 44) 100%)", 
    "linear-gradient(rgb(49, 46, 44) 0%, rgb(49, 46, 44) 100%)", 
    "linear-gradient(rgb(53, 38, 28) 0%, rgb(53, 38, 28) 100%)", 
    "linear-gradient(rgb(75, 50, 31) 0%, rgb(75, 50, 31) 100%)", 
    "linear-gradient(rgb(92, 59, 36) 0%, rgb(92, 59, 36) 100%)", 
    "linear-gradient(rgb(109, 76, 53) 0%, rgb(109, 76, 53) 100%)", 
    "linear-gradient(rgb(107, 80, 59) 0%, rgb(107, 80, 59) 100%)", 
    "linear-gradient(rgb(118, 92, 69) 0%, rgb(118, 92, 69) 100%)", 
    "linear-gradient(rgb(127, 104, 78) 0%, rgb(127, 104, 78) 100%)",
    "linear-gradient(rgb(153, 129, 93) 0%, rgb(153, 129, 93) 100%)", 
    "linear-gradient(rgb(167, 147, 105) 0%, rgb(167, 147, 105) 100%)", 
    "linear-gradient(rgb(175, 156, 112) 0%, rgb(175, 156, 112) 100%)", 
    "linear-gradient(rgb(187, 160, 99) 0%, rgb(187, 160, 99) 100%)", 
    "linear-gradient(rgb(214, 185, 123) 0%, rgb(214, 185, 123) 100%)", 
    "linear-gradient(rgb(218, 195, 142) 0%, rgb(218, 195, 142) 100%)", 
    "linear-gradient(rgb(159, 127, 89) 0%, rgb(159, 127, 89) 100%)", 
    "linear-gradient(rgb(132, 80, 57) 0%, rgb(132, 80, 57) 100%)", 
    "linear-gradient(rgb(104, 43, 31) 0%, rgb(104, 43, 31) 100%)", 
    "linear-gradient(rgb(97, 18, 12) 0%, rgb(97, 18, 12) 100%)", 
    "linear-gradient(rgb(100, 15, 10) 0%, rgb(100, 15, 10) 100%)", 
    "linear-gradient(rgb(124, 20, 15) 0%, rgb(124, 20, 15) 100%)", 
    "linear-gradient(rgb(160, 46, 25) 0%, rgb(160, 46, 25) 100%)", 
    "linear-gradient(rgb(182, 75, 40) 0%, rgb(182, 75, 40) 100%)", 
    "linear-gradient(rgb(162, 80, 47) 0%, rgb(162, 80, 47) 100%)", 
    "linear-gradient(rgb(170, 78, 43) 0%, rgb(170, 78, 43) 100%)",
    "linear-gradient(rgb(98, 98, 98) 0%, rgb(98, 98, 98) 100%)",
    "linear-gradient(rgb(128, 128, 128) 0%, rgb(128, 128, 128) 100%)",
    "linear-gradient(rgb(170, 170, 170) 0%, rgb(170, 170, 170) 100%)",
    "linear-gradient(rgb(197, 197, 197) 0%, rgb(197, 197, 197) 100%)",
    "linear-gradient(rgb(70, 57, 85) 0%, rgb(70, 57, 85) 100%)",
    "linear-gradient(rgb(90, 63, 107) 0%, rgb(90, 63, 107) 100%)",
    "linear-gradient(rgb(118, 60, 118) 0%, rgb(118, 60, 118) 100%)",
    "linear-gradient(rgb(237, 116, 227) 0%, rgb(237, 116, 227) 100%)",
    "linear-gradient(rgb(235, 75, 147) 0%, rgb(235, 75, 147) 100%)",
    "linear-gradient(rgb(242, 153, 188) 0%, rgb(242, 153, 188) 100%)", 
    "linear-gradient(rgb(4, 149, 158) 0%, rgb(4, 149, 158) 100%)", 
    "linear-gradient(rgb(2, 95, 134) 0%, rgb(2, 95, 134) 100%)", 
    "linear-gradient(rgb(2, 57, 116) 0%, rgb(2, 57, 116) 100%)", 
    "linear-gradient(rgb(63, 161, 106) 0%, rgb(63, 161, 106) 100%)",
    "linear-gradient(rgb(33, 124, 97) 0%, rgb(33, 124, 97) 100%)", 
    "linear-gradient(rgb(24, 92, 85) 0%, rgb(24, 92, 85) 100%)", 
    "linear-gradient(rgb(182, 192, 52) 0%, rgb(182, 192, 52) 100%)",
    "linear-gradient(rgb(112, 169, 11) 0%, rgb(112, 169, 11) 100%)", 
    "linear-gradient(rgb(67, 157, 19) 0%, rgb(67, 157, 19) 100%)",
    "linear-gradient(rgb(220, 184, 87) 0%, rgb(220, 184, 87) 100%)",
    "linear-gradient(rgb(229, 177, 3) 0%, rgb(229, 177, 3) 100%)", 
    "linear-gradient(rgb(230, 145, 2) 0%, rgb(230, 145, 2) 100%)",
    "linear-gradient(rgb(242, 136, 49) 0%, rgb(242, 136, 49) 100%)",
    "linear-gradient(rgb(251, 128, 87) 0%, rgb(251, 128, 87) 100%)", 
    "linear-gradient(rgb(226, 139, 88) 0%, rgb(226, 139, 88) 100%)", 
    "linear-gradient(rgb(209, 89, 60) 0%, rgb(209, 89, 60) 100%)", 
    "linear-gradient(rgb(206, 49, 32) 0%, rgb(206, 49, 32) 100%)", 
    "linear-gradient(rgb(173, 9, 3) 0%, rgb(173, 9, 3) 100%)", 
    "linear-gradient(rgb(136, 3, 2) 0%, rgb(136, 3, 2) 100%)", 
    "linear-gradient(rgb(31, 24, 20) 0%, rgb(31, 24, 20) 100%)", 
    "linear-gradient(rgb(41, 31, 25) 0%, rgb(41, 31, 25) 100%)", 
    "linear-gradient(rgb(46, 34, 27) 0%, rgb(46, 34, 27) 100%)", 
    "linear-gradient(rgb(55, 41, 30) 0%, rgb(55, 41, 30) 100%)", 
    "linear-gradient(rgb(46, 34, 24) 0%, rgb(46, 34, 24) 100%)", 
    "linear-gradient(rgb(35, 27, 21) 0%, rgb(35, 27, 21) 100%)", 
    "linear-gradient(rgb(2, 2, 2) 0%, rgb(2, 2, 2) 100%)", 
    "linear-gradient(rgb(112, 108, 102) 0%, rgb(112, 108, 102) 100%)", 
    "linear-gradient(rgb(157, 122, 80) 0%, rgb(157, 122, 80) 100%)" 
  ];

  const handleClick = (index: number) => {
    if (!isDragging) {
      setSelectedColorIndex(index);
      handleFunct(index, type);
    }
  };

  const dragStart = (ev: React.PointerEvent) => {
    const target = ev.currentTarget as HTMLDivElement;
    setIsDragging(true);
    setScrollStartX(ev.clientX);
    setScrollLeftStart(target.scrollLeft);
  };

  const dragEnd = () => {
    setIsDragging(false);
  };

  const drag = (ev: React.PointerEvent) => {
    if (isDragging) {
      const target = ev.currentTarget as HTMLDivElement;
      const scrollDistance = ev.clientX - scrollStartX;
      target.scrollLeft = scrollLeftStart - scrollDistance;
    }
  };

  return (
    <div className="color__palette__container">
      <div className="title">{title}</div>
      <div
        className="color__palette__wrapper"
        style={{ cursor: 'auto' }}
        onPointerDown={dragStart}
        onPointerUp={dragEnd}
        onPointerMove={drag}
      >
        {colors.map((color, index) => (
          <div
            key={index}
            className={`citem ${selectedColorIndex === index ? "selected" : ""}`}
            style={{ background: color }}
            onClick={() => handleClick(index)}
          ></div>
        ))}
      </div>
    </div>
  );
};

export default ColorPaletteComponent;