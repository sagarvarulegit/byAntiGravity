import "./index.css";
import { Composition } from "remotion";
import { MyComposition, FullChapterComposition } from "./Composition";
import { VideoSchema, VideoData } from "./data/schema";
import defaultData from "./data/electricity/01_introduction.json";
import scienceCh1Part1 from "./data/science/ch1_part1.json";
import scienceCh1Part2 from "./data/science/ch1_part2.json";
import scienceCh1Part3 from "./data/science/ch1_part3.json";
import { CombinationAnimation } from "./components/CombinationAnimation";

import electricityOhmsLaw from "./data/electricity/03_ohms_law.json";
import parallelTrap from "./data/electricity/10_parallel_resistance_trap.json";
import lightRayDiagrams from "./data/light/01_ray_diagrams.json";
import lightLensFormula from "./data/light/02_lens_formula_trick.json";
import acidsZincTest from "./data/acids/01_zinc_pop_test.json";
import magneticEffects from "./data/magnetic/01_magnetic_effects.json";
import { ReelComposition } from "./components/ReelComposition";

import mathsLighthouseMasterclass from "./data/maths/01_trigonometry_lighthouse.json";
import mathsLighthouseShort from "./data/maths/02_trigonometry_lighthouse_short.json";
import mathsTrigHandTrickShort from "./data/maths/04_trigonometry_hand_trick_short.json";

export const RemotionRoot: React.FC = () => {
  // Helper to calculate true duration by accounting for the 15-frame overlaps in TransitionSeries
  const getActualDuration = (data: VideoData) => {
    return data.durationInFrames - (data.scenes.length - 1) * 15;
  };

  const part1Duration = getActualDuration(scienceCh1Part1 as unknown as VideoData);
  const part2Duration = getActualDuration(scienceCh1Part2 as unknown as VideoData);
  const part3Duration = getActualDuration(scienceCh1Part3 as unknown as VideoData);
  const defaultDuration = getActualDuration(defaultData as unknown as VideoData);
  const ohmsLawDuration = getActualDuration(electricityOhmsLaw as unknown as VideoData);
  const parallelTrapDuration = getActualDuration(parallelTrap as unknown as VideoData);
  const lightMasterclassDuration = getActualDuration(lightRayDiagrams as unknown as VideoData);
  const lightReelDuration = getActualDuration(lightLensFormula as unknown as VideoData);
  const acidsZincTestDuration = getActualDuration(acidsZincTest as unknown as VideoData);
  const magneticEffectsDuration = getActualDuration(magneticEffects as unknown as VideoData);

  const mathsMasterclassDuration = getActualDuration(mathsLighthouseMasterclass as unknown as VideoData);
  const mathsShortDuration = getActualDuration(mathsLighthouseShort as unknown as VideoData);
  const mathsHandTrickDuration = getActualDuration(mathsTrigHandTrickShort as unknown as VideoData);

  return (
    <>
      <Composition
        id="LightRayDiagramMasterclass"
        component={MyComposition}
        durationInFrames={lightMasterclassDuration}
        fps={30}
        width={1920}
        height={1080}
        schema={VideoSchema}
        defaultProps={lightRayDiagrams as unknown as VideoData}
      />
      <Composition
        id="LightLensFormulaReel"
        component={ReelComposition}
        durationInFrames={lightReelDuration}
        fps={30}
        width={1080}
        height={1920}
        schema={VideoSchema}
        defaultProps={lightLensFormula as unknown as VideoData}
      />
      <Composition
        id="AcidsZincTestMasterclass"
        component={MyComposition}
        durationInFrames={acidsZincTestDuration}
        fps={30}
        width={1920}
        height={1080}
        schema={VideoSchema}
        defaultProps={acidsZincTest as unknown as VideoData}
      />
      <Composition
        id="MagneticEffectsMasterclass"
        component={MyComposition}
        durationInFrames={magneticEffectsDuration}
        fps={30}
        width={1920}
        height={1080}
        schema={VideoSchema}
        defaultProps={magneticEffects as unknown as VideoData}
      />
      <Composition
        id="ElectricityOhmsLawMasterclass"
        component={MyComposition}
        durationInFrames={ohmsLawDuration}
        fps={30}
        width={1920}
        height={1080}
        schema={VideoSchema}
        defaultProps={electricityOhmsLaw as unknown as VideoData}
      />
      <Composition
        id="ElectricityParallelTrapReel"
        component={ReelComposition}
        durationInFrames={parallelTrapDuration}
        fps={30}
        width={1080}
        height={1920}
        schema={VideoSchema}
        defaultProps={parallelTrap as unknown as VideoData}
      />

      <Composition
        id="MathsLighthouseMasterclass"
        component={MyComposition}
        durationInFrames={mathsMasterclassDuration}
        fps={30}
        width={1920}
        height={1080}
        schema={VideoSchema}
        defaultProps={mathsLighthouseMasterclass as unknown as VideoData}
      />
      <Composition
        id="MathsLighthouseShort"
        component={ReelComposition}
        durationInFrames={mathsShortDuration}
        fps={30}
        width={1080}
        height={1920}
        schema={VideoSchema}
        defaultProps={mathsLighthouseShort as unknown as VideoData}
      />
      <Composition
        id="MathsTrigHandTrickShort"
        component={ReelComposition}
        durationInFrames={mathsHandTrickDuration}
        fps={30}
        width={1080}
        height={1920}
        schema={VideoSchema}
        defaultProps={mathsTrigHandTrickShort as unknown as VideoData}
      />
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

