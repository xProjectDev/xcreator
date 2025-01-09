import React, { useState, useEffect } from "react";
import "./VisageSelection.scss";

import translation from "../../../translation";

interface VisageSelectionItem {
  id: number;
  nom: string;
  extension: string;
  type: string;
  selected: boolean;
}

interface VisageSelectionProps {
  title: string;
  data: VisageSelectionItem[];
  onChangeParent: (item: VisageSelectionItem) => void;
}

const VisageSelection: React.FC<VisageSelectionProps> = ({
  title,
  data,
  onChangeParent,
}) => {
  const handleClick = (item: VisageSelectionItem) => {
    if (item) onChangeParent(item);
  };

  return (
    <div className="visage__container">
      <div className="title">{translation["parents"]["faceof"]} {title}</div>
      <div className="visage__container_wrapper">
        {data.map((item) => (
          <div
            key={item.id}
            onClick={() => handleClick(item)}
            className={`visage__item ${item.selected ? "selected" : ""}`}
          >
            <img
              src={`../images/parents/${item.nom}.${item.extension}`}
              alt={item.nom}
            />
          </div>
        ))}
      </div>
    </div>
  );
};

export default VisageSelection;
