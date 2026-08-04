import { z } from "zod";

export const WordAlignmentSchema = z.object({
  word: z.string(),
  start: z.number(),
  end: z.number(),
});

export const DiagramComponentSchema = z.object({
  id: z.string(),
  type: z.enum(["battery", "switch", "ammeter", "bulb", "resistor", "voltmeter"]),
  x: z.number(),
  y: z.number(),
  label: z.string().optional(),
});

export const DiagramWireSchema = z.object({
  id: z.string(),
  points: z.array(z.tuple([z.number(), z.number()])),
});

const EquationCompoundSchema = z.object({
  formula: z.string(), // e.g. H2O
  coefficient: z.number().default(1),
  state: z.string().optional(), // e.g. (g), (aq)
});

export const BoardExamSchema = z.object({
  repeated: z.number(),
  years: z.array(z.string()),
  marks: z.number().optional(),
});

const EquationSceneSchema = z.object({
  id: z.string(),
  type: z.literal("equation"),
  durationInFrames: z.number(),
  content: z.object({
    reactants: z.array(EquationCompoundSchema),
    products: z.array(EquationCompoundSchema),
    focusSide: z.enum(["none", "lhs", "rhs", "both"]).default("none"),
    focusElement: z.string().optional(),
  }),
  teacherScript: z.string().optional(),
  audio: z.string().optional(),
  alignments: z.array(WordAlignmentSchema).optional(),
  boardExam: BoardExamSchema.optional(),
});

const ActivitySceneSchema = z.object({
  id: z.string(),
  type: z.literal("activity"),
  durationInFrames: z.number(),
  content: z.object({
    activityName: z.string(),
    description: z.string(),
    animationType: z.enum(["magnesium_burn", "zinc_acid", "lead_nitrate", "quicklime_water", "iron_copper_sulphate", "electrolysis"]),
  }),
  teacherScript: z.string().optional(),
  audio: z.string().optional(),
  alignments: z.array(WordAlignmentSchema).optional(),
  boardExam: BoardExamSchema.optional(),
});


const TitleSceneSchema = z.object({
  id: z.string(),
  type: z.literal("title"),
  durationInFrames: z.number(),
  content: z.object({
    text: z.string(),
    subtitle: z.string().optional(),
  }),
  teacherScript: z.string().optional(),
  audio: z.string().optional(),
  alignments: z.array(WordAlignmentSchema).optional(),
  boardExam: BoardExamSchema.optional(),
});

const KineticSceneSchema = z.object({
  id: z.string(),
  type: z.literal("kinetic_typography"),
  durationInFrames: z.number(),
  content: z.object({
    text: z.string(),
  }),
  teacherScript: z.string().optional(),
  audio: z.string().optional(),
  alignments: z.array(WordAlignmentSchema).optional(),
  boardExam: BoardExamSchema.optional(),
});

const TextSceneSchema = z.object({
  id: z.string(),
  type: z.literal("text"),
  durationInFrames: z.number(),
  content: z.object({
    heading: z.string(),
    bullets: z.array(z.string()),
    imageUrl: z.string().optional(),
  }),
  teacherScript: z.string().optional(),
  audio: z.string().optional(),
  alignments: z.array(WordAlignmentSchema).optional(),
  boardExam: BoardExamSchema.optional(),
});

const DiagramSceneSchema = z.object({
  id: z.string(),
  type: z.literal("diagram"),
  durationInFrames: z.number(),
  content: z.object({
    title: z.string(),
    subtitle: z.string().optional(),
    components: z.array(DiagramComponentSchema).optional(),
    wires: z.array(DiagramWireSchema).optional(),
  }),
  teacherScript: z.string().optional(),
  audio: z.string().optional(),
  alignments: z.array(WordAlignmentSchema).optional(),
  boardExam: BoardExamSchema.optional(),
});

export const ConversationMessageSchema = z.object({
  speaker: z.string(),
  role: z.string(),
  text: z.string(),
  avatarUrl: z.string().optional(),
});

const ConversationSceneSchema = z.object({
  id: z.string(),
  type: z.literal("conversation"),
  durationInFrames: z.number(),
  content: z.object({
    messages: z.array(ConversationMessageSchema),
    imageUrl: z.string().optional(),
  }),
  audio: z.string().optional(),
  alignments: z.array(WordAlignmentSchema).optional(),
  boardExam: BoardExamSchema.optional(),
});

const RayDiagramSceneSchema = z.object({
  id: z.string(),
  type: z.literal("ray_diagram"),
  durationInFrames: z.number(),
  content: z.object({
    title: z.string(),
    subtitle: z.string().optional(),
    objectPosition: z.enum(["beyond_2f", "at_2f", "between_f_2f", "at_f", "between_f_o"]).optional(),
    // Animation program for the ray diagram. Each variant draws exactly the
    // rays described by its teacherScript narration:
    //  - full:              parallel->F2 + through-O rays, image forms (default)
    //  - focus_convergence: multiple top/bottom parallel rays converging at F2
    //                      + lens bulging thin->fat while its shape is narrated
    //  - shortcut1:         only the parallel ray bending through F2
    //  - shortcut2:         only the straight-through-O ray
    //  - shortcut3:         only the ray through F1 exiting parallel
    //  - inversion:         candle spanning axis, flame ray down + base ray up,
    //                       crossing at F2, inverted image (flame at bottom)
    //  - converging:        intro: scattered rays from left bend inward and
    //                       meet at ONE glowing spot (F2)
    //  - guides:            live-draw the two fundamental guides with the
    //                       narration: Principal Axis draws first, then the
    //                       lens, then the Optical Center O bullseye, then
    //                       Focal Points F1/F2 pop in labelled
    variant: z
      .enum(["full", "focus_convergence", "shortcut1", "shortcut2", "shortcut3", "inversion", "converging", "guides"])
      .optional(),
  }),
  teacherScript: z.string().optional(),
  audio: z.string().optional(),
  alignments: z.array(WordAlignmentSchema).optional(),
  boardExam: BoardExamSchema.optional(),
});

const MagneticSceneSchema = z.object({
  id: z.string(),
  type: z.literal("magnetic"),
  durationInFrames: z.number(),
  content: z.object({
    title: z.string(),
    subtitle: z.string().optional(),
    // Animation program; each variant draws exactly what its teacherScript
    // narration describes, phrase-timed like RayDiagramScene:
    //  - intro:             roadmap board: 'IN THIS VIDEO' + numbered topic
    //                       chips popping as each topic is narrated
    //  - oersted:            wire + compass needle deflecting (hook)
    //  - bar_magnet:         field lines around a bar magnet, closed loops
    //  - straight_conductor: concentric circular field lines + right-hand rule
    //  - solenoid:           coil, uniform inside field, bar-magnet pattern
    //  - electromagnet:      solenoid + soft iron core, pins stick/drop
    //  - fleming:            force on conductor + left-hand rule hand
    //  - induction:          magnet moving in/out of coil + galvanometer
    //  - motor_generator:    motor vs generator comparison
    variant: z
      .enum(["intro", "oersted", "bar_magnet", "straight_conductor", "solenoid", "electromagnet", "fleming", "induction", "motor_generator"])
      .optional(),
  }),
  teacherScript: z.string().optional(),
  audio: z.string().optional(),
  alignments: z.array(WordAlignmentSchema).optional(),
  boardExam: BoardExamSchema.optional(),
});

export const VideoSchema = z.object({
  id: z.string(),
  title: z.string(),
  durationInFrames: z.number(),
  fps: z.number().default(30),
  scenes: z.array(
    z.discriminatedUnion("type", [
      TitleSceneSchema,
      KineticSceneSchema,
      TextSceneSchema,
      DiagramSceneSchema,
      EquationSceneSchema,
      ActivitySceneSchema,
      ConversationSceneSchema,
      RayDiagramSceneSchema,
      MagneticSceneSchema,
    ])
  ),
});

export type VideoData = z.infer<typeof VideoSchema>;
export type WordAlignment = z.infer<typeof WordAlignmentSchema>;
export type DiagramComponent = z.infer<typeof DiagramComponentSchema>;
export type DiagramWire = z.infer<typeof DiagramWireSchema>;
export type EquationCompound = z.infer<typeof EquationCompoundSchema>;
export type ConversationMessage = z.infer<typeof ConversationMessageSchema>;
