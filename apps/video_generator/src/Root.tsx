import "./index.css";
import { Composition } from "remotion";
import { MyComposition, FullChapterComposition } from "./Composition";
import { VideoSchema, VideoData } from "./data/schema";
import defaultData from "./data/electricity/01_introduction.json";
import scienceCh1Part1 from "./data/science/ch1_part1.json";
import scienceCh1Part2 from "./data/science/ch1_part2.json";
import scienceCh1Part3 from "./data/science/ch1_part3.json";
import { CombinationAnimation } from "./components/CombinationAnimation";

export const RemotionRoot: React.FC = () => {
  // Helper to calculate true duration by accounting for the 15-frame overlaps in TransitionSeries
  const getActualDuration = (data: VideoData) => {
    return data.durationInFrames - (data.scenes.length - 1) * 15;
  };

  const part1Duration = getActualDuration(scienceCh1Part1 as unknown as VideoData);
  const part2Duration = getActualDuration(scienceCh1Part2 as unknown as VideoData);
  const part3Duration = getActualDuration(scienceCh1Part3 as unknown as VideoData);
  const defaultDuration = getActualDuration(defaultData as unknown as VideoData);

  return (
    <>
      <Composition
        id="ScienceCh1Full"
        component={FullChapterComposition}
        durationInFrames={part1Duration + part2Duration + part3Duration + 240}
        fps={30}
        width={1920}
        height={1080}
        defaultProps={{ parts: [scienceCh1Part1 as unknown as VideoData, scienceCh1Part2 as unknown as VideoData, scienceCh1Part3 as unknown as VideoData] }}
      />
      <Composition
        id="ScienceCh1Part1"
        component={MyComposition}
        durationInFrames={part1Duration}
        fps={scienceCh1Part1.fps}
        width={1920}
        height={1080}
        schema={VideoSchema}
        defaultProps={scienceCh1Part1 as unknown as VideoData}
      />
      <Composition
        id="ElectricityIntro"
        component={MyComposition}
        durationInFrames={defaultDuration}
        fps={defaultData.fps}
        width={1920}
        height={1080}
        schema={VideoSchema}
        defaultProps={defaultData as unknown as VideoData}
      />
      <Composition
        id="CombinationReaction"
        component={CombinationAnimation}
        durationInFrames={180}
        fps={30}
        width={800}
        height={600}
      />
    </>
  );
};

