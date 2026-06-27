import "./index.css";
import { Composition } from "remotion";
import { MyComposition } from "./Composition";
import { VideoSchema, VideoData } from "./data/schema";
import defaultData from "./data/electricity/01_introduction.json";

export const RemotionRoot: React.FC = () => {
  return (
    <>
      <Composition
        id="ElectricityIntro"
        component={MyComposition}
        durationInFrames={defaultData.durationInFrames}
        fps={defaultData.fps}
        width={1920}
        height={1080}
        schema={VideoSchema}
        defaultProps={defaultData as unknown as VideoData}
      />
    </>
  );
};
