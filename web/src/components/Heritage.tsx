import React from "react";
import VisageSelection from "./VisageSelection";
import ButtonChoice from "./ButtonChoice";
import InputRange from "./InputRange";
import "./Heritage.scss";
import translation from "../../../translation";
import { fetchNui } from "../utils/fetchNui";


interface HeritageProps {
  selectedChoice: string;
  selectedParents: Array<{ id: number; nom: string; extension: string; type: string; selected: boolean }>;
  selectedParentsItem: { dad: any; mom: any };
  handleChoiceChange: (choice: string) => void;
  onChangeParent: (item: any) => void;
}

const HeritageComponent: React.FC<HeritageProps> = ({
  selectedChoice,
  selectedParents,
  selectedParentsItem,
  handleChoiceChange,
  onChangeParent
}) => {
  const buttonChoice = [
    { type: "dad", label: translation["parents"]["dad"], logo: "../images/buttons/dad.svg" },
    { type: "mom", label: translation["parents"]["mom"], logo: "../images/buttons/mom.svg" },
  ]

  function getLabelByType(type: string): string {
    const button = buttonChoice.find(item => item.type === type);
    return button ? button.label : ""
  }

  return (
    <div className="heritage__component">
      <ButtonChoice
        title={translation["parents"]["parents"]}
        defaultValue={selectedChoice}
        buttonChoice={buttonChoice}
        changeChoice={handleChoiceChange}
      />
      <VisageSelection
        title={getLabelByType(selectedChoice)}
        data={selectedParents}
        onChangeParent={onChangeParent}
      />
      <InputRange
        type="skin_md_weight"
        title={translation["parents"]["skin"]}
        min={0}
        max={100}
        defaultValue={0}
        onChange={(value) => {
          fetchNui("change", {
            type: "skin_md_weight",
            new: value
          })
        }}
      />
      <InputRange
        type="face_md_weight"
        title={translation["parents"]["heritage"]}
        min={0}
        max={100}
        defaultValue={0}
        onChange={(value) => {
          fetchNui("change", {
            type: "face_md_weight",
            new: value
          })
        }}
      />
    </div>
  );
};

export default HeritageComponent;
