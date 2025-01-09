import React, { useState, useMemo } from "react";
import ButtonChoice from "./ButtonChoice";
import "./Face.scss";
import ColorPalette from "./ColorPalette";
import InputRange from "./InputRange";

import translation from "../../../translation";

interface FaceProps {
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
  CONFIG: any;
}

const FaceComponent: React.FC<FaceProps> = ({ data, onChange, CONFIG }) => {
  const selectedConfig = CONFIG[data.selectedType];  

  return (
    <div className="face__component">
      <ButtonChoice
        title={translation["face"]["select_cat"]}
        defaultValue={data.selectedType}
        buttonChoice={[
          { type: "nose", label: translation["face"]["nose"], logo: "../images/buttons/nose.svg" },
          { type: "chin", label: translation["face"]["chin"], logo: "../images/buttons/chin.svg" },
          { type: "jaw", label: translation["face"]["jaw"], logo: "../images/buttons/jaw.svg" },
          {
            type: "cheeks",
            label: translation["face"]["cheeks"],
            logo: "../images/buttons/cheeks.svg",
          },
          {
            type: "eyes",
            label: translation["face"]["eyes"],
            logo: "../images/buttons/eyes.svg",
            iconsSize: 50,
          },
        ]}
        changeChoice={(value) => onChange("selectedType", value, null)}
      />

      {selectedConfig.ranges.map((range: any) => (
        <InputRange
          key={range.type}
          type={range.type}
          title={range.title}
          defaultValue={range.value}
          min={range.min}
          max={range.max}
          onChange={(index, type) => onChange(type, index, 'ranges')}
        />
      ))}

      {selectedConfig.palettes.map((palette: any) => (
        <ColorPalette
          key={palette.type}
          type={palette.type}
          title={palette.title}
          handleFunct={(index, type) => onChange(type, index, 'palettes')}
        />
      ))}
    </div>
  );
};

export default FaceComponent;
