import React from "react";
import ButtonChoice from "./ButtonChoice";
import "./Clothes.scss";
import ItemList from "./ItemList";
import InputRange from "./InputRange";
import { fetchNui } from "../utils/fetchNui";

interface ClothesProps {
  data: {
    selectedType: string;
    selectedTexture: number;
  };
  onChange: (type: string) => void;
  CONFIG: any;
}

const ClothesComponent: React.FC<ClothesProps> = ({
  data,
  onChange,
  CONFIG,
}) => {
  const transformSelectedType = (cara: string): string => {
    const type = cara;

    if (type === 'arms') {
      return type + "_2";
    }
    return type.endsWith('_1') ? type.replace('_1', '_2') : type;
  };
  const transformedType = transformSelectedType(data.selectedType);

  const generateItems = (max: number, type: string) => {
    return Array.from({ length: max + 1 }, (_, index) => ({
      id: index.toString(),
      type: type
    }));
  };

  return (
    <div className="clothes__component">
      <ButtonChoice
        title="Select type of clothes"
        buttonChoice={[
          {
            type: "pants_1",
            label: "Pants",
            logo: "../images/buttons/pants.svg",
          },
          { type: "arms", label: "Arms", logo: "../images/buttons/arms.svg" },
          {
            type: "tshirt_1",
            label: "T-Shirt",
            logo: "../images/buttons/tshirt.svg",
          },
          {
            type: "torso_1",
            label: "Torso",
            logo: "../images/buttons/torso.svg",
          },
          {
            type: "shoes_1",
            label: "Shoes",
            logo: "../images/buttons/shoes.svg",
          },
        ]}
        changeChoice={(value) => {onChange(value), fetchNui("change_camera", {type: value})}}
      />
      <ItemList
        title="Select your variation :"
        items={generateItems(CONFIG[data.selectedType].max, data.selectedType)}
        onItemSelect={(id, type) => fetchNui("change", {
          type: type,
          new: parseInt(id)
        })}
      />
      <InputRange
        type={transformedType}
        title="Texture"
        defaultValue={CONFIG[transformedType].value}
        min={CONFIG[transformedType].min}
        max={CONFIG[transformedType].max}
        onChange={(value, type) => fetchNui("change", {
          type: type,
          new: value
        })}
      />
    </div>
  );
};

export default ClothesComponent;
