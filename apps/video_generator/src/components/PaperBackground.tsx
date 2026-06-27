import React from "react";
import { AppColors } from "../theme";

export const PaperBackground: React.FC = () => {
  return (
    <div
      style={{
        position: "absolute",
        top: 0,
        left: 0,
        right: 0,
        bottom: 0,
        backgroundColor: AppColors.bgLight,
        backgroundImage: `
          linear-gradient(rgba(2, 132, 199, 0.08) 1px, transparent 1px),
          linear-gradient(90deg, rgba(2, 132, 199, 0.08) 1px, transparent 1px)
        `,
        backgroundSize: "40px 40px",
        display: "flex",
        flexDirection: "column",
        justifyContent: "center",
        alignItems: "center",
      }}
    >
      {/* Red margin line typical of NCERT/notebook styling */}
      <div
        style={{
          position: "absolute",
          top: 0,
          left: "80px",
          bottom: 0,
          width: "2px",
          backgroundColor: `${AppColors.purple}33`, // magenta with opacity
        }}
      />
    </div>
  );
};
