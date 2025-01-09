import React, { useState } from "react";
import { fetchNui } from "../utils/fetchNui";

import InputText from "./InputText";
import ButtonChoice from "./ButtonChoice";

import translation from "../../../translation";

interface IdentityProps {
  data: {
    sexe: string;
    lastname: string;
    firstname: string;
    nationality: string;
    birthdate: string;
  };
  onChange: (field: string, value: any) => void;
}

const IdentityComponent: React.FC<IdentityProps> = ({ data, onChange }) => {  

  return (
    <>
      <div className="identity__component">
        <ButtonChoice
          title={translation["identity"]["sex"]}
          defaultValue={data.sexe}
          buttonChoice={[
            { type: "male", label: translation["identity"]["male"], logo: "../images/buttons/male.svg" },
            { type: "female", label: translation["identity"]["female"], logo: "../images/buttons/female.svg" },
          ]}
          changeChoice={(value) => {onChange('sexe', value); fetchNui("change", {type: "sex", new: (value === "male" ? 0 : 1)})}}
        />

        <InputText
          type="text"
          title={translation["identity"]["lastname"]}
          placeholder={translation["identity"]["lastname"]}
          value={data.lastname}
          changeValue={(value) => onChange('lastname', value)}
        />

        <InputText
          type="text"
          title={translation["identity"]["firstname"]}
          placeholder={translation["identity"]["firstname"]}
          value={data.firstname}
          changeValue={(value) => onChange('firstname', value)}
        />

        <InputText
          type="text"
          title={translation["identity"]["nationality"]}
          placeholder={translation["identity"]["nationality"]}
          value={data.nationality}
          changeValue={(value) => onChange('nationality', value)}
        />

        <InputText
          type="date"
          title={translation["identity"]["birthdate"]}
          placeholder=""
          value={data.birthdate}
          changeValue={(value) => onChange('birthdate', value)}
        />
      </div>
    </>
  );
};

export default IdentityComponent;
