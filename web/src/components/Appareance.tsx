import React, { useState, useMemo } from "react";
import ButtonChoice from "./ButtonChoice";
import "./Appareance.scss";
import ItemList from "./ItemList";
import ColorPalette from "./ColorPalette";
import InputRange from "./InputRange";

import translation from "../../../translation";
import { fetchNui } from "../utils/fetchNui";

interface AppareanceProps {
  data: {
    selectedType: string;
    ranges: Record<string, any>;
    palettes: Record<string, any>;
  };
  onChange: (
    type: string,
    value: any,
    category: "ranges" | "palettes" | null
  ) => void;

  CONFIG: any
}

const AppareanceComponent: React.FC<AppareanceProps> = ({ data, onChange, CONFIG }) => {
  const selectedConfig = CONFIG[data.selectedType];
  const generateItems = (max: number, type: string) => {
    return Array.from({ length: max + 1 }, (_, index) => ({
      id: index.toString(),
      type: type
    }));
  };

  return (
    <div className="appareance__component">
      <ButtonChoice
        title="Select category"
        buttonChoice={[
          { type: "hair_1", label: translation["appearance"]["hair"], logo: "../images/buttons/hair.svg" },
          {
            type: "beard_1",
            label: translation["appearance"]["beard"],
            logo: "../images/buttons/beard.svg",
          },
          {
            type: "eyebrows_1",
            label: translation["appearance"]["eyebrows"],
            logo: "../images/buttons/eyebrows.svg",
          },
          { type: "makeup_1", label: translation["appearance"]["makeup"], logo: "../images/makeup.svg" },
        ]}
        defaultValue={data.selectedType}
        changeChoice={(value) => onChange("selectedType", value, null)}
      />

      <ItemList
        title={translation["appearance"]["select_variation"]}
        items={generateItems(selectedConfig.max, data.selectedType)}
        onItemSelect={(id, type) => fetchNui("change", {
          type: type,
          new: parseInt(id)
        })}
      />

      {selectedConfig.ranges.map((range: any) => (
        <InputRange
          key={range.type}
          type={range.type}
          title={range.title}
          defaultValue={range.value}
          min={range.min}
          max={range.max}
          onChange={(value, type) => onChange(type, value, "ranges")}
        />
      ))}

      {selectedConfig.palettes.map((palette: any) => (
        <ColorPalette
          key={palette.type}
          type={palette.type}
          title={palette.title}
          handleFunct={(index, type) => onChange(type, index, "palettes")}
        />
      ))}
    </div>
  );
};

export default AppareanceComponent;
