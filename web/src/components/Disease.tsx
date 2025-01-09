import React from "react";
import "./Disease.scss";

import InputText from "./InputText";
import ContextMenu from "./ContextMenu";

import translation from "../../../translation";

interface DiseaseProps {
  data: {
    specificity: string;
    disease: string;
    allergies: string;
    addictions: string;
    selectedOption: string;
  };
  onChange: (field: string, value: any) => void;
}

const Disease: React.FC<DiseaseProps> = ({ data, onChange }) => {
    
  return (
    <div className="disease__component">
      <ContextMenu
        options={["A", "B", "AB", "O"]}
        selectedOption={data.selectedOption}
        onSelect={(selectedOption) =>
          onChange("selectedOption", selectedOption)
        }
      />

      <InputText
        value={data.specificity}
        title={translation["disease"]["specificity"]}
        placeholder={translation["disease"]["specificity"]}
        changeValue={(value) => onChange("specificity", value)}
      />
      <InputText
        value={data.disease}
        title={translation["disease"]["disease"]}
        placeholder={translation["disease"]["disease"]}
        changeValue={(value) => onChange("disease", value)}
      />
      <InputText
        value={data.allergies}
        title={translation["disease"]["allergies"]}
        placeholder={translation["disease"]["allergies"]}
        changeValue={(value) => onChange("allergies", value)}
      />
      <InputText
        value={data.addictions}
        title={translation["disease"]["addictions"]}
        placeholder={translation["disease"]["addictions"]}
        changeValue={(value) => onChange("addictions", value)}
      />
    </div>
  );
};

export default Disease;
