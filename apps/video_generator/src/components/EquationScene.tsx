import React from "react";
import { AbsoluteFill, Audio, staticFile } from "remotion";
import { EquationCompound, WordAlignment } from "../data/schema";

export const EquationScene: React.FC<{
  reactants: EquationCompound[];
  products: EquationCompound[];
  focusSide: "none" | "lhs" | "rhs" | "both";
  focusElement?: string;
  audio?: string;
  alignments?: WordAlignment[];
}> = ({ reactants, products, focusSide, audio }) => {
  const renderCompound = (compound: EquationCompound) => {
    return (
      <span style={{ margin: "0 10px" }}>
        {compound.coefficient > 1 ? (
          <span style={{ color: "#ff4d4f", fontSize: "1.2em" }}>{compound.coefficient}</span>
        ) : null}
        {compound.formula}
      </span>
    );
  };

  const renderSide = (compounds: EquationCompound[], side: "lhs" | "rhs") => {
    const isFocused = focusSide === side || focusSide === "both";
    const opacity = focusSide === "none" || isFocused ? 1 : 0.4;
    return (
      <div style={{ display: "flex", alignItems: "center", opacity }}>
        {compounds.map((c, i) => (
          <React.Fragment key={i}>
            {renderCompound(c)}
            {i < compounds.length - 1 && <span style={{ margin: "0 10px" }}>+</span>}
          </React.Fragment>
        ))}
      </div>
    );
  };

  return (
    <AbsoluteFill style={{ backgroundColor: "#1A1A1A", justifyContent: "center", alignItems: "center" }}>
      {audio && <Audio src={staticFile(audio)} />}
      <div style={{ display: "flex", fontSize: 60, color: "white", fontFamily: "Outfit, sans-serif" }}>
        {renderSide(reactants, "lhs")}
        <span style={{ margin: "0 40px", color: "#61dafb" }}>→</span>
        {renderSide(products, "rhs")}
      </div>
    </AbsoluteFill>
  );
};
