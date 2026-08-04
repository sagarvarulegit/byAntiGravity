import React from "react";
import { TransitionSeries, linearTiming } from "@remotion/transitions";
import { slide } from "@remotion/transitions/slide";
import { VideoData } from "./data/schema";
import { TitleScene } from "./components/TitleScene";
import { TextScene } from "./components/TextScene";
import { KineticTypographyScene } from "./components/KineticTypographyScene";
import { DiagramScene } from "./components/DiagramScene";
import { EquationScene } from "./components/EquationScene";
import { ActivityScene } from "./components/ActivityScene";
import { ConversationScene } from "./components/ConversationScene";
import { RayDiagramScene } from "./components/RayDiagramScene";
import { MagneticScene } from "./components/MagneticScene";
import { BoardExamHighlight } from "./components/BoardExamHighlight";
import defaultData from "./data/electricity/01_introduction.json";

export const MyComposition: React.FC<VideoData> = (props) => {
  // Fall back to defaultData if props are not fully populated
  const data = props && props.id ? props : (defaultData as unknown as VideoData);

  return (
    <>
      <TransitionSeries>
        {data.scenes.map((scene, idx) => {
          return (
            <React.Fragment key={scene.id}>
              <TransitionSeries.Sequence durationInFrames={scene.durationInFrames}>
                {scene.type === "title" && (
                  <TitleScene
                    title={scene.content.text}
                    subtitle={scene.content.subtitle}
                    audio={scene.audio}
                    alignments={scene.alignments}
                  />
                )}
                {scene.type === "kinetic_typography" && (
                  <KineticTypographyScene
                    text={scene.content.text}
                    audio={scene.audio}
                    alignments={scene.alignments}
                  />
                )}
                {scene.type === "text" && (
                  <TextScene
                    heading={scene.content.heading}
                    bullets={scene.content.bullets}
                    audio={scene.audio}
                    alignments={scene.alignments}
                    imageUrl={scene.content.imageUrl}
                  />
                )}
                {scene.type === "diagram" && (
                  <DiagramScene
                    title={scene.content.title}
                    subtitle={scene.content.subtitle}
                    audio={scene.audio}
                    components={scene.content.components}
                    wires={scene.content.wires}
                  />
                )}
                {scene.type === "equation" && (
                  <EquationScene
                    reactants={scene.content.reactants}
                    products={scene.content.products}
                    focusSide={scene.content.focusSide}
                    focusElement={scene.content.focusElement}
                    audio={scene.audio}
                    alignments={scene.alignments}
                  />
                )}
                {scene.type === "activity" && (
                  <ActivityScene
                    activityName={scene.content.activityName}
                    description={scene.content.description}
                    animationType={scene.content.animationType}
                    audio={scene.audio}
                    alignments={scene.alignments}
                  />
                )}
                {scene.type === "conversation" && (
                  <ConversationScene
                    messages={scene.content.messages}
                    imageUrl={"imageUrl" in scene.content ? scene.content.imageUrl : undefined}
                    audio={scene.audio}
                    alignments={scene.alignments}
                  />
                )}
                {scene.type === "ray_diagram" && (
                  <RayDiagramScene
                    title={scene.content.title}
                    subtitle={scene.content.subtitle}
                    audio={scene.audio}
                    objectPosition={scene.content.objectPosition}
                    variant={scene.content.variant}
                    alignments={scene.alignments}
                    teacherScript={scene.teacherScript}
                  />
                )}
                {scene.type === "magnetic" && (
                  <MagneticScene
                    title={scene.content.title}
                    subtitle={scene.content.subtitle}
                    audio={scene.audio}
                    variant={scene.content.variant}
                    alignments={scene.alignments}
                    teacherScript={scene.teacherScript}
                  />
                )}
                {scene.boardExam && (
                  <BoardExamHighlight
                    repeated={scene.boardExam.repeated}
                    years={scene.boardExam.years}
                    marks={scene.boardExam.marks}
                  />
                )}
              </TransitionSeries.Sequence>
              {idx < data.scenes.length - 1 && (
                <TransitionSeries.Transition
                  presentation={slide({ direction: "from-right" })}
                  timing={linearTiming({ durationInFrames: 15 })}
                />
              )}
            </React.Fragment>
          );
        })}
      </TransitionSeries>
    </>
  );
};

import { Series, AbsoluteFill } from "remotion";
import { AppColors } from "./theme";

export const FullChapterComposition: React.FC<{ parts: VideoData[] }> = ({ parts }) => {
  const PAUSE_FRAMES = 120; // 4 seconds pause
  
  const sequences: React.ReactNode[] = [];
  parts.forEach((part, index) => {
    // TransitionSeries overlaps each scene by 15 frames
    const actualDuration = part.durationInFrames - (part.scenes.length - 1) * 15;

    sequences.push(
      <Series.Sequence key={`part-${index}`} durationInFrames={actualDuration}>
        <MyComposition {...part} />
      </Series.Sequence>
    );
    if (index < parts.length - 1) {
      sequences.push(
        <Series.Sequence key={`pause-${index}`} durationInFrames={PAUSE_FRAMES}>
          <AbsoluteFill style={{ backgroundColor: AppColors.bgLight }} />
        </Series.Sequence>
      );
    }
  });

  return <Series>{sequences}</Series>;
};
