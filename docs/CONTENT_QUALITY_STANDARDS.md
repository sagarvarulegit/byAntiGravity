# CBSE Content Quality Standards

Every piece of learning content on this platform must meet these standards. This is non-negotiable.

---

## 1. Language: Simple English First

- Write for a Class 8 reading level, not Class 10
- Short sentences. One idea per sentence. Max 20 words per sentence
- No passive voice. Active voice always
- Replace complex words with simple ones:
  - "utilize" → "use"
  - "demonstrate" → "show"
  - "approximately" → "about"
  - "consequently" → "so"
  - "subsequently" → "then"
  - "facilitate" → "help"

### Test: Can a weak student read this aloud and understand it on first try?
If no → rewrite.

---

## 2. Engagement: Hook First, Explain Later

Every chapter opens with a hook:
- A real-life story or situation
- A surprising fact
- A question that makes the student curious

Example (bad): "Electricity is the flow of electric charge."
Example (good): "You flip a switch. A light turns on. But what just happened inside the wire? Let's find out."

---

## 3. Academic Jargon: Dictionary Pop-ups

Technical terms MUST be:
1. **Bold** on first use
2. Immediately followed by a simple explanation in parentheses
3. Implemented as a tappable pop-up modal (Flutter: `showDialog` with term + simple definition + example)

Implementation pattern:
```dart
// Each bold term is wrapped in a tappable widget
GestureDetector(
  onTap: () => showJargonModal(context, term: "Electric Current", 
    definition: "The flow of electric charge through a wire. Think of it like water flowing through a pipe.", 
    example: "When you turn on a fan, electric current flows from the switch to the fan motor."),
  child: Text("**Electric Current**", style: boldLinkStyle),
)
```

---

## 4. Comic-Style Chapter Recap

At the END of every chapter, include a comic-style visual recap.
Inspired by **Head First Design Patterns** — not childish, but visually memorable.

### Format:
- 3-4 panel comic strip
- Characters: Two students (Priya & Rahul) discussing the chapter
- Dialogue style: conversational, funny, memorable
- Each panel covers ONE key concept
- Ends with a "Remember This!" callout

### Example (Electricity chapter):

```
┌────────────────────────────────────────────┐
│ PANEL 1:                                   │
│ Priya: "So current is just electrons       │
│         moving through a wire?"            │
│ Rahul: "Exactly! Like water in a pipe.     │
│         More pressure = more flow."       │
├────────────────────────────────────────────┤
│ PANEL 2:                                   │
│ Priya: "And voltage is the pressure?"      │
│ Rahul: "Yes! Battery = water pump."        │
├────────────────────────────────────────────┤
│ PANEL 3:                                   │
│ Priya: "What about resistance?"            │
│ Rahul: "That's the pipe getting narrow.    │
│         Electrons have to squeeze through."│
├────────────────────────────────────────────┤
│ 📌 REMEMBER THIS!                          │
│ V = I × R                                  │
│ Voltage pushes, current flows,             │
│ resistance fights back.                    │
└────────────────────────────────────────────┘
```

### Implementation:
- Render as a styled widget in Flutter (not an image — text-based, theme-adaptive)
- Use speech bubble containers with character avatars
- Dark/light mode compatible
- Placed AFTER the quick revision summary, BEFORE the quiz

---

## 5. Content Structure (Per Chapter)

```
1. 🎯 Chapter Goal (1-2 sentences)
2. 🪝 Hook (real-life story/question)
3. 📖 Concept 1 → simple explanation → example → jargon pop-up
4. 📖 Concept 2 → ...
5. 📖 Concept 3 → ...
6. ⚠️ Common Mistakes (3-5 bullet points)
7. 💡 Memory Tricks (mnemonics, analogies)
8. 📝 Quick Practice (2-3 rapid-fire questions with answers)
9. 🎓 Board Tips (what examiners look for)
10. 🔄 One-Minute Revision (5 bullet summary)
11. 🎬 Comic Recap (Priya & Rahul, 3-4 panels)
```

---

## 6. Content Audit Checklist

Before any note goes live, verify:
- [ ] Reading level: Class 8 or below
- [ ] Every sentence: single idea, max 20 words
- [ ] Every jargon term: bold + simple explanation + (future) pop-up
- [ ] Hook present at chapter start
- [ ] Comic recap present at chapter end
- [ ] No passive voice
- [ ] Examples come immediately after concepts
- [ ] Weak student would understand on first read

---

## 7. Pop-Up Jargon Modal Spec

| Property | Value |
|---|---|
| Trigger | Tap on bold/academic term |
| Content | Term, simple definition (1 sentence), real-world example (1 sentence) |
| Style | NCERT-themed (Georgia font, cream background) |
| Dismiss | Tap outside or close button |
| Implementation | `showDialog` with `AlertDialog` or custom `ModalBottomSheet` |

### Technical terms to tag for pop-ups:
- All bold terms in notes
- Words longer than 8 chars that are subject-specific
- Any Latin/Greek origin terms
- Formula variables (V, I, R, etc.)
