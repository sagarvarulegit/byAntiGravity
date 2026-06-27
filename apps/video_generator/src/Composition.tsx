import React from "react";
import { Audio, staticFile } from "remotion";
import { TransitionSeries, linearTiming } from "@remotion/transitions";
import { slide } from "@remotion/transitions/slide";
import { VideoData } from "./data/schema";
import { TitleScene } from "./components/TitleScene";
import { TextScene } from "./components/TextScene";
import { KineticTypographyScene } from "./components/KineticTypographyScene";
import { DiagramScene } from "./components/DiagramScene";
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
